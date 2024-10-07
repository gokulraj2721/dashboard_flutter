// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of _js_helper;

class ConstantMapView<K, V> extends UnmodifiableMapView<K, V>
    implements ConstantMap<K, V> {
  ConstantMapView(super.base);
}

abstract class ConstantMap<K, V> implements Map<K, V> {
  // Used to create unmodifiable maps from other maps.
  factory ConstantMap.from(Map other) {
    final keys = List<K>.from(other.keys);
    bool allStrings = true;
    for (var k in keys) {
      if (k is! String || '__proto__' == k) {
        allStrings = false;
        break;
      }
    }
    if (allStrings) {
      var object = JS('=Object', '{}');
      int index = 0;
      for (final k in keys) {
        V v = other[k];
        JS('void', '#[#] = #', object, k, index++);
      }
      final values = List<V>.from(other.values);
      final map =
          ConstantStringMap<K, V>._(object, JS<JSArray>('', '#', values));
      map._setKeys(keys);
      return map;
    }
    // TODO(lrn): Make a proper unmodifiable map implementation.
    return ConstantMapView<K, V>(Map.from(other));
  }

  const ConstantMap._();

  @override
  Map<RK, RV> cast<RK, RV>() => Map.castFrom<K, V, RK, RV>(this);
  @override
  bool get isEmpty => length == 0;

  @override
  bool get isNotEmpty => !isEmpty;

  @override
  String toString() => MapBase.mapToString(this);

  static Never _throwUnmodifiable() {
    throw UnsupportedError('Cannot modify unmodifiable Map');
  }

  @override
  void operator []=(K key, V value) {
    _throwUnmodifiable();
  }

  @override
  V putIfAbsent(K key, V Function() ifAbsent) {
    _throwUnmodifiable();
  }

  @override
  V? remove(Object? key) {
    _throwUnmodifiable();
  }

  @override
  void clear() {
    _throwUnmodifiable();
  }

  @override
  void addAll(Map<K, V> other) {
    _throwUnmodifiable();
  }

  @override
  Iterable<MapEntry<K, V>> get entries sync* {
    // `this[key]` has static type `V?` but is always `V`. Rather than `as V`,
    // we use `as dynamic` so the upcast requires no checking and the implicit
    // downcast to `V` will be discarded in production.
    for (var key in keys) {
      yield MapEntry<K, V>(key, this[key] as dynamic);
    }
  }

  @override
  void addEntries(Iterable<MapEntry<K, V>> entries) {
    for (var entry in entries) {
      this[entry.key] = entry.value;
    }
  }

  @override
  Map<K2, V2> map<K2, V2>(MapEntry<K2, V2> Function(K key, V value) transform) {
    var result = <K2, V2>{};
    forEach((K key, V value) {
      var entry = transform(key, value);
      result[entry.key] = entry.value;
    });
    return result;
  }

  @override
  V update(K key, V Function(V value) update, {V Function()? ifAbsent}) {
    _throwUnmodifiable();
  }

  @override
  void updateAll(V Function(K key, V value) update) {
    _throwUnmodifiable();
  }

  @override
  void removeWhere(bool Function(K key, V value) test) {
    _throwUnmodifiable();
  }
}

class ConstantStringMap<K, V> extends ConstantMap<K, V> {
  const ConstantStringMap._(this._jsIndex, this._values) : super._();

  // A ConstantStringMap is backed by a JavaScript Object mapping a String to an
  // index into the `_values` Array. This is valid only for keys where the order
  // of keys is preserved by JavaScript, either by one-at-a-time insertion or a
  // JavaScript Object initializer.
  final Object _jsIndex;
  final JSArray _values;

  @override
  int get length => _values.length;

  JSArray get _keys {
    var keys = JS('', r'#.$keys', this);
    if (keys == null) {
      keys = _keysFromIndex(_jsIndex);
      _setKeys(keys);
    }
    return JS('JSUnmodifiableArray', '#', keys);
  }

  ConstantStringMap<K, V> _setKeys(Object? keys) {
    JS('', r'#.$keys = #', this, keys);
    return this; // Allow chaining in JavaScript of constant pool code.
  }

  @override
  bool containsValue(Object? needle) {
    return _values.contains(needle);
  }

  @override
  bool containsKey(Object? key) {
    if (key is! String) return false;
    if ('__proto__' == key) return false;
    return jsHasOwnProperty(_jsIndex, key);
  }

