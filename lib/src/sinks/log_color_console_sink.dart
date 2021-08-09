import 'package:d_log/d_log.dart';

class LogColorConsoleSink with ILogSink {
  @override
  void log(LogMessage logMessage) {
    var message = logMessage.toString();

    switch (logMessage.logLevel) {
      case LogLevel.Deb:
        print('🐛 \x1B[37m$message\x1B[0m');
        break;
      case LogLevel.Wan:
        print('🚧 \x1B[33m$message\x1B[0m');
        break;
      case LogLevel.Err:
        print('🚫 \x1B[31m$message\x1B[0m');
        break;
      default:
        print('✅ \x1B[32m$message\x1B[0m');
        break;
    }
  }
}
