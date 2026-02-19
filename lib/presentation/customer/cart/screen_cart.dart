import 'package:flutter/material.dart';

import '../../../domain/core/constants/strings.dart';
import '../../../domain/core/util/payment_stripe/stripe_service.dart';

class ScreenCart extends StatelessWidget {
  const ScreenCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              AppStrings.cart,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 600),

                    child: _CartItemTile(index: index),
                  ),
                );
              }, childCount: 3),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 600),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _SummaryRow(label: "Subtotal", value: "17,997 Rs"),
                        const SizedBox(height: 12),
                        _SummaryRow(label: "Shipping", value: "200 Rs"),
                        const SizedBox(height: 12),
                        const Divider(),
                        const SizedBox(height: 12),
                        _SummaryRow(
                          label: "Total Account",
                          value: "18,197 Rs",
                          isTotal: true,
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: LinearGradient(
                                colors: [
                                  Theme.of(context).colorScheme.primary,
                                  Theme.of(
                                    context,
                                  ).colorScheme.primary.withOpacity(0.8),
                                ],
                              ),
                            ),
                            child: ElevatedButton(
                              onPressed: () async {
                                // PaymentService.startPayment(
                                //   context: context,
                                //   amount: 499.0,
                                //   description: "Order #1234",
                                //   mobile: "9876543210",
                                //   onSuccess: (success) {
                                //     debugPrint(
                                //       "Payment success: ${success.paymentId}",
                                //     );
                                //   },
                                //   onError: (error) {
                                //     debugPrint(
                                //       "Payment failed: ${error.message}",
                                //     );
                                //   },
                                //   onExternalWallet: (wallet) {
                                //     debugPrint(
                                //       "External wallet: ${wallet.walletName}",
                                //     );
                                //   },
                                // );

                                await StripeService.instance.startPayment(
                                  context: context,
                                  onSuccess: () => print("Success!"),
                                  onCancel: () => print("Cancelled"),
                                  onError: (err) => print("Error: $err"),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                "Checkout",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
    );
  }
}

class _CartItemTile extends StatelessWidget {
  final int index;
  const _CartItemTile({required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.image, color: Colors.grey, size: 30),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Product Item ${index + 1}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(
                  "Official Store",
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "5,999 Rs",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          _QtyButton(icon: Icons.remove, onTap: () {}),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              "1",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          _QtyButton(icon: Icons.add, onTap: () {}),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _QtyButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Icon(icon, size: 18, color: Colors.black87),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isTotal;
  const _SummaryRow({
    required this.label,
    required this.value,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: isTotal ? Colors.black : Colors.grey.shade600,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            fontSize: isTotal ? 18 : 14,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: isTotal
                ? Theme.of(context).colorScheme.primary
                : Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: isTotal ? 20 : 16,
          ),
        ),
      ],
    );
  }
}
