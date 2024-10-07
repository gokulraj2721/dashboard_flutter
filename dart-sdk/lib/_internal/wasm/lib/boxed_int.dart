// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:_internal';
import 'dart:_wasm';

@pragma("wasm:entry-point")
final class _BoxedInt extends int {
  // A boxed int contains an unboxed int.
  @pragma("wasm:entry-point")
  int value = 0;

  /// Dummy factory to silence error about missing superclass constructor.
  external factory _BoxedInt();

  @override
  external num operator +(num other);
  @override
  external num operator -(num other);
  @override
  external num operator *(num other);

  @override
  @pragma("wasm:prefer-inline")
  double operator /(num other) {
    return toDouble() / other.toDouble();
  }

  @override
  @pragma("wasm:prefer-inline")
  int operator ~/(num other) => other is int
      ? _truncDiv(value, other)
      : _BoxedDouble.truncDiv(toDouble(), unsafeCast<double>(other));

  @override
  @pragma("wasm:prefer-inline")
  num operator %(num other) => other is int
      ? _modulo(this, other)
      : _BoxedDouble.modulo(toDouble(), unsafeCast<double>(other));

  static int _modulo(int a, int b) {
    int rem = a - (a ~/ b) * b;
    if (rem < 0) {
      if (b < 0) {
        return rem - b;
      } else {
        return rem + b;
      }
    }
    return rem;
  }

  @pragma("wasm:prefer-inline")
  static int _truncDiv(int a, int b) {
    // Division special case: overflow in I64.
    // MIN_VALUE / -1 = (MAX_VALUE + 1), which wraps around to MIN_VALUE
    const int minInt = -9223372036854775808;
    if (a == minInt && b == -1) {
      return minInt;
    }

    if (b == 0) {
      throw const IntegerDivisionByZeroException();
    }

    return a._div_s(b);
  }

  @override
  @pragma("wasm:prefer-inline")
  num remainder(num other) => other is int
      ? this - (this ~/ other) * other
      : _BoxedDouble.computeRemainder(toDouble(), unsafeCast<double>(other));

  @override
  external int operator -();

  @override
  external int operator &(int other);
  @override
  external int operator |(int other);
  @override
  external int operator ^(int other);

  @override
  @pragma("wasm:prefer-inline")
  int operator >>(int shift) {
    // Unsigned comparison to check for large and negative shifts
    if (shift._lt_u(64)) {
      return value._shr_s(shift);
    }

    if (shift < 0) {
      throw ArgumentError(shift);
    }

    // shift >= 64, 0 or -1 depending on sign: `this >= 0 ? 0 : -1`
    return value._shr_s(63);
  }

  @override
  @pragma("wasm:prefer-inline")
  int operator >>>(int shift) {
    // Unsigned comparison to check for large and negative shifts
    if (shift._lt_u(64)) {
      return value._shr_u(shift);
    }

    if (shift < 0) {
      throw ArgumentError(shift);
    }

    // shift >= 64
    return 0;
  }

  @override
  @pragma("wasm:prefer-inline")
  int operator <<(int shift) {
    // Unsigned comparison to check for large and negative shifts
    if (shift._lt_u(64)) {
      return value._shl(shift);
    }

    if (shift < 0) {
      throw ArgumentError(shift);
    }

    // shift >= 64
    return 0;
  }

  @override
  external bool operator <(num other);
  @override
  external bool operator >(num other);
  @override
  external bool operator >=(num other);
  @override
  external bool operator <=(num other);

  @override
  @pragma("wasm:prefer-inline")
  bool operator ==(Object other) {
    return other is int
        ? this == other // Intrinsic ==
        : other is double
            ? toDouble() == other // Intrinsic ==
            : false;
  }

  @override
  @pragma("wasm:prefer-inline")
  int abs() {
    return this < 0 ? -this : this;
  }

  @override
  @pragma("wasm:prefer-inline")
  int get sign => (this >> 63) | (-this >>> 63);

