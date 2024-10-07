// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library dart._simd;

import 'dart:_internal' show FixedLengthListMixin, IterableElementError;

import 'dart:collection' show ListMixin;
import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:_internal' show WasmTypedDataBase;
import 'dart:_wasm';

final class NaiveInt32x4List extends WasmTypedDataBase
    with ListMixin<Int32x4>, FixedLengthListMixin<Int32x4>
    implements Int32x4List {
  final Int32List _storage;

  NaiveInt32x4List(int length) : _storage = Int32List(length * 4);

  NaiveInt32x4List.externalStorage(Int32List storage) : _storage = storage;

  NaiveInt32x4List._slowFromList(List<Int32x4> list)
      : _storage = Int32List(list.length * 4) {
    for (int i = 0; i < list.length; i++) {
      var e = list[i];
      _storage[(i * 4) + 0] = e.x;
      _storage[(i * 4) + 1] = e.y;
      _storage[(i * 4) + 2] = e.z;
      _storage[(i * 4) + 3] = e.w;
    }
  }

  factory NaiveInt32x4List.fromList(List<Int32x4> list) {
    if (list is NaiveInt32x4List) {
      return NaiveInt32x4List.externalStorage(
          Int32List.fromList(list._storage));
    } else {
      return NaiveInt32x4List._slowFromList(list);
    }
  }

  @override
  ByteBuffer get buffer => _storage.buffer;

  @override
  int get lengthInBytes => _storage.lengthInBytes;

  @override
  int get offsetInBytes => _storage.offsetInBytes;

  @override
  int get elementSizeInBytes => Int32x4List.bytesPerElement;

  @override
  int get length => _storage.length ~/ 4;

  @override
  Int32x4 operator [](int index) {
    IndexError.check(index, length, indexable: this, name: "[]");
    int x = _storage[(index * 4) + 0];
    int y = _storage[(index * 4) + 1];
    int z = _storage[(index * 4) + 2];
    int w = _storage[(index * 4) + 3];
    return NaiveInt32x4._truncated(x, y, z, w);
  }

  @override
  void operator []=(int index, Int32x4 value) {
    IndexError.check(index, length, indexable: this, name: "[]=");
    _storage[(index * 4) + 0] = value.x;
    _storage[(index * 4) + 1] = value.y;
    _storage[(index * 4) + 2] = value.z;
    _storage[(index * 4) + 3] = value.w;
  }

  @override
  Int32x4List asUnmodifiableView() =>
      NaiveUnmodifiableInt32x4List.externalStorage(_storage);

  @override
  Int32x4List sublist(int start, [int? end]) {
    int stop = RangeError.checkValidRange(start, end, length);
    return NaiveInt32x4List.externalStorage(
        _storage.sublist(start * 4, stop * 4));
  }

  @override
  void setRange(int start, int end, Iterable<Int32x4> from,
      [int skipCount = 0]) {
    if (0 > start || start > end || end > length) {
      RangeError.checkValidRange(start, end, length); // Always throws.
    }
    if (skipCount < 0) {
      throw RangeError.range(skipCount, 0, null, "skipCount");
    }

    final count = end - start;
    if (count == 0) return;

    final List<Int32x4> fromList = from.skip(skipCount).toList(growable: false);

    if (fromList.length < count) {
      throw IterableElementError.tooFew();
    }

    for (int i = start; i < end; i += 1) {
      this[i] = fromList[i - start];
    }
  }
}

final class NaiveUnmodifiableInt32x4List extends NaiveInt32x4List {
  NaiveUnmodifiableInt32x4List.externalStorage(super.storage)
      : super.externalStorage();

  @override
  void operator []=(int index, Int32x4 value) {
    throw UnsupportedError("Cannot modify an unmodifiable list");
  }

  @override
  ByteBuffer get buffer => _storage.asUnmodifiableView().buffer;
}

