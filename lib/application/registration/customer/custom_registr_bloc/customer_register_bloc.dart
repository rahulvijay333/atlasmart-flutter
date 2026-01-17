import 'package:atlasmart/domain/core/constants/strings.dart';
import 'package:atlasmart/domain/login/login_service.dart';
import 'package:atlasmart/domain/registration/model/customer_register_model.dart';
import 'package:atlasmart/domain/registration/registration_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_register_event.dart';
part 'customer_register_state.dart';

part 'customer_register_bloc.freezed.dart';

class CustomerRegisterBloc
    extends Bloc<CustomerRegisterEvent, CustomerRegisterState> {
  final RegistrationService customerRegService;
  final LoginService loginService;

  CustomerRegisterBloc(this.customerRegService, this.loginService)
    : super(_Initial()) {
    on<_CreateAccount>((event, emit) async {
      emit(_loading());

      try {
        final res = await customerRegService.customerRegistration(
          event.customer,
        );

        if (res.$1 == true) {
          // emit(_verifyOtp(customer: res.$2));
          emit(_sendOtp(customer: res.$2));
        } else {
          emit(_failure(message: ''));
        }
      } catch (e) {
        emit(_failure(message: e.toString()));
      }
    });

    on<_VerifyOtpButtonClick>((event, emit) async {
      emit(CustomerRegisterState.verifyOtpLoading());

      try {
        final res = await customerRegService.customerOtpVerify(event.customer);

        if (res == true) {
          emit(_success());
        } else {
          emit(_failure(message: ''));
        }
      } catch (e) {
        emit(_failure(message: e.toString()));
      }
    });

    on<_SendOtp>((event, emit) async {
      if (event.resendOtp == false) {
        emit(_sendOtpLoading());
      }

      try {
        final sendOtpStatus = await loginService.sendEmailOtp(
          email: event.customer.email,
        );

        if (sendOtpStatus == true) {
          emit(_verifyOtp(customer: event.customer));
        } else {
          emit(
            _sendOtpFailed(
              message: AppStrings.someIssueHappenedBloc,
              customer: event.customer,
            ),
          );
        }
      } catch (e) {
        emit(_sendOtpFailed(message: e.toString(), customer: event.customer));
      }
    });
  }
}
