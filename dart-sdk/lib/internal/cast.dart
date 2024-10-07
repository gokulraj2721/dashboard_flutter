// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of dart._internal;

// Casting wrappers for collection classes.

abstract class _CastIterableBase<S, T> extends Iterable<T> {
  Iterable<S> get _source;

  @override
  Iterator<T> get iterator => CastIterator<S, T>(_source.iterator);

  // The following members use the default implementation on the
  // throwing iterator. These are all operations that have no more efficient
  // implementation than visiting every element in order,
  // or that has no more efficient way to get the correct type (toList, toSet).
  //
  // * map
  // * where
  // * expand
  // * forEach
  // * reduce
  // * fold
  // * every
  // * any
  // * join
  // * toList
  // * toSet
  // * skipWhile
  // * takeWhile
  // * firstWhere
  // * singleWhere

  @override
  int get length => _source.length;
  @override
  bool get isEmpty => _source.isEmpty;
  @override
  bool get isNotEmpty => _source.isNotEmpty;

  @override
  Iterable<T> skip(int count) => CastIterable<S, T>(_source.skip(count));
  @override
  Iterable<T> take(int count) => CastIterable<S, T>(_source.take(count));

  @override
  T elementAt(int index) => _source.elementAt(index) as T;
  @override
  T get first => _source.first as T;
  @override
  T get last => _source.last as T;
  @override
  T get single => _source.single as T;

  @override
  bool contains(Object? other) => _source.contains(other);

  // Might be implemented by testing backwards from the end,
  // so use the _source's implementation.
  @override
  T lastWhere(bool Function(T element) test, {T Function()? orElse}) =>
      _source.lastWhere((S element) => test(element as T),
          orElse: (orElse == null) ? null : () => orElse() as S) as T;

  @override
  String toString() => _source.toString();
}

class CastIterator<S, T> implements Iterator<T> {
  final Iterator<S> _source;
  CastIterator(this._source);
  @override
  bool moveNext() => _source.moveNext();
  @override
  T get current => _source.current as T;
}

class CastIterable<S, T> extends _CastIterableBase<S, T> {
  @override
  final Iterable<S> _source;

  CastIterable._(this._source);

  factory CastIterable(Iterable<S> source) {
    if (source is EfficientLengthIterable<S>) {
      return _EfficientLengthCastIterable<S, T>(source);
    }
    return CastIterable<S, T>._(source);
  }

  @override
  Iterable<R> cast<R>() => CastIterable<S, R>(_source);
}

class _EfficientLengthCastIterable<S, T> extends CastIterable<S, T>
    implements EfficientLengthIterable<T>, HideEfficientLengthIterable<T> {
  _EfficientLengthCastIterable(EfficientLengthIterable<S> super.source)
      : super._();
}

abstract class _CastListBase<S, T> extends _CastIterableBase<S, T>
    with ListMixin<T> {
  @override
  List<S> get _source;

  // Using the default implementation from ListMixin:
  // * reversed
  // * shuffle
  // * indexOf
  // * lastIndexOf
  // * clear
  // * sublist
  // * asMap

  @override
  T operator [](int index) => _source[index] as T;

  @override
  void operator []=(int index, T value) {
    _source[index] = value as S;
  }

  set length(int length) {
    _source.length = length;
  }

  @override
  void add(T value) {
    _source.add(value as S);
  }

  @override
  void addAll(Iterable<T> values) {
    _source.addAll(CastIterable<T, S>(values));
  }

  @override
  void sort([int Function(T v1, T v2)? compare]) {
    _source.sort(
        compare == null ? null : (S v1, S v2) => compare(v1 as T, v2 as T));
  }

  @override
  void shuffle([Random? random]) {
    _source.shuffle(random);
  }

  @override
  void insert(int index, T element) {
    _source.insert(index, element as S);
  }

  @override
  void insertAll(int index, Iterable<T> elements) {
    _source.insertAll(index, CastIterable<T, S>(elements));
  }

  @override
  void setAll(int index, Iterable<T> elements) {
    _source.setAll(index, CastIterable<T, S>(elements));
  }

  @override
  bool remove(Object? value) => _source.remove(value);

  @override
  T removeAt(int index) => _source.removeAt(index) as T;

  @override
  T removeLast() => _source.removeLast() as T;

  @override
  void removeWhere(bool Function(T element) test) {
    _source.removeWhere((S element) => test(element as T));
  }

  @override
  void retainWhere(bool Function(T element) test) {
    _source.retainWhere((S element) => test(element as T));
  }

  @override
  Iterable<T> getRange(int start, int end) =>
      CastIterable<S, T>(_source.getRange(start, end));

  @override
  void setRange(int start, int end, Iterable<T> iterable, [int skipCount = 0]) {
    _source.setRange(start, end, CastIterable<T, S>(iterable), skipCount);
  }

  @override
  void removeRange(int start, int end) {
    _source.removeRange(start, end);
  }

  @override
  void fillRange(int start, int end, [T? fillValue]) {
    _source.fillRange(start, end, fillValue as S);
  }

  @override
  void replaceRange(int start, int end, Iterable<T> replacement) {
    _source.replaceRange(start, end, CastIterable<T, S>(replacement));
  }
}

class CastList<S, T> extends _CastListBase<S, T> {
  @override
  final List<S> _source;
  CastList(this._source);

  @override
  List<R> cast<R>() => CastList<S, R>(_source);
}

class CastSet<S, T> extends _CastIterableBase<S, T> implements Set<T> {
  @override
  final Set<S> _source;

  /// Creates a new empty set of the same *kind* as [_source],
  /// but with `<R>` as type argument.
  /// Used by [toSet] and [union].
  final Set<R> Function<R>()? _emptySet;