final class NaiveFloat32x4List extends WasmTypedDataBase
    with ListMixin<Float32x4>, FixedLengthListMixin<Float32x4>
    implements Float32x4List {
  final Float32List _storage;

  NaiveFloat32x4List(int length) : _storage = Float32List(length * 4);

  NaiveFloat32x4List.externalStorage(this._storage);

  NaiveFloat32x4List._slowFromList(List<Float32x4> list)
      : _storage = Float32List(list.length * 4) {
    for (int i = 0; i < list.length; i++) {
      var e = list[i];
      _storage[(i * 4) + 0] = e.x;
      _storage[(i * 4) + 1] = e.y;
      _storage[(i * 4) + 2] = e.z;
      _storage[(i * 4) + 3] = e.w;
    }
  }

  factory NaiveFloat32x4List.fromList(List<Float32x4> list) {
    if (list is NaiveFloat32x4List) {
      return NaiveFloat32x4List.externalStorage(
          Float32List.fromList(list._storage));
    } else {
      return NaiveFloat32x4List._slowFromList(list);
    }
  }

  @override
  ByteBuffer get buffer => _storage.buffer;

  @override
  int get lengthInBytes => _storage.lengthInBytes;

  @override
  int get offsetInBytes => _storage.offsetInBytes;

  @override
  int get elementSizeInBytes => Float32x4List.bytesPerElement;

  @override
  int get length => _storage.length ~/ 4;

  @override
  Float32x4 operator [](int index) {
    IndexError.check(index, length, indexable: this, name: "[]");
    double x = _storage[(index * 4) + 0];
    double y = _storage[(index * 4) + 1];
    double z = _storage[(index * 4) + 2];
    double w = _storage[(index * 4) + 3];
    return NaiveFloat32x4._truncated(x, y, z, w);
  }

  @override
  void operator []=(int index, Float32x4 value) {
    IndexError.check(index, length, indexable: this, name: "[]=");
    _storage[(index * 4) + 0] = value.x;
    _storage[(index * 4) + 1] = value.y;
    _storage[(index * 4) + 2] = value.z;
    _storage[(index * 4) + 3] = value.w;
  }

  @override
  Float32x4List asUnmodifiableView() =>
      NaiveUnmodifiableFloat32x4List.externalStorage(_storage);

  @override
  Float32x4List sublist(int start, [int? end]) {
    int stop = RangeError.checkValidRange(start, end, length);
    return NaiveFloat32x4List.externalStorage(
        _storage.sublist(start * 4, stop * 4));
  }

  @override
  void setRange(int start, int end, Iterable<Float32x4> from,
      [int skipCount = 0]) {
    if (0 > start || start > end || end > length) {
      RangeError.checkValidRange(start, end, length); // Always throws.
    }
    if (skipCount < 0) {
      throw RangeError.range(skipCount, 0, null, "skipCount");
    }

    final count = end - start;
    if (count == 0) return;

    final List<Float32x4> fromList =
        from.skip(skipCount).toList(growable: false);

    if (fromList.length < count) {
      throw IterableElementError.tooFew();
    }

    for (int i = start; i < end; i += 1) {
      this[i] = fromList[i - start];
    }
  }
}

final class NaiveUnmodifiableFloat32x4List extends NaiveFloat32x4List {
  NaiveUnmodifiableFloat32x4List.externalStorage(super.storage)
      : super.externalStorage();

  @override
  void operator []=(int index, Float32x4 value) {
    throw UnsupportedError("Cannot modify an unmodifiable list");
  }

  @override
  ByteBuffer get buffer => _storage.asUnmodifiableView().buffer;
}

