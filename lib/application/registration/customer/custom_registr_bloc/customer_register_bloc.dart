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

  CustomerRegisterBloc(this.customerRegService) : super(_Initial()) {
    on<_CreateAccount>((event, emit) async {
      emit(_loading());

      try {
        final res = await customerRegService.customerRegistration(
          event.customer,
        );

        if (res == true) {
          emit(_success());
        } else {
          emit(_failure(message: ''));
        }
      } catch (e) {
        emit(_failure(message: e.toString()));
      }
    });
  }
}
