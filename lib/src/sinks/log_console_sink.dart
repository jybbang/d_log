import 'package:d_log/d_log.dart';

class LogConsoleSink with ILogSink {
  @override
  void log(LogMessage logMessage) {
    print(logMessage.toString());
  }
}
