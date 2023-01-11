import 'package:app/app.dart';
import 'package:app/core/core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLogger();
  await setupLocator();
  runApp(const App());
}