final class NaiveFloat64x2List extends WasmTypedDataBase
    with ListMixin<Float64x2>, FixedLengthListMixin<Float64x2>
    implements Float64x2List {
  final Float64List _storage;

  NaiveFloat64x2List(int length) : _storage = Float64List(length * 2);

  NaiveFloat64x2List.externalStorage(this._storage);

  NaiveFloat64x2List._slowFromList(List<Float64x2> list)
      : _storage = Float64List(list.length * 2) {
    for (int i = 0; i < list.length; i++) {
      var e = list[i];
      _storage[(i * 2) + 0] = e.x;
      _storage[(i * 2) + 1] = e.y;
    }
  }

  factory NaiveFloat64x2List.fromList(List<Float64x2> list) {
    if (list is NaiveFloat64x2List) {
      return NaiveFloat64x2List.externalStorage(
          Float64List.fromList(list._storage));
    } else {
      return NaiveFloat64x2List._slowFromList(list);
    }
  }

  @override
  ByteBuffer get buffer => _storage.buffer;

  @override
  int get lengthInBytes => _storage.lengthInBytes;

  @override
  int get offsetInBytes => _storage.offsetInBytes;

  @override
  int get elementSizeInBytes => Float64x2List.bytesPerElement;

  @override
  int get length => _storage.length ~/ 2;

  @override
  Float64x2 operator [](int index) {
    IndexError.check(index, length, indexable: this, name: "[]");
    double x = _storage[(index * 2) + 0];
    double y = _storage[(index * 2) + 1];
    return Float64x2(x, y);
  }

  @override
  void operator []=(int index, Float64x2 value) {
    IndexError.check(index, length, indexable: this, name: "[]=");
    _storage[(index * 2) + 0] = value.x;
    _storage[(index * 2) + 1] = value.y;
  }

  @override
  Float64x2List asUnmodifiableView() =>
      NaiveUnmodifiableFloat64x2List.externalStorage(_storage);

  @override
  Float64x2List sublist(int start, [int? end]) {
    int stop = RangeError.checkValidRange(start, end, length);
    return NaiveFloat64x2List.externalStorage(
        _storage.sublist(start * 2, stop * 2));
  }

  @override
  void setRange(int start, int end, Iterable<Float64x2> from,
      [int skipCount = 0]) {
    if (0 > start || start > end || end > length) {
      RangeError.checkValidRange(start, end, length); // Always throws.
    }
    if (skipCount < 0) {
      throw RangeError.range(skipCount, 0, null, "skipCount");
    }

    final count = end - start;
    if (count == 0) return;

    final List<Float64x2> fromList =
        from.skip(skipCount).toList(growable: false);

    if (fromList.length < count) {
      throw IterableElementError.tooFew();
    }

    for (int i = start; i < end; i += 1) {
      this[i] = fromList[i - start];
    }
  }
}

final class NaiveUnmodifiableFloat64x2List extends NaiveFloat64x2List {
  NaiveUnmodifiableFloat64x2List.externalStorage(super.storage)
      : super.externalStorage();

  @override
  void operator []=(int index, Float64x2 value) {
    throw UnsupportedError("Cannot modify an unmodifiable list");
  }

  @override
  ByteBuffer get buffer => _storage.asUnmodifiableView().buffer;
}

final class NaiveFloat32x4 extends WasmTypedDataBase implements Float32x4 {
  @override
  final double x;
  @override
  final double y;
  @override
  final double z;
  @override
  final double w;

  static final Float32List _list = Float32List(4);
  static final Uint32List _uint32view = _list.buffer.asUint32List();

  static double _truncate(x) {
    _list[0] = x;
    return _list[0];
  }

  NaiveFloat32x4(double x, double y, double z, double w)
      : x = _truncate(x),
        y = _truncate(y),
        z = _truncate(z),
        w = _truncate(w);

  NaiveFloat32x4.splat(double v) : this(v, v, v, v);
  NaiveFloat32x4.zero() : this._truncated(0.0, 0.0, 0.0, 0.0);

  factory NaiveFloat32x4.fromInt32x4Bits(Int32x4 i) {
    _uint32view[0] = i.x;
    _uint32view[1] = i.y;
    _uint32view[2] = i.z;
    _uint32view[3] = i.w;
    return NaiveFloat32x4._truncated(_list[0], _list[1], _list[2], _list[3]);
  }

