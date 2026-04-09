import 'dart:developer';

import 'package:atlasmart/domain/core/constants/strings.dart';
import 'package:atlasmart/domain/login/login_service.dart';
import 'package:atlasmart/infrastructure/login/model/user_details/user_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/auth/model/auth_token.dart';
import '../../domain/core/util/firebase/firebase.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginService loginService;

  LoginBloc({required this.loginService}) : super(const _Initial()) {
    on<_LoginButtonClickEvent>(_onLoginButtonClickEvent);
    on<_LogOutButtonClick>(_onLogOutButtonClick);
    on<_sendOtpButtonClick>(_onSendOtpButtonClicked);
    on<_verifyAccountButtonClick>(_onVerifyAccountButtonClicked);
  }

  Future<void> _onSendOtpButtonClicked(
    _sendOtpButtonClick event,
    Emitter<LoginState> emit,
  ) async {
    emit(_verifyOtpSentLoading());

    try {
      final sentOtp = await loginService.sendEmailOtp(email: event.email);

      if (sentOtp == true) {
        emit(_verifyOtpSentSuccess(email: event.email));
      } else {
        emit(_verifyOtpSendFailed(AppStrings.someIssueHappenedBloc));
      }
    } catch (e) {
      log(e.toString());
      emit(_verifyOtpSendFailed(e.toString()));
    }
  }

  Future<void> _onVerifyAccountButtonClicked(
    _verifyAccountButtonClick event,
    Emitter<LoginState> emit,
  ) async {
    emit(_verifyingAccount());

    try {
      final verifyOtp = await loginService.verifyOtp(
        email: event.email,
        otp: event.otp,
        isSaveConfigrequired: true,
      );

      if (verifyOtp.$1 == true) {
        emit(_Success(verifyOtp.$2!));
      } else {
        emit(_Failure(AppStrings.someIssueHappenedBloc));
      }
    } catch (e) {
      log(e.toString());
      emit(_Failure(e.toString()));
    }
  }

  Future<void> _onLoginButtonClickEvent(
    _LoginButtonClickEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(const _Loading());
    try {
      String? fctoken = FirebaseNotificationService.instance.ftoken;

      // Call your AuthRepository to login
      final tokens = await loginService.login(
        event.email,
        event.password,
        fctoken,
      );

      if (tokens.$2.data?.user?.isVerified == true) {
        emit(_Success(tokens.$1));
      } else {
        emit(_notverified(user: tokens.$2));
      }
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
      String? fctoken = FirebaseNotificationService.instance.ftoken;
      final status = await loginService.logout(fctoken);

      if (status == true) {
        emit(const _Initial());
      } else {
        emit(_Failure('Logout Failed'));
      }
    } catch (e) {
      emit(_Failure(e.toString()));
    }
  }
}
