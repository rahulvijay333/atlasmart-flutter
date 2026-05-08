import 'package:atlasmart/domain/core/util/data_format.dart';
import 'package:atlasmart/presentation/common/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../application/admin/admin_payments_list/admin_payment_list_bloc.dart';
import '../../common/error_state_widget.dart';
import '../../../domain/core/constants/strings.dart';

class ScreenAdminPayments extends StatelessWidget {
  const ScreenAdminPayments({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminPaymentListBloc, AdminPaymentListState>(
      builder: (context, state) {
        if (state.isloading == true) {
          return LoadingWidget();
        }

        if (state.error != null && state.error!.isNotEmpty) {
          return ErrorStateWidgetWithMessage(
            state.error!,
            hasRefresh: true,
            ontap: () {
              context.read<AdminPaymentListBloc>().add(LoadAllPayments());
            },
          );
        }

        if (state.payments.isEmpty) {
          return ErrorStateWidgetWithMessage(
            'No Payments',
            hasRefresh: true,
            ontap: () {
              context.read<AdminPaymentListBloc>().add(LoadAllPayments());
            },
          );
        }

        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 600),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    itemCount: state.payments.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final payment = state.payments[index];

                     
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withValues(alpha: 0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.purple.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  Icons.credit_card,
                                  color: Colors.purple[700],
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      payment.orderNumber,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    Text(
                                      '${AppStrings.paymentIdPrefix} ${payment.paymentid}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '${payment.customerName} • ${CustomDateFormat.ddmmmyyyWithTime(payment.date)}',
                                      maxLines: 3,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '₹${payment.totalAmount}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.amberAccent,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      payment.status.toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
