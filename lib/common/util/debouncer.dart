import 'dart:async';

import 'package:flutter/foundation.dart';

class Debouncer {
  /// The timer that will run the code after the specified milliseconds
  Timer? _timer;

  /// The number of times the run method has been called
  int _debounceCount = 0;

  /// Debug context (if any, will enable logging)
  String? context;

  /// The number of milliseconds to wait before running the code
  final int milliseconds;

  /// If set to false, runInitially will only run once
  final bool resetCountOnRun;

  /// If set to true, the code will run initially, also see [resetCountOnRun] for more configuration
  bool runInitially;

  Debouncer({
    required this.milliseconds,
    this.runInitially = false,
    this.context,
    this.resetCountOnRun = true,
  });

  /// Runs the code after the specified milliseconds, unless the run method is called again, in which case the timer is reset
  /// @param callback The code to run after the specified milliseconds
  /// @param afterCallback The code to run after the callback has been run
  void run(VoidCallback callback, {VoidCallback? afterCallback}) {
    if (_timer != null) {
      _timer!.cancel();
    }

    if (_debounceCount == 0 && runInitially) {
      if (context != null) {
        // debugLog('Run initially', context: 'Debouncer@${context}');
      }

      callback.call();
    } else {
      _timer = Timer(Duration(milliseconds: milliseconds), () {
        if (context != null) {
          // debugLog('Run', context: 'Debouncer@${context}');
        }

        callback.call();
        afterCallback?.call();

        if (resetCountOnRun) {
          _debounceCount = 0;
        }
      });
    }

    _debounceCount++;
  }

  void cancel() {
    _timer?.cancel();
  }

  void dispose() {
    _timer?.cancel();
  }
}
