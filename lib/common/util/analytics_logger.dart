import 'dart:collection';
import 'dart:math';

import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter_starter/common/application/logger.dart';
import 'package:flutter_starter/common/util/is_debugging.dart';
import 'package:flutter_starter/env.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';

/// Class utilizing Singleton design pattern. Get static instance by calling unnamed constructor.
/// Make sure it is initialized using named constructor.
class AnalyticsLogger {
  bool _hasInitialized = false;
  late Mixpanel analytics;

  /// A queue to rate limit events
  final Map<String, Queue<DateTime>> _rateLimitQueue = {};

  AnalyticsLogger._privateConstructor();

  static final AnalyticsLogger _instance =
      AnalyticsLogger._privateConstructor();

  late Random _random;

  // Always initialize using initialize contructor before using this Singleton
  factory AnalyticsLogger() {
    return _instance;
  }

  static Future<AnalyticsLogger> initialize() async {
    if (_instance._hasInitialized) {
      _instance;
    }

    _instance._random = Random();

    if (Env.mixpanelToken != null) {
      _instance.analytics = await Mixpanel.init(
        Env.mixpanelToken!,
        trackAutomaticEvents: true,
      );
      _instance.analytics.setServerURL("https://api-eu.mixpanel.com");
    }

    _instance._hasInitialized = true;

    return _instance;
  }

  void setUserId(String userId) async {
    _instance.analytics.identify(userId);
    getPeople().set('userId', userId);
  }

  // getPeople instance
  People getPeople() {
    return _instance.analytics.getPeople();
  }

  Future<String> getDistinctId() {
    return _instance.analytics.getDistinctId();
  }

  Future<void> logout() async {
    await flush();

    _instance.analytics.reset(); // resets user id and clears super properties
  }

  Future<void> flush() async {
    if (!_instance._hasInitialized) {
      return;
    }
    _instance.analytics.flush();
  }

  void logEvent(
    AnalyticsEvent eventName, [
    Map<String, dynamic>? eventProperties,

    /// Percentage of logs to be sent to Mixpanel
    /// 100 means all logs will be sent
    /// 1 means 1% of logs will be sent
    int logPercentage = 100,
  ]) {
    if (!_instance._hasInitialized) {
      Logger.error("Not initialized", context: "Analytics");
      return;
    }
    final rateLimit = rateLimitEvents[eventName];
    // Check if event is rate limited

    if (rateLimit != null) {
      final key = eventNameMap[eventName]!;
      final duration = rateLimit[0] as Duration;
      final maxCalls = rateLimit[1] as int;

      if (!_shouldCall(key, duration, maxCalls)) {
        Logger.info("Rate limited event: $eventName", context: toString());
        return;
      }
    }

    // Log
    Logger.info("${eventName.name} $eventProperties", context: toString());

    final shouldLog = !isDebugging() &&
        (logPercentage == 100 || _random.nextInt(100) < logPercentage);

    if (shouldLog) {
      analytics.track(
        eventNameMap[eventName] ?? "Unknown",
        properties: eventProperties ?? {},
      );
    }
  }

  void logEventWithRateLimit(
    AnalyticsEvent eventName, {
    Map<String, dynamic>? properties,
    String? key,
    Duration duration = const Duration(seconds: 10),
    int maxCalls = 1,
  }) {
    if (!_instance._hasInitialized) {
      Logger.error("Not initialized", context: toString());
      return;
    }

    final eventKey = key ?? eventNameMap[eventName]!;

    if (_shouldCall(eventKey, duration, maxCalls)) {
      logEvent(eventName, properties);
    }
  }

  void increment(
    AnalyticsEvent eventName,
    double amount,
  ) {
    Logger.info("increment: $eventName with: $amount", context: toString());

    if (!isDebugging()) {
      analytics.getPeople().increment(
            eventNameMap[eventName] ?? "Unknown",
            amount,
          );
    }
  }

  bool _shouldCall(String key, Duration duration, int maxCalls) {
    final now = DateTime.now();
    final callTimes = _rateLimitQueue[key] ?? Queue<DateTime>();

    // Remove calls that happened before the duration window
    while (callTimes.isNotEmpty && now.difference(callTimes.first) > duration) {
      callTimes.removeFirst();
    }
    // Check if there is room for another call
    if (callTimes.length < maxCalls) {
      _rateLimitQueue[key] = callTimes..add(now);
      return true;
    }
    return false;
  }

  // Strings following Amplitude Taxonomy best practices
  Map<AnalyticsEvent, String> eventNameMap = {
    // etc
    AnalyticsEvent.openedSupport: "Opened support",
    AnalyticsEvent.errorWidgetShown: "Error widget shown",
    AnalyticsEvent.promptedToSolveCaptcha:
        "User was asked to solve captcha to proceed",
    AnalyticsEvent.manualLogot: "User manually logged out",
    AnalyticsEvent.forcedLogout: "User was logged out",

    // Update
    AnalyticsEvent.requiredUpdateDialogShown: "Required update dialog shown",
    AnalyticsEvent.optionUpdateDialogShown: "Optional update dialog shown",
    AnalyticsEvent.updateDialogDismissed: "Update dialog dismissed",
    AnalyticsEvent.updateDialogAccepted: "Update dialog accepted",
    AnalyticsEvent.sentFeedback: "Sent feedback",

    // App Lifecycle
    AnalyticsEvent.appStarted: "App started",
    AnalyticsEvent.appClosed: "App closed",
    AnalyticsEvent.appPaused: "App paused",
    AnalyticsEvent.appResumed: "App resumed",

    // Slow events
    AnalyticsEvent.slowLoad: "Slow load",
    AnalyticsEvent.slowSplashScreen: "Slow splash screen",
  };
}

enum AnalyticsEvent {
  // etc
  openedSupport,
  errorWidgetShown,
  sentFeedback,
  promptedToSolveCaptcha,
  manualLogot,
  forcedLogout,

  // Update
  requiredUpdateDialogShown,
  optionUpdateDialogShown,
  updateDialogDismissed,
  updateDialogAccepted,

  // APP LIFECYCLE
  appStarted,
  appClosed,
  appPaused,
  appResumed,

  // Load time
  slowLoad,
  slowSplashScreen,
}

// First value is the duration window, second value is the max calls within that window
final rateLimitEvents = {
  AnalyticsEvent.slowLoad: [10.minutes, 15],
};
