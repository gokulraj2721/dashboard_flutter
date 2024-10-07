// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of "async_patch.dart";

@patch
class _AsyncRun {
  @patch
  static void _scheduleImmediate(void Function() callback) {
    final closure = _ScheduleImmediate._closure;
    if (closure == null) {
      throw UnsupportedError("Microtasks are not supported");
    }
    closure(callback);
  }
}

typedef _ScheduleImmediateClosure = void Function(void callback());

class _ScheduleImmediate {
  static _ScheduleImmediateClosure? _closure;
}

@pragma("vm:entry-point", "call")
void _setScheduleImmediateClosure(_ScheduleImmediateClosure closure) {
  _ScheduleImmediate._closure = closure;
}

@pragma("vm:entry-point", "call")
void _ensureScheduleImmediate() {
  _AsyncRun._scheduleImmediate(_startMicrotaskLoop);
}