  @override
  @pragma("wasm:prefer-inline")
  bool get isEven => (this & 1) == 0;
  @override
  @pragma("wasm:prefer-inline")
  bool get isOdd => (this & 1) != 0;
  @override
  @pragma("wasm:prefer-inline")
  bool get isNaN => false;
  @override
  @pragma("wasm:prefer-inline")
  bool get isNegative => this < 0;
  @override
  @pragma("wasm:prefer-inline")
  bool get isInfinite => false;
  @override
  @pragma("wasm:prefer-inline")
  bool get isFinite => true;

  @override
  @pragma("wasm:prefer-inline")
  int toUnsigned(int width) {
    return this & ((1 << width) - 1);
  }

  @override
  @pragma("wasm:prefer-inline")
  int toSigned(int width) {
    // The value of binary number weights each bit by a power of two.  The
    // twos-complement value weights the sign bit negatively.  We compute the
    // value of the negative weighting by isolating the sign bit with the
    // correct power of two weighting and subtracting it from the value of the
    // lower bits.
    int signMask = 1 << (width - 1);
    return (this & (signMask - 1)) - (this & signMask);
  }

  @override
  int compareTo(num other) {
    const int EQUAL = 0, LESS = -1, GREATER = 1;
    if (other is double) {
      const int maxExactIntToDouble = 9007199254740992; // 2^53.
      const int minExactIntToDouble = -maxExactIntToDouble;
      // With int limited to 64 bits, double.toInt() clamps
      // double value to fit into the MIN_INT64..MAX_INT64 range.
      // Check if the double value is outside of this range.
      // This check handles +/-infinity as well.
      const double minInt64AsDouble = -9223372036854775808.0;
      // MAX_INT64 is not precisely representable in doubles, so
      // check against (MAX_INT64 + 1).
      const double maxInt64Plus1AsDouble = 9223372036854775808.0;
      if (other < minInt64AsDouble) {
        return GREATER;
      } else if (other >= maxInt64Plus1AsDouble) {
        return LESS;
      }
      if (other.isNaN) {
        return LESS;
      }
      if (minExactIntToDouble <= this && this <= maxExactIntToDouble) {
        // Let the double implementation deal with -0.0.
        return -(other.compareTo(toDouble()));
      } else {
        // If abs(other) > MAX_EXACT_INT_TO_DOUBLE, then other has an integer
        // value (no bits below the decimal point).
        other = other._toInt();
      }
    }
    if (this < other) {
      return LESS;
    } else if (this > other) {
      return GREATER;
    } else {
      return EQUAL;
    }
  }

  @override
  @pragma("wasm:prefer-inline")
  int round() {
    return this;
  }

  @override
  @pragma("wasm:prefer-inline")
  int floor() {
    return this;
  }

  @override
  @pragma("wasm:prefer-inline")
  int ceil() {
    return this;
  }

  @override
  @pragma("wasm:prefer-inline")
  int truncate() {
    return this;
  }

  @override
  @pragma("wasm:prefer-inline")
  double roundToDouble() {
    return toDouble();
  }

  @override
  @pragma("wasm:prefer-inline")
  double floorToDouble() {
    return toDouble();
  }

  @override
  @pragma("wasm:prefer-inline")
  double ceilToDouble() {
    return toDouble();
  }

  @override
  @pragma("wasm:prefer-inline")
  double truncateToDouble() {
    return toDouble();
  }

  @override
  num clamp(num lowerLimit, num upperLimit) {
    // Special case for integers.
    if (lowerLimit is int && upperLimit is int && lowerLimit <= upperLimit) {
      if (this < lowerLimit) return lowerLimit;
      if (this > upperLimit) return upperLimit;
      return this;
    }
    // Generic case involving doubles, and invalid integer ranges.
    if (lowerLimit.compareTo(upperLimit) > 0) {
      throw ArgumentError(lowerLimit);
    }
    if (lowerLimit.isNaN) return lowerLimit;
    // Note that we don't need to care for -0.0 for the lower limit.
    if (this < lowerLimit) return lowerLimit;
    if (compareTo(upperLimit) > 0) return upperLimit;
    return this;
  }

  @override
  @pragma("wasm:prefer-inline")
  int toInt() {
    return this;
  }

  @override
  external double toDouble();

  @override
  String toStringAsFixed(int fractionDigits) {
    return toDouble().toStringAsFixed(fractionDigits);
  }

