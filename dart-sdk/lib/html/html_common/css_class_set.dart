// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of html_common;

abstract class CssClassSetImpl extends SetBase<String> implements CssClassSet {
  static final RegExp _validTokenRE = RegExp(r'^\S+$');

  String _validateToken(String value) {
    if (_validTokenRE.hasMatch(value)) return value;
    throw ArgumentError.value(value, 'value', 'Not a valid class token');
  }

  @override
  @override
  String toString() {
    return readClasses().join(' ');
  }

  /// Adds the class [value] to the element if it is not on it, removes it if it
  /// is.
  ///
  /// If [shouldAdd] is true, then we always add that [value] to the element. If
  /// [shouldAdd] is false then we always remove [value] from the element.
  @override
  @override
  bool toggle(String value, [bool? shouldAdd]) {
    _validateToken(value);
    Set<String> s = readClasses();
    bool result = false;
    shouldAdd ??= !s.contains(value);
    if (shouldAdd) {
      s.add(value);
      result = true;
    } else {
      s.remove(value);
    }
    writeClasses(s);
    return result;
  }

  /// Returns [:true:] if classes cannot be added or removed from this
  /// [:CssClassSet:].
  @override
  @override
  bool get frozen => false;

  // interface Iterable - BEGIN
  @override
  @override
  Iterator<String> get iterator => readClasses().iterator;
  // interface Iterable - END

  // interface Collection - BEGIN
  @override
  @override
  void forEach(void Function(String element) f) {
    readClasses().forEach(f);
  }

  @override
  @override
  String join([String separator = ""]) => readClasses().join(separator);

  @override
  @override
  Iterable<T> map<T>(T Function(String e) f) => readClasses().map<T>(f);

  @override
  @override
  Iterable<String> where(bool Function(String element) f) => readClasses().where(f);

  @override
  @override
  Iterable<T> expand<T>(Iterable<T> Function(String element) f) =>
      readClasses().expand<T>(f);

  @override
  @override
  bool every(bool Function(String element) f) => readClasses().every(f);

  @override
  @override
  bool any(bool Function(String element) f) => readClasses().any(f);

  @override
  @override
  bool get isEmpty => readClasses().isEmpty;

  @override
  @override
  bool get isNotEmpty => readClasses().isNotEmpty;

  @override
  @override
  int get length => readClasses().length;

  @override
  @override
  String reduce(String Function(String value, String element) combine) {
    return readClasses().reduce(combine);
  }

  @override
  @override
  T fold<T>(T initialValue, T Function(T previousValue, String element) combine) {
    return readClasses().fold<T>(initialValue, combine);
  }

  // interface Collection - END

  // interface Set - BEGIN
  /// Determine if this element contains the class [value].
  ///
  /// This is the Dart equivalent of jQuery's
  /// [hasClass](http://api.jquery.com/hasClass/).
  @override
  @override
  bool contains(Object? value) {
    if (value is! String) return false;
    _validateToken(value);
    return readClasses().contains(value);
  }

  /// Lookup from the Set interface. Not interesting for a String set.
  @override
  @override
  String? lookup(Object? value) => contains(value) ? value as String : null;

  /// Add the class [value] to element.
  ///
  /// This is the Dart equivalent of jQuery's
  /// [addClass](http://api.jquery.com/addClass/).
  @override
  @override
  bool add(String value) {
    _validateToken(value);
    // TODO - figure out if we need to do any validation here
    // or if the browser natively does enough.
    return modify((s) => s.add(value)) ?? false;
  }

  /// Remove the class [value] from element, and return true on successful
  /// removal.
  ///
  /// This is the Dart equivalent of jQuery's
  /// [removeClass](http://api.jquery.com/removeClass/).
  @override
  @override
  bool remove(Object? value) {
    if (value is! String) return false;
    _validateToken(value);
    Set<String> s = readClasses();
    bool result = s.remove(value);
    writeClasses(s);
    return result;
  }

