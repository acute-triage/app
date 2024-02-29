import 'package:talker_flutter/talker_flutter.dart';

final talker = TalkerFlutter.init();

class Logger {
  static final Talker _logger = talker;

  static String formatMessage(dynamic message, {String? context}) {
    return [
      if (context != null) '[$context]',
      message,
    ].join(' ');
  }

  static void log(
    LogLevel level,
    dynamic message, {
    String? context,
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.log(
      formatMessage(message, context: context),
      logLevel: level,
      exception: error,
      stackTrace: stackTrace,
    );
  }

  static void debug(
    dynamic message, {
    String? context,
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    log(
      LogLevel.debug,
      message,
      context: context,
      time: time,
      error: error,
      stackTrace: stackTrace,
    );
  }

  static void error(
    dynamic message, {
    String? context,
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    log(
      LogLevel.error,
      message,
      context: context,
      time: time,
      error: error,
      stackTrace: stackTrace,
    );
  }

  static void info(
    dynamic message, {
    String? context,
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    log(
      LogLevel.info,
      message,
      context: context,
      time: time,
      error: error,
      stackTrace: stackTrace,
    );
  }

  static void warn(
    dynamic message, {
    String? context,
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    log(
      LogLevel.warning,
      message,
      context: context,
      time: time,
      error: error,
      stackTrace: stackTrace,
    );
  }

  static void verbose(
    dynamic message, {
    String? context,
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    log(
      LogLevel.verbose,
      message,
      context: context,
      time: time,
      error: error,
      stackTrace: stackTrace,
    );
  }
}
