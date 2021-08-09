enum LogLevel {
  Deb,
  Inf,
  Wan,
  Err,
}

extension LogLevelExtensions on LogLevel {
  bool operator >(LogLevel loglevel) => this.index > loglevel.index;
  bool operator <=(LogLevel loglevel) => this.index <= loglevel.index;
}
