import 'package:app/ui/ui.dart';
import 'package:dio/dio.dart';
import 'package:f_logs/f_logs.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
// APP PACKAGES
import '/common/common.dart';
import '/utils/utils.dart';
import 'core.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupLocator() async {
  FLog.info(
    text: "Setting up Locator",
    className: "ServiceLocator",
    methodName: "setupLocator",
  );

  /// Can't directly inject shared preference needs to have
  /// to be initialized first and then injected
  /// Loads and parses the [SharedPreferences] for this app from disk.
  final sharedPref = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(
    () => sharedPref,
  );

  /// FlutterLocalNotification is used to show notification
  /// when user is in app
  /// and needs to be shown when there is any remote notification
  getIt.registerLazySingleton(
    FlutterLocalNotificationsPlugin.new,
  );

  /// AppBlocObserver is reponsible for observing all the blocs in app
  getIt.registerLazySingleton(
    AppBlocObserver.new,
  );

  /// AppRoute is responsible for handling all the routing related stuffs
  getIt.registerLazySingleton(
    AppRoute.new,
  );

  final dio = Dio(BaseOptions(
    baseUrl: kURLBase,
  ));

  dio.interceptors.addAll({
    CustomErrorLogger(),
    APIInterceptor(dio),
  });

  getIt.registerLazySingleton(() => dio);

  /// Repository

  /// Service

  /// Blocs
  /// these are responsible for all apps states [Screens]
  /// and will be created and destroyed depending upon the calls and uses
  /// For blocs I recommend and prefer to use registerFactory
  getIt.registerFactory(SplashCubit.new);
}
