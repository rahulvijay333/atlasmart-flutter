import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/admin/manage_payments/manage_payments_service.dart';
import '../../../domain/admin/manage_payments/model/manage_payments_model.dart';

part 'admin_payment_list_event.dart';
part 'admin_payment_list_state.dart';

class AdminPaymentListBloc
    extends Bloc<AdminPaymentListEvent, AdminPaymentListState> {
  final ManagePaymentsService managePaymentsService;

  AdminPaymentListBloc({required this.managePaymentsService})
    : super(AdminPaymentListState.initial()) {
    on<LoadAllPayments>((event, emit) async {
      emit(state.copyWith(isloading: true, error: null));

      try {
        final payments = await managePaymentsService.getAllPayments();

        emit(state.copyWith(isloading: false, payments: payments));
      } catch (e) {
        emit(state.copyWith(isloading: false, error: e.toString()));
      }
    });
  }
}
