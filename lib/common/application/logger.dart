import 'package:logger/logger.dart' as logger;

class Logger {
  static final _logger = logger.Logger();

  static String formatMessage(dynamic message, {String? context}) {
    return [
      if (context != null) '[$context]',
      message,
    ].join(' ');
  }

  static void log(
    logger.Level level,
    dynamic message, {
    String? context,
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.log(
      level,
      formatMessage(message, context: context),
      error: error,
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
      logger.Level.debug,
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
      logger.Level.error,
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
      logger.Level.info,
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
      logger.Level.warning,
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
      logger.Level.trace,
      message,
      context: context,
      time: time,
      error: error,
      stackTrace: stackTrace,
    );
  }
}
