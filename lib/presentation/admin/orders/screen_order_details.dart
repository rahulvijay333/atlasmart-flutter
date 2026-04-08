import 'package:atlasmart/application/admin/admin_order_list/admin_order_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/admin/manage_orders/model/manage_order_model.dart';
import '../../../domain/core/constants/colors.dart';
import '../../../domain/core/constants/strings.dart';

class ScreenAdminOrderDetails extends StatelessWidget {
  final ManageAdminOrderModel order;

  const ScreenAdminOrderDetails({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AdminOrderListBloc, AdminOrderListState>(
      listenWhen: (previous, current) =>
          previous.isUpdating != current.isUpdating ||
          previous.updateSuccess != current.updateSuccess ||
          previous.updateError != current.updateError,
      listener: (context, state) {
        if (state.updateSuccess == true) {
          Navigator.of(context, rootNavigator: true).pop(); // Close dialog
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(
          //     content: Text('Order status updated successfully'),
          //     backgroundColor: Colors.green,
          //   ),
          // );
        } else if (state.updateError != null) {
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(
          //     content: Text(state.updateError!),
          //     backgroundColor: Colors.red,
          //   ),
          // );
        }
      },
      child: BlocBuilder<AdminOrderListBloc, AdminOrderListState>(
        builder: (context, state) {
          // Find the latest version of this order from the Bloc state
          final currentOrder = state.orderList.firstWhere(
            (o) => o.orderId == order.orderId,
            orElse: () => order,
          );

          // Determine status details based on the latest data
          final currentStatus = currentOrder.statusHistory.isNotEmpty
              ? currentOrder.statusHistory.last.status.toLowerCase()
              : 'pending';
          final isDelivered = currentStatus == 'delivered';
          final isPending = currentStatus == 'pending';

          return Scaffold(
            backgroundColor: Colors.grey[50],
            appBar: AppBar(
              title: Text('Order ${currentOrder.orderNumber}'),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Status & Date Summary Card
                  _buildSummaryCard(currentStatus, isDelivered, isPending, currentOrder.date),
                  const SizedBox(height: 20),

                  // Customer Details Section
                  _buildSectionTitle('Customer Information'),
                  _buildCustomerCard(currentOrder),
                  const SizedBox(height: 20),

                  // Order Items Section
                  _buildSectionTitle('Order Items'),
                  _buildItemsList(currentOrder),
                  const SizedBox(height: 20),

                  // Shipping Address Section
                  _buildSectionTitle('Delivery Address'),
                  _buildAddressCard(currentOrder),
                  const SizedBox(height: 20),

                  // Payment Summary Section
                  _buildSectionTitle('Payment Summary'),
                  _buildPaymentSummaryCard(currentOrder),
                  const SizedBox(height: 40),
                ],
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () => _showUpdateStatusDialog(context, currentOrder),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.amberColor,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 54),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                child: const Text(
                  AppStrings.updateStatus,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showUpdateStatusDialog(BuildContext context, ManageAdminOrderModel currentOrder) {
    String selectedStatus = AppStrings.statusProcessing;
    final TextEditingController noteController = TextEditingController();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setState) {
            return BlocBuilder<AdminOrderListBloc, AdminOrderListState>(
              builder: (context, state) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  title: const Text(AppStrings.updateStatus),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (state.updateError != null) ...[
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.red.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.error_outline, color: Colors.red, size: 20),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  state.updateError!,
                                  style: const TextStyle(color: Colors.red, fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                      DropdownButtonFormField<String>(
                        value: selectedStatus,
                        items: [
                          AppStrings.statusProcessing,
                          AppStrings.statusShipped,
                          AppStrings.statusDelivered,
                          AppStrings.statusCanceled,
                        ].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
                        onChanged: state.isUpdating
                            ? null
                            : (val) {
                                if (val != null) {
                                  setState(() => selectedStatus = val);
                                }
                              },
                        decoration: InputDecoration(
                          labelText: AppStrings.orderStatus,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: noteController,
                        enabled: !state.isUpdating,
                        maxLines: 3,
                        decoration: InputDecoration(
                          labelText: AppStrings.note,
                          hintText: AppStrings.addNoteHint,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          alignLabelWithHint: true,
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: state.isUpdating ? null : () => Navigator.pop(dialogContext),
                      child: const Text(AppStrings.cancel),
                    ),
                    ElevatedButton(
                      onPressed: state.isUpdating
                          ? null
                          : () {
                              context.read<AdminOrderListBloc>().add(
                                    UpdateOrderStatus(
                                      orderId: currentOrder.orderId,
                                      status: selectedStatus.toLowerCase(),
                                      note: noteController.text,
                                    ),
                                  );
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.amberColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: state.isUpdating
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Text(AppStrings.update),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.grey[600],
          letterSpacing: 1.1,
        ),
      ),
    );
  }

  Widget _buildSummaryCard(String status, bool isDelivered, bool isPending, String date) {
    Color statusColor = isDelivered
        ? Colors.green
        : isPending
            ? Colors.orange
            : Colors.blue;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: statusColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isDelivered
                  ? Icons.check_circle_rounded
                  : isPending
                      ? Icons.access_time_filled_rounded
                      : Icons.sync_rounded,
              color: statusColor,
              size: 30,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  status.toUpperCase(),
                  style: TextStyle(
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Placed on $date',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerCard(ManageAdminOrderModel currentOrder) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.amberColor.withValues(alpha: 0.1),
            child: Text(
              currentOrder.customerName.isNotEmpty ? currentOrder.customerName[0] : '?',
              style: TextStyle(color: AppColors.amberColor, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentOrder.customerName,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(
                  currentOrder.customerEmail,
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemsList(ManageAdminOrderModel currentOrder) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: currentOrder.orderedItems.length,
        separatorBuilder: (context, index) => Divider(height: 1, color: Colors.grey.shade100, indent: 70),
        itemBuilder: (context, index) {
          final item = currentOrder.orderedItems[index];
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    item.productImage,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 50,
                      height: 50,
                      color: Colors.grey[200],
                      child: const Icon(Icons.image_not_supported, size: 20, color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.productName,
                        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        item.brandname,
                        style: TextStyle(color: Colors.grey[500], fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    'x${item.qty ?? 1}',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildAddressCard(ManageAdminOrderModel currentOrder) {
    final addr = currentOrder.customerAddress;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.location_on_outlined, size: 18, color: AppColors.amberColor),
              const SizedBox(width: 8),
              const Text('Shipping Address', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 12),
          Text(addr.address1, style: const TextStyle(fontSize: 14)),
          if (addr.street.isNotEmpty) Text(addr.street, style: const TextStyle(fontSize: 14)),
          Text(
            '${addr.city}, ${addr.state} - ${addr.pincode}',
            style: const TextStyle(fontSize: 14),
          ),
          Text(addr.country, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildPaymentSummaryCard(ManageAdminOrderModel currentOrder) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.amberColor.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.amberColor.withValues(alpha: 0.1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Order Total',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            '₹${currentOrder.totalAmount}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: AppColors.amberColor,
            ),
          ),
        ],
      ),
    );
  }
}