  NaiveFloat32x4.fromFloat64x2(Float64x2 v)
      : this._truncated(_truncate(v.x), _truncate(v.y), 0.0, 0.0);

  NaiveFloat32x4._doubles(double x, double y, double z, double w)
      : x = _truncate(x),
        y = _truncate(y),
        z = _truncate(z),
        w = _truncate(w);

  NaiveFloat32x4._truncated(this.x, this.y, this.z, this.w);

  @override
  String toString() {
    return '[${x.toStringAsFixed(6)}, '
        '${y.toStringAsFixed(6)}, '
        '${z.toStringAsFixed(6)}, '
        '${w.toStringAsFixed(6)}]';
  }

  @override
  Float32x4 operator +(Float32x4 other) {
    double x = x + other.x;
    double y = y + other.y;
    double z = z + other.z;
    double w = w + other.w;
    return NaiveFloat32x4._doubles(x, y, z, w);
  }

  @override
  Float32x4 operator -() {
    return NaiveFloat32x4._truncated(-x, -y, -z, -w);
  }

  @override
  Float32x4 operator -(Float32x4 other) {
    double x = x - other.x;
    double y = y - other.y;
    double z = z - other.z;
    double w = w - other.w;
    return NaiveFloat32x4._doubles(x, y, z, w);
  }

  @override
  Float32x4 operator *(Float32x4 other) {
    double x = x * other.x;
    double y = y * other.y;
    double z = z * other.z;
    double w = w * other.w;
    return NaiveFloat32x4._doubles(x, y, z, w);
  }

  @override
  Float32x4 operator /(Float32x4 other) {
    double x = x / other.x;
    double y = y / other.y;
    double z = z / other.z;
    double w = w / other.w;
    return NaiveFloat32x4._doubles(x, y, z, w);
  }

  @override
  Int32x4 lessThan(Float32x4 other) {
    bool cx = x < other.x;
    bool cy = y < other.y;
    bool cz = z < other.z;
    bool cw = w < other.w;
    return NaiveInt32x4._truncated(
        cx ? -1 : 0, cy ? -1 : 0, cz ? -1 : 0, cw ? -1 : 0);
  }

  @override
  Int32x4 lessThanOrEqual(Float32x4 other) {
    bool cx = x <= other.x;
    bool cy = y <= other.y;
    bool cz = z <= other.z;
    bool cw = w <= other.w;
    return NaiveInt32x4._truncated(
        cx ? -1 : 0, cy ? -1 : 0, cz ? -1 : 0, cw ? -1 : 0);
  }

  @override
  Int32x4 greaterThan(Float32x4 other) {
    bool cx = x > other.x;
    bool cy = y > other.y;
    bool cz = z > other.z;
    bool cw = w > other.w;
    return NaiveInt32x4._truncated(
        cx ? -1 : 0, cy ? -1 : 0, cz ? -1 : 0, cw ? -1 : 0);
  }

  @override
  Int32x4 greaterThanOrEqual(Float32x4 other) {
    bool cx = x >= other.x;
    bool cy = y >= other.y;
    bool cz = z >= other.z;
    bool cw = w >= other.w;
    return NaiveInt32x4._truncated(
        cx ? -1 : 0, cy ? -1 : 0, cz ? -1 : 0, cw ? -1 : 0);
  }

  @override
  Int32x4 equal(Float32x4 other) {
    bool cx = x == other.x;
    bool cy = y == other.y;
    bool cz = z == other.z;
    bool cw = w == other.w;
    return NaiveInt32x4._truncated(
        cx ? -1 : 0, cy ? -1 : 0, cz ? -1 : 0, cw ? -1 : 0);
  }

