import 'package:d_log/d_log.dart';

class Logger implements ILogger {
  final LogManager _logManager;
  final String _loggerName;
  LogLevel _minimumLevel = LogLevel.Deb;

  String get loggerName => _loggerName;
  LogLevel get minimumLevel => _minimumLevel;

  Logger(this._logManager, this._loggerName);

  ILogger setMinimumLevel(LogLevel minimumLevel) {
    _minimumLevel = minimumLevel;
    return this;
  }

  void logMessage(LogLevel logLevel, String message,
      {Exception? ex, DateTime? timestamp}) {
    if (_minimumLevel > logLevel) return;

    final logMessage = LogMessage(
        logLevel: logLevel,
        message: message,
        loggerName: loggerName,
        timestamp: timestamp,
        ex: ex);

    _logManager.log(logMessage);
  }

  void logDebug(String message, {Exception? ex, DateTime? timestamp}) {
    if (_minimumLevel > LogLevel.Deb) return;

    final logMessage = LogMessage(
        logLevel: LogLevel.Deb,
        message: message,
        loggerName: loggerName,
        timestamp: timestamp,
        ex: ex);

    _logManager.log(logMessage);
  }

  void logInformation(String message, {Exception? ex, DateTime? timestamp}) {
    if (_minimumLevel > LogLevel.Inf) return;

    final logMessage = LogMessage(
        logLevel: LogLevel.Inf,
        message: message,
        loggerName: loggerName,
        timestamp: timestamp,
        ex: ex);

    _logManager.log(logMessage);
  }

  void logWarning(String message, {Exception? ex, DateTime? timestamp}) {
    if (_minimumLevel > LogLevel.Wan) return;

    final logMessage = LogMessage(
        logLevel: LogLevel.Wan,
        message: message,
        loggerName: loggerName,
        timestamp: timestamp,
        ex: ex);

    _logManager.log(logMessage);
  }

  void logError(String message, {Exception? ex, DateTime? timestamp}) {
    if (_minimumLevel > LogLevel.Err) return;

    final logMessage = LogMessage(
        logLevel: LogLevel.Err,
        message: message,
        loggerName: loggerName,
        timestamp: timestamp,
        ex: ex);

    _logManager.log(logMessage);
  }
}
