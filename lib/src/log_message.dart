import 'package:flutter/material.dart';
import 'package:d_log/d_log.dart';

class LogMessage {
  final LogLevel logLevel;
  final String message;
  final String loggerName;
  final DateTime timestamp;
  final Exception? ex;

  LogMessage({
    required this.logLevel,
    required this.message,
    String? loggerName,
    DateTime? timestamp,
    this.ex,
  })  : this.timestamp = timestamp ?? DateTime.now(),
        this.loggerName = loggerName ?? "Undefined";

  String get _logLevelString =>
      logLevel.toString().split('.').last.toUpperCase();

  Color _getLogEntryColor() {
    switch (logLevel) {
      case LogLevel.Inf:
        return Colors.green;
      case LogLevel.Wan:
        return Colors.orange;
      case LogLevel.Err:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  String toString() {
    return ex == null
        ? "$timestamp | $_logLevelString | $loggerName - $message"
        : "$timestamp | $_logLevelString | $loggerName - $message (${ex.runtimeType})";
  }

  Map<String, dynamic> toJson() => {
        "logLevel": _logLevelString,
        "message": message,
        "loggerName": loggerName,
        "timestamp": timestamp.toIso8601String(),
        "ex": ex.toString(),
      };

  Widget render() {
    return Text(
      this.toString(),
      style: TextStyle(
        color: _getLogEntryColor(),
      ),
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }
}