  @override
  Int32x4 notEqual(Float32x4 other) {
    bool cx = x != other.x;
    bool cy = y != other.y;
    bool cz = z != other.z;
    bool cw = w != other.w;
    return NaiveInt32x4._truncated(
        cx ? -1 : 0, cy ? -1 : 0, cz ? -1 : 0, cw ? -1 : 0);
  }

  @override
  Float32x4 scale(double s) {
    double x = s * x;
    double y = s * y;
    double z = s * z;
    double w = s * w;
    return NaiveFloat32x4._doubles(x, y, z, w);
  }

  @override
  Float32x4 abs() {
    double x = x.abs();
    double y = y.abs();
    double z = z.abs();
    double w = w.abs();
    return NaiveFloat32x4._truncated(x, y, z, w);
  }

  @override
  Float32x4 clamp(Float32x4 lowerLimit, Float32x4 upperLimit) {
    double lx = lowerLimit.x;
    double ly = lowerLimit.y;
    double lz = lowerLimit.z;
    double lw = lowerLimit.w;
    double ux = upperLimit.x;
    double uy = upperLimit.y;
    double uz = upperLimit.z;
    double uw = upperLimit.w;
    double x = x;
    double y = y;
    double z = z;
    double w = w;
    // MAX(MIN(self, upper), lower).
    x = x > ux ? ux : x;
    y = y > uy ? uy : y;
    z = z > uz ? uz : z;
    w = w > uw ? uw : w;
    x = x < lx ? lx : x;
    y = y < ly ? ly : y;
    z = z < lz ? lz : z;
    w = w < lw ? lw : w;
    return NaiveFloat32x4._truncated(x, y, z, w);
  }

  @override
  int get signMask {
    var view = _uint32view;
    int mx, my, mz, mw;
    _list[0] = x;
    _list[1] = y;
    _list[2] = z;
    _list[3] = w;
    mx = (view[0] & 0x80000000) >> 31;
    my = (view[1] & 0x80000000) >> 30;
    mz = (view[2] & 0x80000000) >> 29;
    mw = (view[3] & 0x80000000) >> 28;
    return mx | my | mz | mw;
  }

  @override
  Float32x4 shuffle(int mask) {
    // mask < 0 || mask > 255
    if (mask.gtU(255)) {
      throw RangeError.range(mask, 0, 255, 'mask');
    }
    _list[0] = x;
    _list[1] = y;
    _list[2] = z;
    _list[3] = w;

    double x = _list[mask & 0x3];
    double y = _list[(mask >> 2) & 0x3];
    double z = _list[(mask >> 4) & 0x3];
    double w = _list[(mask >> 6) & 0x3];
    return NaiveFloat32x4._truncated(x, y, z, w);
  }

  @override
  Float32x4 shuffleMix(Float32x4 other, int mask) {
    // mask < 0 || mask > 255
    if (mask.gtU(255)) {
      throw RangeError.range(mask, 0, 255, 'mask');
    }
    _list[0] = x;
    _list[1] = y;
    _list[2] = z;
    _list[3] = w;
    double x = _list[mask & 0x3];
    double y = _list[(mask >> 2) & 0x3];

    _list[0] = other.x;
    _list[1] = other.y;
    _list[2] = other.z;
    _list[3] = other.w;
    double z = _list[(mask >> 4) & 0x3];
    double w = _list[(mask >> 6) & 0x3];
    return NaiveFloat32x4._truncated(x, y, z, w);
  }

  @override
  Float32x4 withX(double newX) {
    double newX0 = _truncate(newX);
    return NaiveFloat32x4._truncated(newX0, y, z, w);
  }

  @override
  Float32x4 withY(double newY) {
    double newY0 = _truncate(newY);
    return NaiveFloat32x4._truncated(x, newY0, z, w);
  }

  @override
  Float32x4 withZ(double newZ) {
    double newZ0 = _truncate(newZ);
    return NaiveFloat32x4._truncated(x, y, newZ0, w);
  }

