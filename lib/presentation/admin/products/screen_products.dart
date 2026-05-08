import 'package:atlasmart/application/admin/admin_product_list/admin_product_list_bloc.dart';
import 'package:atlasmart/presentation/common/loading_widget.dart';
import 'package:atlasmart/presentation/common/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/core/constants/font.dart';
import '../../common/error_state_widget.dart';
import '../../../domain/core/constants/strings.dart';
import 'screen_add_product.dart';

class ScreenAdminProducts extends StatelessWidget {
  const ScreenAdminProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminProductListBloc, AdminProductListState>(
      builder: (context, state) {
        return Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 600),
            child: Column(
              children: [
              
            
                ?state.whenOrNull(
                  loading: () {
                    return LoadingWidget();
                  },
                  failure: (message) {
                    return ErrorStateWidgetWithMessage(
                      message,
                      hasRefresh: true,
                      ontap: () {
                        context.read<AdminProductListBloc>().add(
                          AdminProductListEvent.loadAdminProductList(),
                        );
                      },
                    );
                  },
                  success: (products) {
                    if (products.isEmpty) {
                      return ErrorStateWidgetWithMessage(
                        'No products',
                        hasRefresh: true,
                        ontap: () {
                          context.read<AdminProductListBloc>().add(
                            AdminProductListEvent.loadAdminProductList(),
                          );
                        },
                      );
                    }
            
                    return Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          context.read<AdminProductListBloc>().add(
                            AdminProductListEvent.loadAdminProductList(),
                          );
                        },
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          itemCount: products.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 16),
                          itemBuilder: (context, index) {
                            final product = products[index];
            
                            // final sellingPrice = (index + 1) * 1200;
                            // final mrp = sellingPrice * 1.2;
                            final stock = product.stock?.isNotEmpty == true
                                ? int.parse(product.stock ?? '0')
                                : 0;
                            // final isActive = index % 3 != 0; // Mock active status
            
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Product Image
                                    Container(
                                      width: 90,
                                      height: 90,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(12),
                                        image: product.image?.isNotEmpty == true
                                            ? DecorationImage(
                                                image: NetworkImage(
                                                  product.image ?? '',
                                                ),
                                              )
                                            : null,
                                      ),
                                      child: product.image == null
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
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  product.name,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black87,
                                                  ),
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                              PopupMenuButton(
                                                icon: const Icon(
                                                  Icons.more_vert,
                                                  size: 20,
                                                  color: Colors.grey,
                                                ),
                                                onSelected: (value) {
                                                  if (value == 'edit') {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            ScreenAddProduct(
                                                              isEdit: true,
                                                              product: product,
                                                            ),
                                                      ),
                                                    ).then((value) {
                                                      if (context.mounted) {
                                                        context
                                                            .read<
                                                              AdminProductListBloc
                                                            >()
                                                            .add(
                                                              AdminProductListEvent.loadAdminProductList(),
                                                            );
                                                      }
                                                    });
                                                  }
            
                                                  if (value == 'delete') {
                                                    if (product.id != null) {
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            title: Center(
                                                              child: Text(
                                                                'Confirm',
                                                                style: AppFont
                                                                    .subHeading16BoldStyle,
                                                              ),
                                                            ),
                                                            content: Text(
                                                              'Are you sure to delete this product? ',
                                                            ),
            
                                                            actions: [
                                                              IconButton(
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                    context,
                                                                  ).pop();
                                                                },
                                                                icon: Text('No'),
                                                              ),
            
                                                              IconButton(
                                                                onPressed: () {
                                                                  context
                                                                      .read<
                                                                        AdminProductListBloc
                                                                      >()
                                                                      .add(
                                                                        AdminProductListEvent.deleteProduct(
                                                                          product
                                                                              .id!,
                                                                        ),
                                                                      );
                                                                  Navigator.of(
                                                                    context,
                                                                  ).pop();
                                                                },
                                                                icon: Text('Yes'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    } else {
                                                      AppSnackBar.show(
                                                        context,
                                                        'Product id missing',
                                                      );
                                                    }
                                                  }
                                                },
                                                itemBuilder: (context) => [
                                                  const PopupMenuItem(
                                                    value: 'edit',
                                                    child: Text(AppStrings.edit),
                                                  ),
                                                  const PopupMenuItem(
                                                    value: 'delete',
                                                    child: Text(
                                                      AppStrings.delete,
                                                      style: TextStyle(
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 4),
                                          Row(
                                            children: [
                                              // Container(
                                              //   padding: const EdgeInsets.symmetric(
                                              //     horizontal: 6,
                                              //     vertical: 2,
                                              //   ),
                                              //   decoration: BoxDecoration(
                                              //     color: isActive
                                              //         ? Colors.green.withValues(
                                              //             alpha: 0.1,
                                              //           )
                                              //         : Colors.red.withValues(
                                              //             alpha: 0.1,
                                              //           ),
                                              //     borderRadius:
                                              //         BorderRadius.circular(4),
                                              //   ),
                                              //   child: Text(
                                              //     isActive
                                              //         ? AppStrings.active
                                              //         : AppStrings.inactive,
                                              //     style: TextStyle(
                                              //       color: isActive
                                              //           ? Colors.green
                                              //           : Colors.red,
                                              //       fontSize: 10,
                                              //       fontWeight: FontWeight.bold,
                                              //     ),
                                              //   ),
                                              // ),
                                              // const SizedBox(width: 8),
                                              // Text(
                                              //   '${product.categoryName}: Electronics',
                                              //   style: TextStyle(
                                              //     fontSize: 12,
                                              //     color: Colors.grey[600],
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                          if (product.brandName?.isNotEmpty ==
                                              true) ...[
                                            Row(
                                              spacing: 5,
                                              children: [
                                                Text(
                                                  'Soldby',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey[600],
                                                  ),
                                                ),
                                                Text(
                                                  '${product.brandName}',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ] else ...[
                                            Row(
                                              spacing: 5,
                                              children: [
                                                Text(
                                                  'Soldby',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey[600],
                                                  ),
                                                ),
                                                Text(
                                                  'NA',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
            
                                          const SizedBox(height: 8),
                                          // Pricing
                                          Row(
                                            children: [
                                              Text(
                                                '₹${product.price}',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black87,
                                                ),
                                              ),
                                              // const SizedBox(width: 8),
                                              // Text(
                                              //   '₹${mrp.toStringAsFixed(0)}',
                                              //   style: TextStyle(
                                              //     fontSize: 12,
                                              //     decoration:
                                              //         TextDecoration.lineThrough,
                                              //     color: Colors.grey[500],
                                              //   ),
                                              // ),
                                              //   const SizedBox(width: 8),
                                              //   Container(
                                              //     padding: const EdgeInsets.symmetric(
                                              //       horizontal: 6,
                                              //       vertical: 2,
                                              //     ),
                                              //     decoration: BoxDecoration(
                                              //       color: Colors.green.shade50,
                                              //       borderRadius:
                                              //           BorderRadius.circular(4),
                                              //     ),
                                              //     child: const Text(
                                              //       '20% ${AppStrings.off}',
                                              //       style: TextStyle(
                                              //         color: Colors.green,
                                              //         fontSize: 10,
                                              //         fontWeight: FontWeight.bold,
                                              //       ),
                                              //     ),
                                              //   ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          // Stock Status
                                          Row(
                                            children: [
                                              Icon(
                                                stock > 0
                                                    ? Icons.check_circle_outline
                                                    : Icons.error_outline,
                                                size: 14,
                                                color: stock > 0
                                                    ? Colors.green
                                                    : Colors.red,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                stock > 0
                                                    ? '$stock ${AppStrings.inStock}'
                                                    : AppStrings.outOfStock,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: stock > 0
                                                      ? Colors.green
                                                      : Colors.red,
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
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
