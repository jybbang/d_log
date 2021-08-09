import 'package:d_log/d_log.dart';

class LogManager {
  static final LogManager _logManager = LogManager._();

  final _loggers = <String, ILogger>{};
  ILogSink? _sink;
  LogLevel _minimumLevel = LogLevel.Deb;

  LogLevel get minimumLevel => _minimumLevel;

  factory LogManager() {
    return _logManager;
  }

  LogManager._();

  LogManager setMinimumLevel(LogLevel minimumLevel) {
    _minimumLevel = minimumLevel;
    return this;
  }

  LogManager addSink(ILogSink sink) {
    _sink = _sink?.addNextSink(sink) ?? sink;
    return this;
  }

  ILogger getLogger<T>() {
    final loggerName = T.toString();
    return getLoggerByName(loggerName);
  }

  ILogger getLoggerByName(String loggerName) {
    if (!_loggers.containsKey(loggerName)) {
      _loggers[loggerName] = Logger(this, loggerName);
    }

    return _loggers[loggerName]!;
  }

  void log(LogMessage logMessage) {
    if (_minimumLevel > logMessage.logLevel) return;

    _sink?.logNext(logMessage);
  }
}