  @override
  Float32x4 withW(double newW) {
    double newW0 = _truncate(newW);
    return NaiveFloat32x4._truncated(x, y, z, newW0);
  }

  @override
  Float32x4 min(Float32x4 other) {
    double x = x < other.x ? x : other.x;
    double y = y < other.y ? y : other.y;
    double z = z < other.z ? z : other.z;
    double w = w < other.w ? w : other.w;
    return NaiveFloat32x4._truncated(x, y, z, w);
  }

  @override
  Float32x4 max(Float32x4 other) {
    double x = x > other.x ? x : other.x;
    double y = y > other.y ? y : other.y;
    double z = z > other.z ? z : other.z;
    double w = w > other.w ? w : other.w;
    return NaiveFloat32x4._truncated(x, y, z, w);
  }

  @override
  Float32x4 sqrt() {
    double x = math.sqrt(x);
    double y = math.sqrt(y);
    double z = math.sqrt(z);
    double w = math.sqrt(w);
    return NaiveFloat32x4._doubles(x, y, z, w);
  }

  @override
  Float32x4 reciprocal() {
    double x = 1.0 / x;
    double y = 1.0 / y;
    double z = 1.0 / z;
    double w = 1.0 / w;
    return NaiveFloat32x4._doubles(x, y, z, w);
  }

  @override
  Float32x4 reciprocalSqrt() {
    double x = math.sqrt(1.0 / x);
    double y = math.sqrt(1.0 / y);
    double z = math.sqrt(1.0 / z);
    double w = math.sqrt(1.0 / w);
    return NaiveFloat32x4._doubles(x, y, z, w);
  }
}

final class NaiveFloat64x2 extends WasmTypedDataBase implements Float64x2 {
  @override
  final double x;
  @override
  final double y;

  static final Float64List _list = Float64List(2);
  static final Uint32List _uint32View = _list.buffer.asUint32List();

  NaiveFloat64x2(this.x, this.y);

  NaiveFloat64x2.splat(double v) : this(v, v);

  NaiveFloat64x2.zero() : this.splat(0.0);

  NaiveFloat64x2.fromFloat32x4(Float32x4 v) : this(v.x, v.y);

  NaiveFloat64x2._doubles(this.x, this.y);

  @override
  String toString() => '[$x, $y]';

  @override
  Float64x2 operator +(Float64x2 other) =>
      NaiveFloat64x2._doubles(x + other.x, y + other.y);

  @override
  Float64x2 operator -() => NaiveFloat64x2._doubles(-x, -y);

  @override
  Float64x2 operator -(Float64x2 other) =>
      NaiveFloat64x2._doubles(x - other.x, y - other.y);

  @override
  Float64x2 operator *(Float64x2 other) =>
      NaiveFloat64x2._doubles(x * other.x, y * other.y);

  @override
  Float64x2 operator /(Float64x2 other) =>
      NaiveFloat64x2._doubles(x / other.x, y / other.y);

  @override
  Float64x2 scale(double s) => NaiveFloat64x2._doubles(x * s, y * s);

  @override
  Float64x2 abs() => NaiveFloat64x2._doubles(x.abs(), y.abs());

  @override
  Float64x2 clamp(Float64x2 lowerLimit, Float64x2 upperLimit) {
    double lx = lowerLimit.x;
    double ly = lowerLimit.y;
    double ux = upperLimit.x;
    double uy = upperLimit.y;
    double x = x;
    double y = y;
    // MAX(MIN(self, upper), lower).
    x = x > ux ? ux : x;
    y = y > uy ? uy : y;
    x = x < lx ? lx : x;
    y = y < ly ? ly : y;
    return NaiveFloat64x2._doubles(x, y);
  }

  @override
  int get signMask {
    var view = _uint32View;
    _list[0] = x;
    _list[1] = y;
    var mx = (view[1] & 0x80000000) >> 31;
    var my = (view[3] & 0x80000000) >> 31;
    return mx | my << 1;
  }

