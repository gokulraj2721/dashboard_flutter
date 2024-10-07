// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of "internal_patch.dart";

@pragma("vm:entry-point")
class ClassID {
  @pragma("vm:recognized", "other")
  @pragma("vm:exact-result-type", "dart:core#_Smi")
  @pragma("vm:external-name", "ClassID_getID")
  external static int getID(Object? value);

  @pragma("vm:entry-point")
  static const int cidArray = 0;
  @pragma("vm:entry-point")
  static const int cidGrowableObjectArray = 0;
  @pragma("vm:entry-point")
  static const int cidImmutableArray = 0;
  @pragma("vm:entry-point")
  static const int cidOneByteString = 0;
  @pragma("vm:entry-point")
  static const int cidTwoByteString = 0;
  @pragma("vm:entry-point")
  static const int cidUint8ArrayView = 0;
  @pragma("vm:entry-point")
  static const int cidUint8Array = 0;
  @pragma("vm:entry-point")
  static const int cidInt8ArrayView = 0;
  @pragma("vm:entry-point")
  static const int cidInt8Array = 0;
  @pragma("vm:entry-point")
  static const int cidExternalUint8Array = 0;
  @pragma("vm:entry-point")
  static const int cidExternalInt8Array = 0;
  @pragma("vm:entry-point")
  static const int cidUint8ClampedArray = 0;
  @pragma("vm:entry-point")
  static const int cidExternalUint8ClampedArray = 0;
  // Used in const hashing to determine whether we're dealing with a
  // user-defined const. See lib/_internal/vm/lib/compact_hash.dart.
  @pragma("vm:entry-point")
  static const int numPredefinedCids = 0;
}