  @override
  V? operator [](Object? key) {
    if (!containsKey(key)) return null;
    int index = JS('', '#[#]', _jsIndex, key);
    return JS('', '#[#]', _values, index);
  }

  @override
  void forEach(void Function(K key, V value) f) {
    final keys = _keys;
    final values = _values;
    for (int i = 0; i < keys.length; i++) {
      K key = JS('', '#[#]', keys, i);
      V value = JS('', '#[#]', values, i);
      f(key, value);
    }
  }

  @override
  Iterable<K> get keys => _KeysOrValues<K>(_keys);

  @override
  Iterable<V> get values => _KeysOrValues<V>(_values);
}

/// Converts a JavaScript index object to an untyped Array of the String keys.
///
/// The [index] is a JavaScript object used for lookup of String keys. The own
/// property names are the keys. The index object maps these names to a position
/// in the sequence of entries of the Map or elements of the Set. This is a
/// compact representation since the positions (values of the JavaScript
/// properties) are small integers.
//
/// For Sets we don't need the property values to be positions, but using the
/// same representation allows sharing of indexes between Map and Set constants
/// and allows the enhancement below.
JSArray _keysFromIndex(Object? index) {
  return JS('', 'Object.keys(#)', index);

  // Currently the compiler ensures that the JavaScript object literal has its
  // properties ordered so that the first one has value `0`, the second has
  // value `1`, etc. If the Dart collection's ordering cannot be expressed as a
  // JavaScript object (a problem only for String keys 'integers', e.g. `"1"`
  // following `"2"`), a different, more general representation is chosen.
  //
  // We could instead ensure that the keys are sorted by position by 'sorting'
  // the keys by the property value. This would be a single pass to assign keys
  // to their correct positions in a new Array.
}

/// An Iterable that wraps a JavaScript Array to provide a type and other
/// operations.
class _KeysOrValues<E> extends Iterable<E> {
  final JSArray _elements;
  _KeysOrValues(this._elements);

  @override
  int get length => _elements.length;
  @override
  bool get isEmpty => 0 == length;
  @override
  bool get isNotEmpty => 0 != length;

  @override
  _KeysOrValuesOrElementsIterator<E> get iterator =>
      _KeysOrValuesOrElementsIterator<E>(this._elements);
}

/// A typed Iterator over an untyped but unmodified Array.
class _KeysOrValuesOrElementsIterator<E> implements Iterator<E> {
  final JSArray _elements;
  final int _length;
  int _index = 0;
  E? _current;
  _KeysOrValuesOrElementsIterator(this._elements) : _length = _elements.length;

  @override
  E get current => _current as E;

  @override
  bool moveNext() {
    if (_index >= _length) {
      _current = null;
      return false;
    }
    _current = JS<E>('', '#[#]', _elements, _index);
    _index++;
    return true;
  }

  // This Iterator is rather like ArrayIterator. Could ArrayIterator be modified
  // so that we can use it instead? That might open the possibility of using the
  // special optimizations for for-in on Arrays. One problem is that here we are
  // wrapping Arrays that never change but there is no signal that they are
  // fixed length.
}

class GeneralConstantMap<K, V> extends ConstantMap<K, V> {
  // This constructor is not used.  The instantiation is shortcut by the
  // compiler. It is here to make the uninitialized final fields legal.
  GeneralConstantMap(this._jsData) : super._();

  // [_jsData] holds a key-value pair list.
  final _jsData;

  // We cannot create the backing map on creation since hashCode interceptors
  // have not been defined when constants are created. It is also not desirable
  // to add this execution cost to initial program load.
  Map<K, V> _getMap() {
    LinkedHashMap<K, V>? backingMap = JS('LinkedHashMap|Null', r'#.$map', this);
    if (backingMap == null) {
      backingMap = JsConstantLinkedHashMap<K, V>();
      fillLiteralMap(_jsData, backingMap);
      JS('', r'#.$map = #', this, backingMap);
    }
    return backingMap;
  }

  static bool Function(Object?) _typeTest<T>() => (Object? o) => o is T;

  @override
  bool containsValue(Object? needle) {
    return _getMap().containsValue(needle);
  }

  @override
  bool containsKey(Object? key) {
    return _getMap().containsKey(key);
  }

  @override
  V? operator [](Object? key) {
    return _getMap()[key];
  }

