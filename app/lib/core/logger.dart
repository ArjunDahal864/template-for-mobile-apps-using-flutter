import 'package:f_logs/f_logs.dart';

void setupLogger() {
  /// Configuration for logger
  LogsConfig config = FLog.getDefaultConfigurations()
    ..isDevelopmentDebuggingEnabled = true
    ..timestampFormat = TimestampFormat.TIME_FORMAT_FULL_3
    ..formatType = FormatType.FORMAT_CUSTOM
    ..fieldOrderFormatCustom = [
      FieldName.TEXT,
      FieldName.LOG_LEVEL,
      FieldName.CLASSNAME,
      FieldName.METHOD_NAME,
      FieldName.EXCEPTION,
      FieldName.STACKTRACE,
    ]
    ..customOpeningDivider = "{"
    ..customClosingDivider = "}";
  FLog.applyConfigurations(config);
}