  @override
  Float64x2 withX(double x) => NaiveFloat64x2._doubles(x, y);

  @override
  Float64x2 withY(double y) => NaiveFloat64x2._doubles(x, y);

  @override
  Float64x2 min(Float64x2 other) => NaiveFloat64x2._doubles(
      x < other.x ? x : other.x, y < other.y ? y : other.y);

  @override
  Float64x2 max(Float64x2 other) => NaiveFloat64x2._doubles(
      x > other.x ? x : other.x, y > other.y ? y : other.y);

  @override
  Float64x2 sqrt() => NaiveFloat64x2._doubles(math.sqrt(x), math.sqrt(y));
}

final class NaiveInt32x4 extends WasmTypedDataBase implements Int32x4 {
  @override
  final int x;
  @override
  final int y;
  @override
  final int z;
  @override
  final int w;

  static final Int32List _list = Int32List(4);

  static int _truncate(x) {
    _list[0] = x;
    return _list[0];
  }

  NaiveInt32x4(int x, int y, int z, int w)
      : x = _truncate(x),
        y = _truncate(y),
        z = _truncate(z),
        w = _truncate(w);

  NaiveInt32x4.bool(bool x, bool y, bool z, bool w)
      : x = x ? -1 : 0,
        y = y ? -1 : 0,
        z = z ? -1 : 0,
        w = w ? -1 : 0;

  factory NaiveInt32x4.fromFloat32x4Bits(Float32x4 f) {
    Float32List floatList = NaiveFloat32x4._list;
    floatList[0] = f.x;
    floatList[1] = f.y;
    floatList[2] = f.z;
    floatList[3] = f.w;
    var view = floatList.buffer.asInt32List();
    return NaiveInt32x4._truncated(view[0], view[1], view[2], view[3]);
  }

  NaiveInt32x4._truncated(this.x, this.y, this.z, this.w);

  @override
  String toString() => '[${_int32ToHex(x)}, ${_int32ToHex(y)}, '
      '${_int32ToHex(z)}, ${_int32ToHex(w)}]';

  @override
  Int32x4 operator |(Int32x4 other) {
    int x = x | other.x;
    int y = y | other.y;
    int z = z | other.z;
    int w = w | other.w;
    return NaiveInt32x4._truncated(x, y, z, w);
  }

  @override
  Int32x4 operator &(Int32x4 other) {
    int x = x & other.x;
    int y = y & other.y;
    int z = z & other.z;
    int w = w & other.w;
    return NaiveInt32x4._truncated(x, y, z, w);
  }

  @override
  Int32x4 operator ^(Int32x4 other) {
    int x = x ^ other.x;
    int y = y ^ other.y;
    int z = z ^ other.z;
    int w = w ^ other.w;
    return NaiveInt32x4._truncated(x, y, z, w);
  }

  @override
  Int32x4 operator +(Int32x4 other) {
    int x = x + other.x;
    int y = y + other.y;
    int z = z + other.z;
    int w = w + other.w;
    return NaiveInt32x4._truncated(x, y, z, w);
  }

  @override
  Int32x4 operator -(Int32x4 other) {
    int x = x - other.x;
    int y = y - other.y;
    int z = z - other.z;
    int w = w - other.w;
    return NaiveInt32x4._truncated(x, y, z, w);
  }

  Int32x4 operator -() {
    return NaiveInt32x4._truncated(-x, -y, -z, -w);
  }

  @override
  int get signMask {
    int mx = (x & 0x80000000) >> 31;
    int my = (y & 0x80000000) >> 31;
    int mz = (z & 0x80000000) >> 31;
    int mw = (w & 0x80000000) >> 31;
    return mx | my << 1 | mz << 2 | mw << 3;
  }

