import 'package:flutter/foundation.dart';
import 'package:d_log/d_log.dart';

mixin ILogSink {
  ILogSink? _nextSink;
  LogLevel _minimumLevel = LogLevel.Deb;
  LogLevel get minimumLevel => _minimumLevel;

  @protected
  void log(LogMessage logMessage);

  void logNext(LogMessage logMessage) {
    if (_minimumLevel <= logMessage.logLevel) log(logMessage);
    _nextSink?.logNext(logMessage);
  }

  ILogSink setMinimumLevel(LogLevel minimumLevel) {
    _minimumLevel = minimumLevel;
    return this;
  }

  ILogSink addNextSink(ILogSink sink) {
    _nextSink = sink;
    return this;
  }
}
