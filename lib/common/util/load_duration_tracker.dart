import 'dart:async';

import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/env.dart';

// Define an interface with the required method.
abstract class TimeoutCallback {
  /// Method to call on dispose [slowDurationThreshold] or [maxDurationThreshold] is reached
  void onLoadTookTooLong(
      Duration elapsed, String trackerKey, bool wasMaxDuration);
}

// TODO: Only enable this for a percentage of users, e.g. 10%
mixin LoadDurationTracker<T extends ConsumerStatefulWidget> on ConsumerState<T>
    implements TimeoutCallback {
  // final _loadLogContext = 'LoadDurationTracker';

  bool shouldTrack = true;

  bool isTrackingTime = false;

  String get runetimeTrackerKey => _firebaseTraceKey(runtimeType.toString());

  Duration slowDurationThreshold = 1.seconds;
  Duration maxDurationThreshold = 5.seconds;

  Duration timeElapsed(String key) =>
      _presenceStopwatches[key]?.elapsed ?? Duration.zero;

  final Map<String, Stopwatch?> _presenceStopwatches = {};
  final Map<String, Timer?> _maxDurationTimers = {};

  bool get loggingEnabled => mounted && shouldTrack;

  Trace? firebasePerformanceTrace;

  @override
  initState() {
    super.initState();
    shouldTrack = Env.showTraceSlowRequests;
  }

  /// The name requires no leading or trailing whitespace, no leading
  /// underscore _ character, and max length of 100
  /// characters. (https://firebase.google.com/docs/perf-mon/custom-code-traces?platform=flutter#add-custom-code-traces)
  String _firebaseTraceKey(String key) {
    // Trim leading and trailing whitespace
    String trimmedKey = key.trim();

    // Remove leading underscore
    if (trimmedKey.startsWith('_')) {
      trimmedKey = trimmedKey.substring(1);
    }

    // Enforce max length constraint
    if (trimmedKey.length > 100) {
      trimmedKey = trimmedKey.substring(0, 100);
    }

    return trimmedKey;
  }

  Future<void> trackLoadTimeFromNow({String? trackerKey}) async {
    // TODO: Current user id
    const currentUserId = null;

    final key = trackerKey ?? runetimeTrackerKey;
    if (!mounted || isTrackingTime || !loggingEnabled || key.isEmpty) {
      return;
    }

    this.isTrackingTime = true;

    firebasePerformanceTrace =
        FirebasePerformance.instance.newTrace(_firebaseTraceKey(key));

    // set threshold for max presence
    _maxDurationTimers[key]?.cancel();
    _maxDurationTimers[key] = Timer(maxDurationThreshold, () {
      maxLoadingDurationReached(key);
    });

    // start stopwatch
    _presenceStopwatches[key]?.stop();
    _presenceStopwatches[key] = Stopwatch()..start();

    await firebasePerformanceTrace!.start();

    // track user id for firebase performance
    if (currentUserId != null) {
      firebasePerformanceTrace!.putAttribute('user_id', currentUserId);
    }
  }

  /// Method to call when loading is finished
  completedLoading({String? trackerKey}) {
    final key = trackerKey ?? runetimeTrackerKey;

    if (!mounted || !isTrackingTime || !loggingEnabled || key.isEmpty) {
      // recordLog('LoadDurationTracker: Not tracking time', context: _loadLogContext);
      return;
    }

    this.isTrackingTime = false;

    maybeLogSlowRequest(key);

    _maxDurationTimers[key]?.cancel();
    _presenceStopwatches[key]?.stop();

    if (firebasePerformanceTrace != null) {
      firebasePerformanceTrace!.stop();
    }
  }

  /// Returns true if duration is greater than [slowDurationThreshold]
  bool maybeLogSlowRequest(String key, {bool maxDuration = false}) {
    final elapsed = timeElapsed(key);

    // recordLog('LoadDurationTracker: $key took ${elapsed.inMilliseconds}', context: _loadLogContext);

    if (elapsed > slowDurationThreshold) {
      onLoadTookTooLong(elapsed, key, maxDuration);
      return true;
    }

    return false;
  }

  /// Method to call when [maxDurationThreshold] is reached
  maxLoadingDurationReached(String key) {
    if (!mounted || !isTrackingTime || !loggingEnabled) {
      // recordLog('LoadDurationTracker (timeout): Not tracking time', context: _loadLogContext);
      return;
    }

    maybeLogSlowRequest(key, maxDuration: true);
  }
}
