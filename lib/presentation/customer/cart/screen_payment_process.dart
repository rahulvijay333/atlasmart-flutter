import 'package:atlasmart/application/customer/payment_status/payment_status_bloc.dart';
import 'package:atlasmart/presentation/customer/cart/screen_payment_failed.dart';
import 'package:atlasmart/presentation/customer/cart/screen_payment_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenPaymentProcess extends StatefulWidget {
  const ScreenPaymentProcess({
    super.key,
    required this.orderId,
    required this.paymentId,
    required this.signature,
  });

  final String orderId;
  final String paymentId;
  final String signature;

  @override
  State<ScreenPaymentProcess> createState() => _ScreenPaymentProcessState();
}

class _ScreenPaymentProcessState extends State<ScreenPaymentProcess> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<PaymentStatusBloc>(context).add(
      UpdatePaymentStatus(
        orderId: widget.orderId,
        paymentId: widget.paymentId,
        signature: widget.signature,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PaymentStatusBloc, PaymentStatusState>(
      listener: (context, state) {
        if (!state.isLoading) {
          if (state.status == true) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const ScreenPaymentSuccess(),
              ),
              (route) => false,
            );
          } else {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const ScreenPaymentFailed(),
              ),
            );
          }
        }
      },
      child: PopScope(
        canPop: false,
        child: Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 32),
                  const Text(
                    'Verifying Payment...',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Please do not close the app or press the back button while we finalize your order.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey.shade600, height: 1.5),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
