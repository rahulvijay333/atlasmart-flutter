import 'dart:developer';

import 'package:atlasmart/domain/login/login_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/auth/model/auth_token.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginService loginService;

  LoginBloc({required this.loginService}) : super(const _Initial()) {
    on<_LoginButtonClickEvent>(_onLoginButtonClickEvent);
    on<_LogOutButtonClick>(_onLogOutButtonClick);
  }

  Future<void> _onLoginButtonClickEvent(
    _LoginButtonClickEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(const _Loading());
    try {
      // Call your AuthRepository to login
      final tokens = await loginService.login(event.email, event.password);
      emit(_Success(tokens));
    } catch (e) {
      log(e.toString());
      emit(_Failure(e.toString()));
    }
  }

  Future<void> _onLogOutButtonClick(
    _LogOutButtonClick event,
    Emitter<LoginState> emit,
  ) async {
    emit(const _Loading());
    try {
      await loginService.logout();
      emit(const _Initial());
    } catch (e) {
      emit(_Failure(e.toString()));
    }
  }
}
