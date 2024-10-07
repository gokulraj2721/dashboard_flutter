// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library dart._string_match;

import "dart:_internal" show IterableElementError;

class StringMatch implements Match {
  const StringMatch(this.start, this.input, this.pattern);

  @override
  int get end => start + pattern.length;
  @override
  String operator [](int g) => group(g);
  @override
  int get groupCount => 0;

  @override
  String group(int group) {
    if (group != 0) {
      throw RangeError.value(group);
    }
    return pattern;
  }

  @override
  List<String> groups(List<int> groups) {
    List<String> result = <String>[];
    for (int g in groups) {
      result.add(group(g));
    }
    return result;
  }

  @override
  final int start;
  @override
  final String input;
  @override
  final String pattern;
}

class StringAllMatchesIterable extends Iterable<Match> {
  final String _input;
  final String _pattern;
  final int _index;

  StringAllMatchesIterable(this._input, this._pattern, this._index);

  @override
  Iterator<Match> get iterator =>
      StringAllMatchesIterator(_input, _pattern, _index);

  @override
  Match get first {
    int index = _input.indexOf(_pattern, _index);
    if (index >= 0) {
      return StringMatch(index, _input, _pattern);
    }
    throw IterableElementError.noElement();
  }
}

class StringAllMatchesIterator implements Iterator<Match> {
  final String _input;
  final String _pattern;
  int _index;
  Match? _current;

  StringAllMatchesIterator(this._input, this._pattern, this._index);

  @override
  bool moveNext() {
    if (_index + _pattern.length > _input.length) {
      _current = null;
      return false;
    }
    var index = _input.indexOf(_pattern, _index);
    if (index < 0) {
      _index = _input.length + 1;
      _current = null;
      return false;
    }
    int end = index + _pattern.length;
    _current = StringMatch(index, _input, _pattern);
    // Empty match, don't start at same location again.
    if (end == _index) end++;
    _index = end;
    return true;
  }

  @override
  Match get current => _current as Match;
}

int stringCombineHashes(int hash, int otherHash) {
  hash += otherHash;
  hash += hash << 10;
  hash ^= (hash & 0xFFFFFFFF) >>> 6;
  return hash;
}

int stringFinalizeHash(int hash) {
  hash += hash << 3;
  hash ^= (hash & 0xFFFFFFFF) >>> 11;
  hash += hash << 15;
  hash &= 0x3FFFFFFF;
  return hash == 0 ? 1 : hash;
}
