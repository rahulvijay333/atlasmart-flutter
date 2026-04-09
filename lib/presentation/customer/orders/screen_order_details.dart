import 'package:atlasmart/application/customer/order_details/order_details_bloc.dart';
import 'package:atlasmart/domain/core/constants/colors.dart';
import 'package:atlasmart/domain/customer/orders/model/order_detail_model.dart';
import 'package:atlasmart/domain/endpoints/api_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/core/di/di.dart';
import '../../../domain/core/util/data_format.dart';
import '../../../domain/core/util/invoice_download/invoice_service.dart';

class ScreenOrderDetails extends StatefulWidget {
  final String orderId;
  const ScreenOrderDetails({super.key, required this.orderId});

  @override
  State<ScreenOrderDetails> createState() => _ScreenOrderDetailsState();
}

class _ScreenOrderDetailsState extends State<ScreenOrderDetails> {
  @override
  void initState() {
    super.initState();
    context.read<OrderDetailsBloc>().add(
      OrderDetailsEvent.getOrderDetails(widget.orderId),
    );
  }

  bool isDownloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Order Details'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600),
          child: BlocBuilder<OrderDetailsBloc, OrderDetailsState>(
            builder: (context, state) {
              return state.when(
                initial: () => const Center(child: CircularProgressIndicator()),
                loading: () => const Center(child: CircularProgressIndicator()),
                failure: (error) => _buildErrorState(context, error),
                success: (order) => _buildOrderContent(context, order),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildOrderContent(BuildContext context, OrderDetailModel order) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildInfoCard(context, order),
        const SizedBox(height: 16),
        _buildItemsSection(context, order),
        const SizedBox(height: 16),
        _buildShippingSection(context, order),
        const SizedBox(height: 16),
        _buildSummarySection(context, order),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildInfoCard(BuildContext context, OrderDetailModel order) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(5),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildDetailRow(
            'Order Number',
            '#${order.orderNumber}',
            isBold: true,
          ),
          const Divider(height: 24),
          _buildDetailRow(
            'Placed On',
            CustomDateFormat.ddmmmyyyWithTime(order.purchaseDate),
          ),
          const SizedBox(height: 8),
          _buildDetailRow(
            'Status',
            order.statusHistory.last.status.toUpperCase(),
            valueColor: Colors.orange.shade700,
          ),
          const SizedBox(height: 8),
          _buildInvoiceDownload(
            'Invoice',
            'Download',
            loading: isDownloading,
            valueColor: AppColors.whiteColor,
            ontap: () async {
              if (isDownloading == false) {
                setState(() {
                  isDownloading = true;
                });
                final invoiceService = sl<InvoiceService>();

                try {
                  await invoiceService.downloadInvoice(
                    url:
                        "${ApiEndpoints.invoiceDownload}${widget.orderId}/invoice",
                    fileName: "invoice_${order.orderNumber}",
                  );
                } catch (e) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(e.toString())));
                } finally {
                  setState(() {
                    isDownloading = false;
                  });
                }
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildItemsSection(BuildContext context, OrderDetailModel order) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 4, bottom: 12),
          child: Text(
            'Items Purchased',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        ...order.orderedProducts.map((product) => _buildProductTile(product)),
      ],
    );
  }

  Widget _buildProductTile(OrderProduct product) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 60,
              height: 60,
              color: Colors.grey.shade50,
              child: product.productImage.isNotEmpty
                  ? Image.network(
                      product.productImage,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.image, color: Colors.grey),
                    )
                  : const Icon(Icons.image, color: Colors.grey),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.productName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  product.brandname,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                ),
                if (product.qty != null)
                  Text(
                    'Qty: ${product.qty}',
                    style: const TextStyle(fontSize: 12),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShippingSection(BuildContext context, OrderDetailModel order) {
    final address = order.deliveryAddress;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 4, bottom: 12),
          child: Text(
            'Shipping Address',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(5),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                '${address.address1}, ${address.street}',
                style: TextStyle(color: Colors.grey.shade600),
              ),
              Text(
                '${address.city}, ${address.state}, ${address.country} - ${address.pincode}',
                style: TextStyle(color: Colors.grey.shade600),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSummarySection(BuildContext context, OrderDetailModel order) {
    final summary = order.priceSummary;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 4, bottom: 12),
          child: const Text(
            'Price Details',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(5),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              _buildDetailRow('Subtotal', '${summary.subtotal} Rs'),
              const SizedBox(height: 8),
              _buildDetailRow('Shipping', '${summary.shippingAmount} Rs'),
              const SizedBox(height: 8),
              _buildDetailRow('Tax', '${summary.taxAmount} Rs'),
              const Divider(height: 24),
              _buildDetailRow('Order Total', '${summary.grandTotal} Rs'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(
    String label,
    String value, {
    bool isBold = false,
    Color? valueColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(color: Colors.grey.shade700)),
        Text(
          value,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: valueColor,
          ),
        ),
      ],
    );
  }

  Widget _buildInvoiceDownload(
    String label,
    String value, {
    bool isBold = false,
    Color? valueColor,
    Function()? ontap,
    bool loading = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(color: Colors.grey.shade700)),
        GestureDetector(
          onTap: ontap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: loading ? null : AppColors.amberColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8,
                top: 5,
                bottom: 5,
              ),
              child: loading == true
                  ? SizedBox(
                      width: 25,
                      height: 25,

                      child: Center(child: CircularProgressIndicator()),
                    )
                  : Text(
                      value,
                      style: TextStyle(
                        fontWeight: isBold
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: valueColor,
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildErrorState(BuildContext context, String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 60, color: Colors.red),
          const SizedBox(height: 16),
          Text(error),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              context.read<OrderDetailsBloc>().add(
                OrderDetailsEvent.getOrderDetails(widget.orderId),
              );
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
