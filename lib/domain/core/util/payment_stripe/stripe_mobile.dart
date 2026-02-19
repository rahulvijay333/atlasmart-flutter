// stripe_mobile.dart
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../key/stripe_key.dart';

class StripeHelper {
  static Future<void> confirmPayment({
    required String clientSecret,
    required BuildContext context,
  }) async {
    // Stripe.publishableKey = strPubKey;
    // // ✅ Only apply native settings on mobile

    // await Stripe.instance.applySettings();

    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: "AtlasMart",
      ),
    );

    await Stripe.instance.presentPaymentSheet();
  }
}