  @override
  String toStringAsExponential([int? fractionDigits]) {
    return toDouble().toStringAsExponential(fractionDigits);
  }

  @override
  String toStringAsPrecision(int precision) {
    return toDouble().toStringAsPrecision(precision);
  }

  @override
  external String toRadixString(int radix);

  // Returns pow(this, e) % m.
  @override
  int modPow(int e, int m) {
    if (e < 0) throw RangeError.range(e, 0, null, "exponent");
    if (m <= 0) throw RangeError.range(m, 1, null, "modulus");
    if (e == 0) return 1;

    // This is floor(sqrt(2^63)).
    const int maxValueThatCanBeSquaredWithoutTruncation = 3037000499;
    if (m > maxValueThatCanBeSquaredWithoutTruncation) {
      // Use BigInt version to avoid truncation in multiplications below.
      return BigInt.from(this).modPow(BigInt.from(e), BigInt.from(m)).toInt();
    }

    int b = this;
    // b < 0 || b > m, m is positive (checked above)
    if (b.gtU(m)) {
      b %= m;
    }
    int r = 1;
    while (e > 0) {
      if (e.isOdd) {
        r = (r * b) % m;
      }
      e >>= 1;
      b = (b * b) % m;
    }
    return r;
  }

  // If inv is false, returns gcd(x, y).
  // If inv is true and gcd(x, y) = 1, returns d, so that c*x + d*y = 1.
  // If inv is true and gcd(x, y) != 1, throws Exception("Not coprime").
  static int _binaryGcd(int x, int y, bool inv) {
    int s = 0;
    if (!inv) {
      while (x.isEven && y.isEven) {
        x >>= 1;
        y >>= 1;
        s++;
      }
      if (y.isOdd) {
        var t = x;
        x = y;
        y = t;
      }
    }
    final bool ac = x.isEven;
    int u = x;
    int v = y;
    int a = 1, b = 0, c = 0, d = 1;
    do {
      while (u.isEven) {
        u >>= 1;
        if (ac) {
          if (!a.isEven || !b.isEven) {
            a += y;
            b -= x;
          }
          a >>= 1;
        } else if (!b.isEven) {
          b -= x;
        }
        b >>= 1;
      }
      while (v.isEven) {
        v >>= 1;
        if (ac) {
          if (!c.isEven || !d.isEven) {
            c += y;
            d -= x;
          }
          c >>= 1;
        } else if (!d.isEven) {
          d -= x;
        }
        d >>= 1;
      }
      if (u >= v) {
        u -= v;
        if (ac) a -= c;
        b -= d;
      } else {
        v -= u;
        if (ac) c -= a;
        d -= b;
      }
    } while (u != 0);
    if (!inv) return v << s;
    if (v != 1) {
      throw Exception("Not coprime");
    }
    if (d < 0) {
      d += x;
      if (d < 0) d += x;
    } else if (d > x) {
      d -= x;
      if (d > x) d -= x;
    }
    return d;
  }

  // Returns 1/this % m, with m > 0.
  @override
  int modInverse(int m) {
    if (m <= 0) throw RangeError.range(m, 1, null, "modulus");
    if (m == 1) return 0;
    int t = this;
    // t < 0 || t >= m, m is positive (checked above)
    if (t.geU(m)) t %= m;
    if (t == 1) return 1;
    if ((t == 0) || (t.isEven && m.isEven)) {
      throw Exception("Not coprime");
    }
    return _binaryGcd(m, t, true);
  }

  // Returns gcd of abs(this) and abs(other).
  @override
  int gcd(int other) {
    int x = abs();
    int y = other.abs();
    if (x == 0) return y;
    if (y == 0) return x;
    if ((x == 1) || (y == 1)) return 1;
    return _binaryGcd(x, y, false);
  }

  @override
  int get hashCode => _intHashCode(this);

  @override
  external int operator ~();
  @override
  external int get bitLength;

  @override
  external String toString();
}

int _intHashCode(int value) {
  const int magic = 0x2D51;
  int lower = (value & 0xFFFFFFFF) * magic;
  int upper = (value >>> 32) * magic;
  int upperAccum = upper + (lower >>> 32);
  return (lower ^ upperAccum ^ (upperAccum >>> 32)) & 0x3FFFFFFF;
}
