// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of dart._js_helper;

base class IdentityMap<K, V> extends InternalMap<K, V> {
  @override
  final _map = JS('', 'new Map()');

  // We track the number of modifications done to the key set of the
  // hash map to be able to throw when the map is modified while being
  // iterated over.
  //
  // Value cycles after 2^30 modifications so that modification counts are
  // always unboxed (Smi) values. Modification detection will be missed if you
  // make exactly some multiple of 2^30 modifications between advances of an
  // iterator.
  @override
  @notNull
  int _modifications = 0;

  IdentityMap();
  IdentityMap.from(JSArray entries) {
    var map = _map;
    for (int i = 0, n = JS<int>('!', '#.length', entries); i < n; i += 2) {
      JS('', '#.set(#[#], #[#])', map, entries, i, entries, i + 1);
    }
  }

  @override
  int get length => JS<int>('!', '#.size', _map);
  @override
  bool get isEmpty => JS<bool>('!', '#.size == 0', _map);
  @override
  bool get isNotEmpty => JS<bool>('!', '#.size != 0', _map);

  @override
  Iterable<K> get keys => _JSMapIterable<K>(this, true);
  @override
  Iterable<V> get values => _JSMapIterable<V>(this, false);

  @override
  bool containsKey(Object? key) {
    return JS<bool>('!', '#.has(#)', _map, key);
  }

  @override
  bool containsValue(Object? value) {
    for (var v in JS('', '#.values()', _map)) {
      if (v == value) return true;
    }
    return false;
  }

  @override
  void addAll(Map<K, V> other) {
    if (other.isNotEmpty) {
      var map = _map;
      other.forEach((key, value) {
        JS('', '#.set(#, #)', map, key, value);
      });
      _modifications = (_modifications + 1) & 0x3fffffff;
    }
  }

  @override
  V? operator [](Object? key) {
    V value = JS('', '#.get(#)', _map, key);
    // coerce undefined to null.
    return JS<bool>('!', '# === void 0', value) ? null : value;
  }

  @override
  void operator []=(K key, V value) {
    var map = _map;
    int length = JS('!', '#.size', map);
    JS('', '#.set(#, #)', map, key, value);
    if (length != JS<int>('!', '#.size', map)) {
      _modifications = (_modifications + 1) & 0x3fffffff;
    }
  }

  @override
  V putIfAbsent(K key, V Function() ifAbsent) {
    if (JS<bool>('!', '#.has(#)', _map, key)) {
      return JS('', '#.get(#)', _map, key);
    }
    V value = ifAbsent();
    if (value == null) JS('', '# = null', value);
    JS('', '#.set(#, #)', _map, key, value);
    _modifications = (_modifications + 1) & 0x3fffffff;
    return value;
  }

  @override
  V? remove(Object? key) {
    V value = JS('', '#.get(#)', _map, key);
    if (JS<bool>('!', '#.delete(#)', _map, key)) {
      _modifications = (_modifications + 1) & 0x3fffffff;
    }
    // coerce undefined to null.
    return JS<bool>('!', '# === void 0', value) ? null : value;
  }

  @override
  void clear() {
    if (JS<int>('!', '#.size', _map) > 0) {
      JS('', '#.clear()', _map);
      _modifications = (_modifications + 1) & 0x3fffffff;
    }
  }
}

class _JSMapIterable<E> extends EfficientLengthIterable<E>
    implements HideEfficientLengthIterable<E> {
  final InternalMap _map;
  @notNull
  final bool _isKeys;
  _JSMapIterable(this._map, this._isKeys);

  @override
  int get length => _map.length;
  @override
  bool get isEmpty => _map.isEmpty;
  @override
  bool get isNotEmpty => _map.isNotEmpty;

  @JSExportName('Symbol.iterator')
  _jsIterator() {
    var map = _map;
    var iterator =
        JS('', '# ? #.keys() : #.values()', _isKeys, map._map, map._map);
    int modifications = map._modifications;
    return JS(
        '',
        '''{
      next() {
        if (# != #) {
          throw #;
        }
        return #.next();
      }
    }''',
        modifications,
        map._modifications,
        ConcurrentModificationError(map),
        iterator);
  }

  @override
  Iterator<E> get iterator => DartIterator<E>(_jsIterator());

  @override
  bool contains(Object? element) =>
      _isKeys ? _map.containsKey(element) : _map.containsValue(element);

  @override
  void forEach(void Function(E) f) {
    for (var entry in this) {
      f(entry);
    }
  }
}
