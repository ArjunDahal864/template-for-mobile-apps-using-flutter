import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState.initial());

  /// load function returns the different state
  /// main idea of load function is to
  /// check user and return the state of the user
  /// authorized,  unAuthrorized
  Future<void> load() async {}
}
