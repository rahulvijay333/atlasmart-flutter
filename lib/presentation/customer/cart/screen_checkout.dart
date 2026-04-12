import 'package:atlasmart/application/customer/checkout/checkout_bloc.dart';
import 'package:atlasmart/application/customer/payment_status/payment_status_bloc.dart';
import 'package:atlasmart/presentation/common/snack_bar.dart';
import 'package:atlasmart/presentation/customer/cart/screen_payment_process.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/core/util/razorpay/razorpay_util.dart';

class ScreenCheckout extends StatelessWidget {
  const ScreenCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutBloc, CheckoutState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey.shade50,
          appBar: AppBar(
            title: const Text('Checkout'),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            surfaceTintColor: Colors.transparent,
          ),
          body: state.isloading
              ? const Center(child: CircularProgressIndicator())
              : state.error != null
              ? _buildErrorState(context, state.error!)
              : state.checkoutData == null
              ? _buildEmptyState(context)
              : ListView(
                  padding: const EdgeInsets.all(16),
                  children: [_buildOrderSummary(context, state)],
                ),
          bottomNavigationBar: state.checkoutData != null
              ? _buildBottomBar(context, state)
              : null,
        );
      },
    );
  }

  Widget _buildErrorState(BuildContext context, String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 60, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Oops! Something went wrong.',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              error,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_bag_outlined,
            size: 80,
            color: Colors.grey.shade300,
          ),
          const SizedBox(height: 16),
          const Text(
            'No order details found',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Return to Cart'),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderSummary(BuildContext context, CheckoutState state) {
    final summary = state.checkoutData!.summary;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(5),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Order Summary',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(height: 32),
          _SummaryRow(label: 'Items Total', value: '${summary.subtotal} Rs'),
          const SizedBox(height: 12),
          _SummaryRow(
            label: 'Shipping Fee',
            value: '${summary.shippingAmount} Rs',
          ),
          const SizedBox(height: 12),
          _SummaryRow(label: 'Tax (GST)', value: '${summary.taxAmount} Rs'),
          const Divider(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Grand Total',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                '${summary.grandTotal} Rs',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context, CheckoutState state) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              final data = state.checkoutData;

              final razorpay = RazorpayUtil(
                onSuccess: (paymentId, orderId, signature) {
                  if (context.mounted) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ScreenPaymentProcess(
                            orderId: orderId,
                            paymentId: paymentId,
                            signature: signature,
                          );
                        },
                      ),
                    );
                  }
                },
                onError: (error) {
                  AppSnackBar.show(context, error);
                },
                onCancel: () {
                  AppSnackBar.show(
                    context,
                    'Payment Cancelled',
                    duration: Duration(seconds: 5),
                  );
                },
              );

              razorpay.open(
                key: data?.razorpayKey ?? '',
                amount: (double.parse(data?.summary.grandTotal ?? '0.0') * 100)
                    .round(), // in paise
                name: "AtlasMart",
                description: '',
                orderId: data?.razorpayOrderId ?? '',
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Pay Now',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  const _SummaryRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(color: Colors.grey.shade600)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }
}
