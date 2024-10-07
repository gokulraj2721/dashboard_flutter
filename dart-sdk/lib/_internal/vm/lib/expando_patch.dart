// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of "core_patch.dart";

// This function takes care of rehashing of the expandos in [objects]. We
// do this eagerly after snapshot deserialization.
@pragma("vm:entry-point", "call")
void _rehashObjects(List objects) {
  final int length = objects.length;
  for (int i = 0; i < length; ++i) {
    unsafeCast<Expando>(objects[i])._rehash();
  }
}

@patch
@pragma("vm:entry-point")
class Expando<T> {
  @patch
  Expando([String? name])
      : name = name,
        _data = List<_WeakProperty?>.filled(_minSize, null),
        _used = 0;

  static const _minSize = 8;
  static final _deletedEntry = _WeakProperty();

  @patch
  T? operator [](Object object) {
    checkValidWeakTarget(object, 'object');

    var mask = _size - 1;
    var idx = object._identityHashCode & mask;
    var wp = _data[idx];

    while (wp != null) {
      if (identical(wp.key, object)) {
        return unsafeCast<T?>(wp.value);
      } else if (wp.key == null) {
        // This entry has been cleared by the GC.
        _data[idx] = _deletedEntry;
      }
      idx = (idx + 1) & mask;
      wp = _data[idx];
    }

    return null;
  }

  @patch
  void operator []=(Object object, T? value) {
    checkValidWeakTarget(object, 'object');

    var mask = _size - 1;
    var idx = object._identityHashCode & mask;
    var emptyIdx = -1;
    var wp = _data[idx];

    while (wp != null) {
      if (identical(wp.key, object)) {
        if (value != null) {
          // Update the associated value.
          wp.value = value;
        } else {
          // Mark the entry as deleted.
          _data[idx] = _deletedEntry;
        }
        return;
      } else if ((emptyIdx < 0) && identical(wp, _deletedEntry)) {
        emptyIdx = idx; // Insert at this location if not found.
      } else if (wp.key == null) {
        // This entry has been cleared by the GC.
        _data[idx] = _deletedEntry;
        if (emptyIdx < 0) {
          emptyIdx = idx; // Insert at this location if not found.
        }
      }
      idx = (idx + 1) & mask;
      wp = _data[idx];
    }

    if (value == null) {
      // Not entering a null value. We just needed to make sure to clear an
      // existing value if it existed.
      return;
    }

    if (emptyIdx >= 0) {
      // We will be reusing the empty slot below.
      _used--;
      idx = emptyIdx;
    }

    if (_used < _limit) {
      var ephemeron = _WeakProperty();
      ephemeron.key = object;
      ephemeron.value = value;
      _data[idx] = ephemeron;
      _used++;
      return;
    }

    // Grow/reallocate if too many slots have been used.
    _rehash();
    this[object] = value; // Recursively add the value.
  }

  _rehash() {
    // Determine the population count of the map to allocate an appropriately
    // sized map below.
    var count = 0;
    var oldData = _data;
    var len = oldData.length;
    for (var i = 0; i < len; i++) {
      var entry = oldData[i];
      if ((entry != null) && (entry.key != null)) {
        // Only count non-cleared entries.
        count++;
      }
    }

    var newSize = _size;
    if (count <= (newSize >> 2)) {
      newSize = newSize >> 1;
    } else if (count > (newSize >> 1)) {
      newSize = newSize << 1;
    }
    newSize = (newSize < _minSize) ? _minSize : newSize;

    // Reset the mappings to empty so that we can just add the existing
    // valid entries.
    _data = List<_WeakProperty?>.filled(newSize, null);
    _used = 0;

    for (var i = 0; i < oldData.length; i++) {
      var entry = oldData[i];
      if (entry != null) {
        // Ensure that the entry.key is not cleared between checking for it and
        // inserting it into the new table.
        var val = entry.value;
        var key = entry.key;
        if (key != null) {
          this[key] = val;
        }
      }
    }
  }

  int get _size => _data.length;
  int get _limit => (3 * (_size ~/ 4));

  List<_WeakProperty?> _data;
  int _used; // Number of used (active and deleted) slots.
}

@patch
class WeakReference<T extends Object> {
  @patch
  factory WeakReference(T target) = _WeakReference<T>;
}

@pragma("vm:entry-point")
class _WeakReference<T extends Object> implements WeakReference<T> {
  _WeakReference(T target) {
    checkValidWeakTarget(target, 'target');
    _target = target;
  }

  @pragma("vm:recognized", "other")
  @pragma("vm:prefer-inline")
  @pragma("vm:external-name", "WeakReference_getTarget")
  external T? get target;

  @pragma("vm:recognized", "other")
  @pragma("vm:prefer-inline")
  @pragma("vm:external-name", "WeakReference_setTarget")
  external set _target(T? value);
}
