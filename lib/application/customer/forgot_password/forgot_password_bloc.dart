import 'package:atlasmart/domain/core/constants/strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/login/login_service.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';
part 'forgot_password_bloc.freezed.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final LoginService _loginService;

  ForgotPasswordBloc(this._loginService) : super(_Initial()) {
    on<_reset>((event, emit) {
      emit(_Initial());
    });

    on<_sentEmailOtp>((event, emit) async {
      emit(_sentEmailOtpLoading());

      try {
        final status = await _loginService.sendEmailOtpForPasswordReset(
          email: event.email,
        );

        if (status == true) {
          emit(_verifyOtp());
        } else {
          emit(__sentEmailOtpFailed(''));
        }
      } catch (e) {
        emit(__sentEmailOtpFailed(e.toString()));
      }
    });
    on<_verifyOtpButtonClick>((event, emit) async {
      emit(_verifyOtpLoading());
      try {
        final status = await _loginService.verifyOtpForPasswordReset(
          otp: event.otp,
          email: event.email,
        );
        if (status.$1 == true) {
          emit(_setPassword());
        } else {
          emit(_verifyOtpFailed(AppStrings.someIssueHappenedBloc));
        }
      } catch (e) {
        emit(_verifyOtpFailed(e.toString()));
      }
    });

    on<_setPasswordButtonClick>((event, emit) async {
      emit(_setPasswordLoading());
      try {
        final status = await _loginService.setPassword(
          email: event.email,
          otp: event.otp,
          password: event.password,
        );

        if (status == true) {
          emit(_success());
        } else {
          emit(_setPasswordfailed(message: ''));
        }
      } catch (e) {
        emit(_setPasswordfailed(message: e.toString()));
      }
    });
  }
}
