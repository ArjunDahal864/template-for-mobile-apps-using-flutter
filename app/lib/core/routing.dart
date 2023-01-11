import 'package:app/ui/ui.dart';
import 'package:go_router/go_router.dart';
import '/utils/utils.dart';

class AppRoute {
  /// Here we define all the routes
  /// These routes are present in
  /// can be navigated using
  /// context.read
  /// context.go
  ///

  GoRouter get routerConfig => _router;
  static final _router = GoRouter(
    routes: [
      GoRoute(
        path: kROUTESplash,
        builder: (context, state) => const SpalshScreen(),
      ),
    ],

    /// Default error page
    /// when there is no match
    /// this will be shown
    /// this is helpful for deeplinks
    /// where app can be opened from browser
    /// or by clicking links
    errorBuilder: (context, state) => ErrorScreen(
      state: state,
    ),
  );
}
