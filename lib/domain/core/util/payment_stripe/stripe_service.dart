import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

import 'stripe_mobile.dart' if (dart.library.html) 'stripe_web.dart';

class StripeService {
  StripeService._();
  static final StripeService instance = StripeService._();

  /// STEP 1: Get clientSecret
  /// For now: hardcoded (UI testing)
  /// Later: replace with API call
  Future<String> _getClientSecret() async {
    // TODO: Replace when backend ready
    return "pi_3T287jLTSZZlHkKL1pb9Qsiz_secret_PPR4dvyRu6ELWpDbmJf2Y2iC6";
  }

  Future<void> startPayment({
    required BuildContext context,
    required VoidCallback onSuccess,
    required VoidCallback onCancel,
    required Function(String) onError,
  }) async {
    final clientSecret = await _getClientSecret();
    try {
      if (kIsWeb) {
        await StripeHelper.confirmPayment(
          clientSecret: clientSecret,
          context: context,
        );
      } else {
        await StripeHelper.confirmPayment(
          clientSecret: clientSecret,
          context: context,
        );
      }
      onSuccess();
    } catch (e) {
      onError(e.toString());
    }
  }

  // /// LATER: when backend is ready
  // Future<String> getClientSecretFromApi(int amount) async {
  //   final response = await http.post(
  //     Uri.parse("https://api.yourbackend.com/create-payment"),
  //     headers: {"Content-Type": "application/json"},
  //     body: jsonEncode({"amount": amount}),
  //   );

  //   return jsonDecode(response.body)["clientSecret"];
  // }
}