  CastSet(this._source, this._emptySet);

  @override
  Set<R> cast<R>() => CastSet<S, R>(_source, _emptySet);
  @override
  bool add(T value) => _source.add(value as S);

  @override
  void addAll(Iterable<T> elements) {
    _source.addAll(CastIterable<T, S>(elements));
  }

  @override
  bool remove(Object? object) => _source.remove(object);

  @override
  void removeAll(Iterable<Object?> objects) {
    _source.removeAll(objects);
  }

  @override
  void retainAll(Iterable<Object?> objects) {
    _source.retainAll(objects);
  }

  @override
  void removeWhere(bool Function(T element) test) {
    _source.removeWhere((S element) => test(element as T));
  }

  @override
  void retainWhere(bool Function(T element) test) {
    _source.retainWhere((S element) => test(element as T));
  }

  @override
  bool containsAll(Iterable<Object?> objects) => _source.containsAll(objects);

  @override
  Set<T> intersection(Set<Object?> other) {
    if (_emptySet != null) return _conditionalAdd(other, true);
    return CastSet<S, T>(_source.intersection(other), null);
  }

  @override
  Set<T> difference(Set<Object?> other) {
    if (_emptySet != null) return _conditionalAdd(other, false);
    return CastSet<S, T>(_source.difference(other), null);
  }

  Set<T> _conditionalAdd(Set<Object?> other, bool otherContains) {
    var emptySet = _emptySet;
    Set<T> result = (emptySet == null) ? <T>{} : emptySet<T>();
    for (var element in _source) {
      T castElement = element as T;
      if (otherContains == other.contains(castElement)) result.add(castElement);
    }
    return result;
  }

  @override
  Set<T> union(Set<T> other) => _clone()..addAll(other);

  @override
  void clear() {
    _source.clear();
  }

  Set<T> _clone() {
    var emptySet = _emptySet;
    Set<T> result = (emptySet == null) ? <T>{} : emptySet<T>();
    result.addAll(this);
    return result;
  }

  @override
  Set<T> toSet() => _clone();

  @override
  T lookup(Object? key) => _source.lookup(key) as T;
}

class CastMap<SK, SV, K, V> extends MapBase<K, V> {
  final Map<SK, SV> _source;

  CastMap(this._source);

  @override
  Map<RK, RV> cast<RK, RV>() => CastMap<SK, SV, RK, RV>(_source);

  @override
  bool containsValue(Object? value) => _source.containsValue(value);

  @override
  bool containsKey(Object? key) => _source.containsKey(key);

  @override
  V? operator [](Object? key) => _source[key] as V?;

  @override
  void operator []=(K key, V value) {
    _source[key as SK] = value as SV;
  }

  @override
  V putIfAbsent(K key, V Function() ifAbsent) =>
      _source.putIfAbsent(key as SK, () => ifAbsent() as SV) as V;

  @override
  void addAll(Map<K, V> other) {
    _source.addAll(CastMap<K, V, SK, SV>(other));
  }

  @override
  V? remove(Object? key) => _source.remove(key) as V?;

  @override
  void clear() {
    _source.clear();
  }

  @override
  void forEach(void Function(K key, V value) f) {
    _source.forEach((SK key, SV value) {
      f(key as K, value as V);
    });
  }

  @override
  Iterable<K> get keys => CastIterable<SK, K>(_source.keys);

  @override
  Iterable<V> get values => CastIterable<SV, V>(_source.values);

  @override
  int get length => _source.length;

  @override
  bool get isEmpty => _source.isEmpty;

  @override
  bool get isNotEmpty => _source.isNotEmpty;

  @override
  V update(K key, V Function(V value) update, {V Function()? ifAbsent}) {
    return _source.update(key as SK, (SV value) => update(value as V) as SV,
        ifAbsent: (ifAbsent == null) ? null : () => ifAbsent() as SV) as V;
  }

  @override
  void updateAll(V Function(K key, V value) update) {
    _source.updateAll((SK key, SV value) => update(key as K, value as V) as SV);
  }

  @override
  Iterable<MapEntry<K, V>> get entries {
    return _source.entries.map<MapEntry<K, V>>(
        (MapEntry<SK, SV> e) => MapEntry<K, V>(e.key as K, e.value as V));
  }

  @override
  void addEntries(Iterable<MapEntry<K, V>> entries) {
    for (var entry in entries) {
      _source[entry.key as SK] = entry.value as SV;
    }
  }

  @override
  void removeWhere(bool Function(K key, V value) test) {
    _source.removeWhere((SK key, SV value) => test(key as K, value as V));
  }
}

class CastQueue<S, T> extends _CastIterableBase<S, T> implements Queue<T> {
  @override
  final Queue<S> _source;
  CastQueue(this._source);
  @override
  Queue<R> cast<R>() => CastQueue<S, R>(_source);

  @override
  T removeFirst() => _source.removeFirst() as T;
  @override
  T removeLast() => _source.removeLast() as T;

  @override
  void add(T value) {
    _source.add(value as S);
  }

  @override
  void addFirst(T value) {
    _source.addFirst(value as S);
  }

  @override
  void addLast(T value) {
    _source.addLast(value as S);
  }

  @override
  bool remove(Object? other) => _source.remove(other);
  @override
  void addAll(Iterable<T> elements) {
    _source.addAll(CastIterable<T, S>(elements));
  }

  @override
  void removeWhere(bool Function(T element) test) {
    _source.removeWhere((S element) => test(element as T));
  }

  @override
  void retainWhere(bool Function(T element) test) {
    _source.retainWhere((S element) => test(element as T));
  }

  @override
  void clear() {
    _source.clear();
  }
}