  @override
  void forEach(void Function(K key, V value) f) {
    _getMap().forEach(f);
  }

  @override
  Iterable<K> get keys {
    return _getMap().keys;
  }

  @override
  Iterable<V> get values {
    return _getMap().values;
  }

  @override
  int get length => _getMap().length;
}

abstract class ConstantSet<E> extends SetBase<E> {
  const ConstantSet();

  static Never _throwUnmodifiable() {
    throw UnsupportedError('Cannot modify constant Set');
  }

  @override
  void clear() {
    _throwUnmodifiable();
  }

  @override
  bool add(E value) {
    _throwUnmodifiable();
  }

  @override
  void addAll(Iterable<E> elements) {
    _throwUnmodifiable();
  }

  @override
  bool remove(Object? value) {
    _throwUnmodifiable();
  }

  @override
  void removeAll(Iterable<Object?> elements) {
    _throwUnmodifiable();
  }

  @override
  void removeWhere(bool Function(E element) test) {
    _throwUnmodifiable();
  }

  @override
  void retainAll(Iterable<Object?> elements) {
    _throwUnmodifiable();
  }

  @override
  void retainWhere(bool Function(E element) test) {
    _throwUnmodifiable();
  }
}

class ConstantStringSet<E> extends ConstantSet<E> {
  // A ConstantStringSet is backed by a JavaScript Object whose properties are
  // the elements of the Set. This is valid only for sets where the order of
  // elements is preserved by JavaScript, either by one-at-a-time insertion or a
  // JavaScript Object initializer.
  final Object? _jsIndex;
  final int _length;

  const ConstantStringSet(this._jsIndex, this._length);

  @override
  int get length => JS('JSUInt31', '#', _length);
  @override
  bool get isEmpty => _length == 0;
  @override
  bool get isNotEmpty => !isEmpty;

  JSArray get _keys {
    var keys = JS('', r'#.$keys', this);
    if (keys == null) {
      keys = _keysFromIndex(_jsIndex);
      _setKeys(keys);
    }
    return JS('JSUnmodifiableArray', '#', keys);
  }

  ConstantStringSet<E> _setKeys(Object? keys) {
    JS('', r'#.$keys = #', this, keys);
    return this; // Allow chaining in JavaScript of constant pool code.
  }

  @override
  Iterator<E> get iterator => _KeysOrValuesOrElementsIterator<E>(_keys);

  @override
  bool contains(Object? key) {
    if (key is! String) return false;
    if ('__proto__' == key) return false;
    return jsHasOwnProperty(_jsIndex, key);
  }

  @override
  E? lookup(Object? element) {
    // There is no way to tell the Set element from [element] for strings, so we
    // don't bother to return the stored element. If the set contains the
    // element, it must be of type `E`, so use `JS` for a free cast.
    return contains(element) ? JS('', '#', element) : null;
  }

  // TODO(sra): Use the `_keys` Array.
  @override
  Set<E> toSet() => Set.of(this);

  // Consider implementations of operations that can directly use the untyped
  // elements list.
  //
  //     List<E> toList({bool growable = true));
  //     String join([String separator = '']);
}

class GeneralConstantSet<E> extends ConstantSet<E> {
  final JSArray _elements;
  const GeneralConstantSet(this._elements);

  @override
  int get length => _elements.length;
  @override
  bool get isEmpty => length == 0;
  @override
  bool get isNotEmpty => !isEmpty;

  @override
  Iterator<E> get iterator => _KeysOrValuesOrElementsIterator(_elements);

  // We cannot create the backing map on creation since hashCode interceptors
  // have not been defined when constants are created. It is also not desirable
  // to add this execution cost to initial program load.
  Map<E, E> _getMap() {
    LinkedHashMap<E, E>? backingMap = JS('LinkedHashMap|Null', r'#.$map', this);
    if (backingMap == null) {
      backingMap = JsConstantLinkedHashMap<E, E>();
      for (final element in _elements) {
        E key = JS('', '#', element);
        backingMap[key] = key;
      }
      JS('', r'#.$map = #', this, backingMap);
    }
    return backingMap;
  }

  @override
  bool contains(Object? key) {
    return _getMap().containsKey(key);
  }

  @override
  E? lookup(Object? element) => _getMap()[element];

  @override
  Set<E> toSet() => Set.of(this);
}
