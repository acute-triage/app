import 'package:logger/logger.dart' as logger;

class Logger {
  static final _loggerOutput = ConsoleOutputAndRetain();

  static final logger.Logger _logger = logger.Logger(
    output: _loggerOutput,
    printer: logger.PrefixPrinter(
      logger.PrettyPrinter(
        methodCount: 0, // Number of method calls to be displayed
        errorMethodCount: 8, // Number of method calls if stacktrace is provided
        lineLength: 80, // Width of the output
        colors: false, // Colorful log messages
        printEmojis: true, // Print an emoji for each log message
        printTime: true, // Should each log print contain a timestamp
      ),
    ),
  );

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
    _logger.log(level, formatMessage(message));
  }

  static void d(
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

  static void e(
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

  static void i(
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

  static void w(
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

  static void v(
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

class ConsoleOutputAndRetain extends logger.LogOutput {
  final List<logger.OutputEvent> logs = [];

  @override
  void output(logger.OutputEvent event) {
    logs.add(event);

    for (var line in event.lines) {
      // ignore: avoid_print
      print(line);
    }
  }
}
