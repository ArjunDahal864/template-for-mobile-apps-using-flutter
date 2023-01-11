import 'package:f_logs/f_logs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    FLog.info(
      className: "AppBlocObserver",
      methodName: "onEvent",
      dataLogType: event.runtimeType.toString(),
      text: event.toString(),
    );
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    FLog.info(
      className: 'AppBlocObserver',
      methodName: 'onChange',
      dataLogType: change.currentState.runtimeType.toString(),
      text: 'current state: ${change.currentState}\n next state: ${change.nextState}',
    );
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    FLog.error(
      className: 'AppBlocObserver',
      methodName: 'onError',
      dataLogType: stackTrace.runtimeType.toString(),
      text: stackTrace.toString(),
    );
    super.onError(bloc, error, stackTrace);
  }
}
