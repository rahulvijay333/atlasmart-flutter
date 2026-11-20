import 'package:atlasmart/application/admin/inventory/inventory_bloc.dart';
import 'package:atlasmart/presentation/common/error_state_widget.dart';
import 'package:atlasmart/presentation/common/loading_widget.dart';
import 'package:atlasmart/presentation/common/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/stock_update_sheet.dart';
import '../../../domain/core/constants/strings.dart';

class ScreenInventory extends StatelessWidget {
  const ScreenInventory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<InventoryBloc, InventoryState>(
      listenWhen: (previous, current) =>
          previous.isUpdating != current.isUpdating ||
          previous.updateSuccess != current.updateSuccess ||
          previous.updateErrorMessage != current.updateErrorMessage,
      listener: (context, state) {
        if (state.updateSuccess) {
          AppSnackBar.show(context, 'Stock updated successfully');
        } else if (state.updateErrorMessage != null) {
          AppSnackBar.show(
            context,
            state.updateErrorMessage ?? 'Stock updated failed',
          );
        }
      },
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<InventoryBloc, InventoryState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const LoadingWidget();
                    }

                    if (state.errorMessage != null && state.products.isEmpty) {
                      return ErrorStateWidgetWithMessage(
                        state.errorMessage!,
                        hasRefresh: true,
                        ontap: () {
                          context.read<InventoryBloc>().add(
                            const InventoryEvent.loadInventory(),
                          );
                        },
                      );
                    }

                    if (state.products.isEmpty) {
                      return ErrorStateWidgetWithMessage(
                        'No products found',
                        hasRefresh: true,
                        ontap: () {
                          context.read<InventoryBloc>().add(
                            const InventoryEvent.loadInventory(),
                          );
                        },
                      );
                    }

                    return RefreshIndicator(
                      onRefresh: () async {
                        context.read<InventoryBloc>().add(
                          const InventoryEvent.loadInventory(),
                        );
                      },
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        itemCount: state.products.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 16),
                        itemBuilder: (context, index) {
                          final product = state.products[index];
                          final stock = int.tryParse(product.stock ?? '0') ?? 0;
                          final isLowStock = stock < 10 && stock > 0;
                          final isOutOfStock = stock == 0;

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
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  // Product Image
                                  Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.circular(12),
                                      image:
                                          product.image != null &&
                                              product.image!.isNotEmpty
                                          ? DecorationImage(
                                              image: NetworkImage(
                                                product.image!,
                                              ),
                                              fit: BoxFit.cover,
                                            )
                                          : null,
                                    ),
                                    child:
                                        product.image == null ||
                                            product.image!.isEmpty
                                        ? const Icon(
                                            Icons.image_outlined,
                                            color: Colors.grey,
                                          )
                                        : null,
                                  ),
                                  const SizedBox(width: 16),
                                  // Details
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product.name,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          'Price: ₹${product.price}',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[500],
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        Row(
                                          children: [
                                            _buildStockBadge(
                                              stock,
                                              isLowStock,
                                              isOutOfStock,
                                            ),
                                            const Spacer(),
                                            InkWell(
                                              onTap: () {
                                                showModalBottomSheet(
                                                  context: context,
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  builder: (_) =>
                                                      StockUpdateSheet(
                                                        product: product,
                                                      ),
                                                );
                                              },
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 6,
                                                    ),
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .primaryColor
                                                      .withValues(alpha: 0.1),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Text(
                                                  AppStrings.update,
                                                  style: TextStyle(
                                                    color: Theme.of(
                                                      context,
                                                    ).primaryColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStockBadge(int stock, bool isLow, bool isOut) {
    Color color;
    String text;
    IconData icon;

    if (isOut) {
      color = Colors.red;
      text = AppStrings.outOfStock;
      icon = Icons.warning_amber_rounded;
    } else if (isLow) {
      color = Colors.orange;
      text = '$stock Units (${AppStrings.lowStock})';
      icon = Icons.priority_high_rounded;
    } else {
      color = Colors.green;
      text = '$stock ${AppStrings.inStock}';
      icon = Icons.check_circle_outline_rounded;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        // color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
