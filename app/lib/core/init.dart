import 'package:flutter/material.dart';
import '/core/core.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLogger();
  await setupLocator();
}
