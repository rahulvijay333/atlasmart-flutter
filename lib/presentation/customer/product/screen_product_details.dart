import 'package:atlasmart/application/customer/cart/cart_bloc.dart';
import 'package:atlasmart/domain/core/constants/font.dart';
import 'package:atlasmart/domain/customer/home/model/shop_product_model.dart';
import 'package:atlasmart/presentation/common/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atlasmart/presentation/customer/cart/screen_cart.dart';

import '../../common/snack_bar.dart';

class ScreenProductDetails extends StatelessWidget {
  final ShopProductModel product;

  const ScreenProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          product.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppFont.appBar18Style,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          // IconButton(
          //   icon: const Icon(Icons.favorite_border, color: Colors.black),
          //   onPressed: () {},
          // ),
          // IconButton(
          //   icon: const Icon(Icons.share, color: Colors.black),
          //   onPressed: () {},
          // ),
        ],
      ),
      body: BlocListener<CartBloc, CartState>(
        listener: (context, state) async {
          if (state.error != null && state.error!.isNotEmpty) {
            AppSnackBar.show(context, state.error!);
            context.read<CartBloc>().add(ClearErrorMessage());
          }
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return _buildWebLayout(context);
            } else {
              return _buildMobileLayout(context);
            }
          },
        ),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProductImage(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildProductInfo(context),
                const SizedBox(height: 24),
                _buildCartActions(context),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWebLayout(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 4, child: _buildProductImage()),
              const SizedBox(width: 48),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProductInfo(context),
                    const SizedBox(height: 32),
                    _buildCartActions(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductImage() {
    return Container(
      height: 400,
      width: double.infinity,
      color: Colors.grey.shade50,
      child: product.image.isNotEmpty
          ? Image.network(
              product.image,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const Center(
                child: Icon(Icons.image, size: 100, color: Colors.grey),
              ),
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: CircularProgressIndicator());
              },
            )
          : const Center(
              child: Icon(Icons.image, size: 100, color: Colors.grey),
            ),
    );
  }

  Widget _buildProductInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              product.company,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 20),
                SizedBox(width: 4),
                Text("4.5", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          product.name,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          "${product.price} Rs",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),

        if (product.description.isNotEmpty) ...[
          Text(
            "Product Description",
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            product.description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey.shade700,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 32),
        ],

        Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.blueAccent,
              child: Icon(Icons.person, color: Colors.white),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.brandName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Official Seller",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
            const Spacer(),
            // TextButton(onPressed: () {}, child: const Text("View Store")),
          ],
        ),
      ],
    );
  }

  Widget _buildCartActions(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        final cartItem = state.cartList
            .where((item) => item.productId == product.id)
            .firstOrNull;

        // if (state.ismodifyingCart) {
        //   return Container(
        //     padding: const EdgeInsets.symmetric(vertical: 8),
        //     alignment: Alignment.center,
        //     child: const CircularProgressIndicator(),
        //   );
        // }

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              if (cartItem != null) ...[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 4,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (state.ismodifyingCart == false) {
                            if (cartItem.qty > 1) {
                              context.read<CartBloc>().add(
                                AddorUpdateCart(
                                  productID: product.id,
                                  cartID: cartItem.id,
                                  qty: (cartItem.qty - 1).toString(),
                                ),
                              );
                            } else {
                              context.read<CartBloc>().add(
                                DeleteCart(productID: cartItem.id),
                              );
                            }
                          }
                        },
                        icon: const Icon(Icons.remove, size: 20),
                        constraints: const BoxConstraints(),
                        padding: const EdgeInsets.all(8),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "${cartItem.qty}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (state.ismodifyingCart == false) {
                            if (cartItem.qty < cartItem.stock) {
                              context.read<CartBloc>().add(
                                AddorUpdateCart(
                                  productID: product.id,
                                  cartID: cartItem.id,
                                  qty: (cartItem.qty + 1).toString(),
                                ),
                              );
                            }
                          }
                        },
                        icon: const Icon(Icons.add, size: 20),
                        constraints: const BoxConstraints(),
                        padding: const EdgeInsets.all(8),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ButtonWidget(
                    isloading: state.ismodifyingCart,
                    title: "Go to Cart",
                    height: 50,
                    ontap: () {
                      if (state.ismodifyingCart == false) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>  ScreenCart(fromProductDetailScreen: true,),
                          ),
                        );
                      }
                    },
                  ),

                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.of(context).push(
                  //       MaterialPageRoute(
                  //         builder: (context) => const ScreenCart(),
                  //       ),
                  //     );
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     padding: const EdgeInsets.symmetric(vertical: 16),
                  //     backgroundColor: Theme.of(context).colorScheme.primary,
                  //     foregroundColor: Colors.white,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(12),
                  //     ),
                  //   ),
                  //   child: const Text("Go to Cart"),
                  // ),
                ),
              ] else ...[
                Expanded(
                  child: ButtonWidget(
                    isloading: state.ismodifyingCart,
                    title: 'Add to Cart',
                    height: 50,
                    ontap: () {
                      if (state.ismodifyingCart == false) {
                        context.read<CartBloc>().add(
                          AddorUpdateCart(productID: product.id, qty: "1"),
                        );
                      }
                    },
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