  @override
  Int32x4 shuffle(int mask) {
    // mask < 0 || mask > 255
    if (mask.gtU(255)) {
      throw RangeError.range(mask, 0, 255, 'mask');
    }
    _list[0] = x;
    _list[1] = y;
    _list[2] = z;
    _list[3] = w;
    int x = _list[mask & 0x3];
    int y = _list[(mask >> 2) & 0x3];
    int z = _list[(mask >> 4) & 0x3];
    int w = _list[(mask >> 6) & 0x3];
    return NaiveInt32x4._truncated(x, y, z, w);
  }

  @override
  Int32x4 shuffleMix(Int32x4 other, int mask) {
    // mask < 0 || mask > 255
    if (mask.gtU(255)) {
      throw RangeError.range(mask, 0, 255, 'mask');
    }
    _list[0] = x;
    _list[1] = y;
    _list[2] = z;
    _list[3] = w;
    int x = _list[mask & 0x3];
    int y = _list[(mask >> 2) & 0x3];

    _list[0] = other.x;
    _list[1] = other.y;
    _list[2] = other.z;
    _list[3] = other.w;
    int z = _list[(mask >> 4) & 0x3];
    int w = _list[(mask >> 6) & 0x3];
    return NaiveInt32x4._truncated(x, y, z, w);
  }

  @override
  Int32x4 withX(int x) {
    int x0 = _truncate(x);
    return NaiveInt32x4._truncated(x0, y, z, w);
  }

  @override
  Int32x4 withY(int y) {
    int y0 = _truncate(y);
    return NaiveInt32x4._truncated(x, y0, z, w);
  }

  @override
  Int32x4 withZ(int z) {
    int z0 = _truncate(z);
    return NaiveInt32x4._truncated(x, y, z0, w);
  }

  @override
  Int32x4 withW(int w) {
    int w0 = _truncate(w);
    return NaiveInt32x4._truncated(x, y, z, w0);
  }

  @override
  bool get flagX => x != 0;

  @override
  bool get flagY => y != 0;

  @override
  bool get flagZ => z != 0;

  @override
  bool get flagW => w != 0;

  @override
  Int32x4 withFlagX(bool flagX) {
    int x = flagX ? -1 : 0;
    return NaiveInt32x4._truncated(x, y, z, w);
  }

  @override
  Int32x4 withFlagY(bool flagY) {
    int y = flagY ? -1 : 0;
    return NaiveInt32x4._truncated(x, y, z, w);
  }

  @override
  Int32x4 withFlagZ(bool flagZ) {
    int z = flagZ ? -1 : 0;
    return NaiveInt32x4._truncated(x, y, z, w);
  }

  @override
  Int32x4 withFlagW(bool flagW) {
    int w = flagW ? -1 : 0;
    return NaiveInt32x4._truncated(x, y, z, w);
  }

  @override
  Float32x4 select(Float32x4 trueValue, Float32x4 falseValue) {
    var floatList = NaiveFloat32x4._list;
    var intView = NaiveFloat32x4._uint32view;

    floatList[0] = trueValue.x;
    floatList[1] = trueValue.y;
    floatList[2] = trueValue.z;
    floatList[3] = trueValue.w;
    int stx = intView[0];
    int sty = intView[1];
    int stz = intView[2];
    int stw = intView[3];

    floatList[0] = falseValue.x;
    floatList[1] = falseValue.y;
    floatList[2] = falseValue.z;
    floatList[3] = falseValue.w;
    int sfx = intView[0];
    int sfy = intView[1];
    int sfz = intView[2];
    int sfw = intView[3];
    int x = (x & stx) | (~x & sfx);
    int y = (y & sty) | (~y & sfy);
    int z = (z & stz) | (~z & sfz);
    int w = (w & stw) | (~w & sfw);
    intView[0] = x;
    intView[1] = y;
    intView[2] = z;
    intView[3] = w;
    return NaiveFloat32x4._truncated(
        floatList[0], floatList[1], floatList[2], floatList[3]);
  }
}

String _int32ToHex(int i) => i.toRadixString(16).padLeft(8, '0');
