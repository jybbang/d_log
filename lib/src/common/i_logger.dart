import 'package:d_log/d_log.dart';

abstract class ILogger {
  String get loggerName;

  LogLevel get minimumLevel;

  ILogger setMinimumLevel(LogLevel minimumLevel);

  void logMessage(LogLevel logLevel, String message,
      {Exception? ex, DateTime? timestamp});

  void logDebug(String message, {Exception? ex, DateTime? timestamp});

  void logInformation(String message, {Exception? ex, DateTime? timestamp});

  void logWarning(String message, {Exception? ex, DateTime? timestamp});

  void logError(String message, {Exception? ex, DateTime? timestamp});
}