  /// Add all classes specified in [iterable] to element.
  ///
  /// This is the Dart equivalent of jQuery's
  /// [addClass](http://api.jquery.com/addClass/).
  @override
  @override
  void addAll(Iterable<String> iterable) {
    // TODO - see comment above about validation.
    modify((s) => s.addAll(iterable.map(_validateToken)));
  }

  /// Remove all classes specified in [iterable] from element.
  ///
  /// This is the Dart equivalent of jQuery's
  /// [removeClass](http://api.jquery.com/removeClass/).
  @override
  @override
  void removeAll(Iterable<Object?> iterable) {
    modify((s) => s.removeAll(iterable));
  }

  /// Toggles all classes specified in [iterable] on element.
  ///
  /// Iterate through [iterable]'s items, and add it if it is not on it, or
  /// remove it if it is. This is the Dart equivalent of jQuery's
  /// [toggleClass](http://api.jquery.com/toggleClass/).
  /// If [shouldAdd] is true, then we always add all the classes in [iterable]
  /// element. If [shouldAdd] is false then we always remove all the classes in
  /// [iterable] from the element.
  @override
  @override
  void toggleAll(Iterable<String> iterable, [bool? shouldAdd]) {
    for (var e in iterable) {
      toggle(e, shouldAdd);
    }
  }

  @override
  @override
  void retainAll(Iterable<Object?> iterable) {
    modify((s) => s.retainAll(iterable));
  }

  @override
  @override
  void removeWhere(bool Function(String name) test) {
    modify((s) => s.removeWhere(test));
  }

  @override
  @override
  void retainWhere(bool Function(String name) test) {
    modify((s) => s.retainWhere(test));
  }

  @override
  @override
  bool containsAll(Iterable<Object?> collection) =>
      readClasses().containsAll(collection);

  @override
  @override
  Set<String> intersection(Set<Object?> other) =>
      readClasses().intersection(other);

  @override
  @override
  Set<String> union(Set<String> other) => readClasses().union(other);

  @override
  @override
  Set<String> difference(Set<Object?> other) => readClasses().difference(other);

  @override
  @override
  String get first => readClasses().first;
  @override
  @override
  String get last => readClasses().last;
  @override
  @override
  String get single => readClasses().single;
  @override
  @override
  List<String> toList({bool growable = true}) =>
      readClasses().toList(growable: growable);
  @override
  @override
  Set<String> toSet() => readClasses().toSet();
  @override
  @override
  Iterable<String> take(int n) => readClasses().take(n);
  @override
  @override
  Iterable<String> takeWhile(bool Function(String value) test) =>
      readClasses().takeWhile(test);
  @override
  @override
  Iterable<String> skip(int n) => readClasses().skip(n);
  @override
  @override
  Iterable<String> skipWhile(bool Function(String value) test) =>
      readClasses().skipWhile(test);
  @override
  @override
  String firstWhere(bool Function(String value) test, {String Function()? orElse}) =>
      readClasses().firstWhere(test, orElse: orElse);
  @override
  @override
  String lastWhere(bool Function(String value) test, {String Function()? orElse}) =>
      readClasses().lastWhere(test, orElse: orElse);
  @override
  @override
  String singleWhere(bool Function(String value) test, {String Function()? orElse}) =>
      readClasses().singleWhere(test, orElse: orElse);
  @override
  @override
  String elementAt(int index) => readClasses().elementAt(index);

  @override
  @override
  void clear() {
    // TODO(sra): Do this without reading the classes.
    modify((s) => s.clear());
  }
  // interface Set - END

  /// Helper method used to modify the set of css classes on this element.
  ///
  ///   f - callback with:
  ///   s - a Set of all the css class name currently on this element.
  ///
  ///   After f returns, the modified set is written to the
  ///       className property of this element.
  modify(Function(Set<String> s) f) {
    Set<String> s = readClasses();
    var ret = f(s);
    writeClasses(s);
    return ret;
  }

  /// Read the class names from the Element class property,
  /// and put them into a set (duplicates are discarded).
  /// This is intended to be overridden by specific implementations.
  Set<String> readClasses();

  /// Join all the elements of a set into one string and write
  /// back to the element.
  /// This is intended to be overridden by specific implementations.
  void writeClasses(Set<String> s);
}
