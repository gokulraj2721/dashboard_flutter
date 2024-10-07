// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of html_common;

/// An indexable collection of a node's direct descendants in the document tree,
/// filtered so that only elements are in the collection.
class FilteredElementList extends ListBase<Element> implements NodeListWrapper {
  final Node _node;
  final List<Node> _childNodes;

  /// Creates a collection of the elements that descend from a node.
  ///
  /// Example usage:
  ///
  ///     var filteredElements = new FilteredElementList(query("#container"));
  ///     // filteredElements is [a, b, c].
  FilteredElementList(Node node)
      : _childNodes = node.nodes,
        _node = node;

  // We can't memoize this, since it's possible that children will be messed
  // with externally to this class.
  Iterable<Element> get _iterable =>
      _childNodes.whereType<Element>().map<Element>((n) => n as Element);
  List<Element> get _filtered =>
      List<Element>.from(_iterable, growable: false);

  @override
  @override
  void forEach(void Function(Element element) f) {
    // This cannot use the iterator, because operations during iteration might
    // modify the collection, e.g. addAll might append a node to another parent.
    _filtered.forEach(f);
  }

  @override
  @override
  void operator []=(int index, Element value) {
    this[index].replaceWith(value);
  }

  @override
  @override
  set length(int newLength) {
    final len = length;
    if (newLength >= len) {
      return;
    } else if (newLength < 0) {
      throw ArgumentError("Invalid list length");
    }

    removeRange(newLength, len);
  }

  @override
  @override
  void add(Element value) {
    _childNodes.add(value);
  }

  @override
  @override
  void addAll(Iterable<Element> iterable) {
    for (Element element in iterable) {
      add(element);
    }
  }

  @override
  @override
  bool contains(Object? needle) {
    if (needle is! Element) return false;
    Element element = needle;
    return element.parentNode == _node;
  }

  @override
  @override
  Iterable<Element> get reversed => _filtered.reversed;

  @override
  @override
  void sort([int Function(Element a, Element b)? compare]) {
    throw UnsupportedError('Cannot sort filtered list');
  }

  @override
  @override
  void setRange(int start, int end, Iterable<Element> iterable,
      [int skipCount = 0]) {
    throw UnsupportedError('Cannot setRange on filtered list');
  }

  @override
  @override
  void fillRange(int start, int end, [Element? fillValue]) {
    throw UnsupportedError('Cannot fillRange on filtered list');
  }

  @override
  @override
  void replaceRange(int start, int end, Iterable<Element> iterable) {
    throw UnsupportedError('Cannot replaceRange on filtered list');
  }

  @override
  @override
  void removeRange(int start, int end) {
    List<Element>.from(_iterable.skip(start).take(end - start))
        .forEach((el) => el.remove());
  }

  @override
  @override
  void clear() {
    // Currently, ElementList#clear clears even non-element nodes, so we follow
    // that behavior.
    _childNodes.clear();
  }

  @override
  @override
  Element removeLast() {
    final result = _iterable.last;
    result.remove();
      return result;
  }

  @override
  @override
  void insert(int index, Element value) {
    if (index == length) {
      add(value);
    } else {
      var element = _iterable.elementAt(index);
      element.parentNode!.insertBefore(value, element);
    }
  }

  @override
  @override
  void insertAll(int index, Iterable<Element> iterable) {
    if (index == length) {
      addAll(iterable);
    } else {
      var element = _iterable.elementAt(index);
      element.parentNode!.insertAllBefore(iterable, element);
    }
  }

  @override
  @override
  Element removeAt(int index) {
    final result = this[index];
    result.remove();
    return result;
  }

  @override
  @override
  bool remove(Object? element) {
    if (element is! Element) return false;
    if (contains(element)) {
      (element).remove(); // Placate the type checker
      return true;
    } else {
      return false;
    }
  }

  @override
  @override
  int get length => _iterable.length;
  @override
  @override
  Element operator [](int index) => _iterable.elementAt(index);
  // This cannot use the iterator, because operations during iteration might
  // modify the collection, e.g. addAll might append a node to another parent.
  @override
  @override
  Iterator<Element> get iterator => _filtered.iterator;

  @override
  @override
  List<Node> get rawList => _node.childNodes;
}
