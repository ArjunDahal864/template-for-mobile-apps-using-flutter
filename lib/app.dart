import 'package:f_logs/f_logs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/core.dart';
import 'generated/l10n.dart';
import 'utils/utils.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    FLog.info(
      text: "App Started",
      className: "App",
      methodName: "build",
    );
    final appRoute = getIt<AppRoute>();
    
    return MaterialApp.router(
      /// Enable to show debug banner.
      debugShowCheckedModeBanner: false,
      scrollBehavior: const CustomScrollBehaviour(),
      routerConfig: appRoute.routerConfig,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
      title: kTAppName,
    );
  }
}
