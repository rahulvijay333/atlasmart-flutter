// stripe_web.dart
import 'package:flutter/material.dart';
import 'package:flutter_stripe_web/flutter_stripe_web.dart';

class StripeHelper {
  static Future<void> confirmPayment({
    required String clientSecret,
    required BuildContext context,
  }) async {
    // Show PaymentElement inside a dialog
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: SizedBox(
          width: 400,
          child: PaymentElement(
            clientSecret: clientSecret,
            onCardChanged: (card) {},
          ),
        ),

        actions: [
          Center(
            child: ElevatedButton(
              onPressed: () async {
                try {
                  await WebStripe.instance.confirmPaymentElement(
                    ConfirmPaymentElementOptions(
                      confirmParams: ConfirmPaymentParams(
                        return_url: "", // required by Stripe API
                      ),
                      redirect: PaymentConfirmationRedirect.ifRequired,
                    ),
                  );
            
                  Navigator.pop(context);
                } catch (e) {
                  debugPrint("Stripe error: $e");
                }
              },
              child: const Text("Pay"),
            ),
          ),
        ],
      ),
    );

    // // Confirm payment element (Stripe.js)
    // await WebStripe.instance.confirmPaymentElement(
    //   confirmParams: ConfirmPaymentParams(
    //     return_url: "https://your-success-url.com",
    //   ),
    // );
  }
}
