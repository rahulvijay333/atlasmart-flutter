import 'dart:io';

import 'package:atlasmart/domain/admin/manage_products/model/admin_products_model.dart';
import 'package:atlasmart/presentation/common/button_widget.dart';
import 'package:atlasmart/presentation/common/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/admin/admin_add_or_update_product/admin_addor_update_product_bloc.dart';
import '../../../domain/core/constants/colors.dart';
import '../../../domain/core/constants/font.dart';
import '../../../domain/core/util/image_picker.dart';

class ScreenAddProduct extends StatefulWidget {
  final bool isEdit;
  final AdminProductsModel? product;

  const ScreenAddProduct({super.key, required this.isEdit, this.product});

  @override
  State<ScreenAddProduct> createState() => _ScreenAddProductState();
}

class _ScreenAddProductState extends State<ScreenAddProduct> {
  // bool _isActive = true;
  late TextEditingController _nameController;

  late TextEditingController _descController;
  late TextEditingController _mrpController;
  // late TextEditingController _priceController;
  // late TextEditingController _gstController;
  late TextEditingController _stockController;
  // late TextEditingController _skuController;
  String _category = 'Electronics';
  File? selectedImage;
  @override
  void initState() {
    super.initState();
    // _isActive = widget.productData?['isActive'] ?? true;
    _nameController = TextEditingController(text: widget.product?.name ?? '');

    _descController = TextEditingController(
      text: widget.product?.description ?? '',
    );
    _mrpController = TextEditingController(text: widget.product?.price ?? '');
    // _priceController = TextEditingController(
    //   text: widget.productData?['price']?.toString() ?? '',
    // );
    // _gstController = TextEditingController(
    //   text: widget.productData?['gst']?.toString() ?? '',
    // );
    _stockController = TextEditingController(text: widget.product?.stock ?? '');
    // _skuController = TextEditingController(
    //   text: widget.productData?['sku'] ?? '',
    // );
    // _category = widget.productData?['category'] ?? 'Electronics';
  }

  @override
  void dispose() {
    _nameController.dispose();

    _descController.dispose();
    _mrpController.dispose();

    _stockController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEdit ? 'Edit Product' : 'Add New Product'),
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Status Toggle (Only visible if needed, or always prominent)
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            //   decoration: BoxDecoration(
            //     color: _isActive
            //         ? Colors.green.withValues(alpha: 0.1)
            //         : Colors.red.withValues(alpha: 0.1),
            //     borderRadius: BorderRadius.circular(12),
            //     border: Border.all(
            //       color: _isActive
            //           ? Colors.green.withValues(alpha: 0.3)
            //           : Colors.red.withValues(alpha: 0.3),
            //     ),
            //   ),
            //   child: SwitchListTile(
            //     contentPadding: EdgeInsets.zero,
            //     title: Text(
            //       _isActive ? 'Product Active' : 'Product Inactive',
            //       style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         color: _isActive ? Colors.green : Colors.red,
            //       ),
            //     ),
            //     subtitle: const Text(
            //       'Inactive products will be hidden from users',
            //     ),
            //     value: _isActive,
            //     activeTrackColor: Colors.green,
            //     activeThumbColor: Colors.white,
            //     onChanged: (val) {
            //       setState(() => _isActive = val);
            //     },
            //   ),
            // ),
            const SizedBox(height: 24),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Product Images',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 150,
                  child: Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.grey.shade200,
                          backgroundImage: selectedImage != null
                              ? FileImage(selectedImage!)
                              : (widget.product?.image != null &&
                                    widget.product!.image!.isNotEmpty)
                              ? NetworkImage(widget.product!.image!)
                              : null,
                          child:
                              (selectedImage == null &&
                                  (widget.product?.image == null ||
                                      widget.product?.image?.isEmpty == true))
                              ? const Icon(Icons.person, size: 60)
                              : null,
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.whiteColor,
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.add_photo_alternate,
                                color: Colors.black,
                              ),
                              onPressed: () async {
                                final image = await ImagePickerUtil.pickImage(
                                  context,
                                );
                                if (image != null) {
                                  setState(() => selectedImage = image);
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                const Text(
                  'Basic Details',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _nameController,
                  label: 'Product Name',
                  hint: 'Ex. Wireless Headphones',
                ),
                const SizedBox(height: 16),
                // _buildTextField(
                //   controller: _brandController,
                //   label: 'Brand',
                //   hint: 'Ex. Boat, Samsung',
                // ),
                // const SizedBox(height: 16),
                _buildTextField(
                  controller: _descController,
                  label: 'Description',
                  hint: 'Enter product details...',
                  maxLines: 4,
                ),
                const SizedBox(height: 24),

                const Text(
                  'Pricing & Category',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        controller: _mrpController,
                        label: 'MRP (₹)',
                        hint: '2999',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    // const SizedBox(width: 16),
                    // Expanded(
                    //   child: _buildTextField(
                    //     controller: _priceController,
                    //     label: 'Selling Price (₹)',
                    //     hint: '1999',
                    //     keyboardType: TextInputType.number,
                    //   ),
                    // ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    // Expanded(
                    //   child: _buildTextField(
                    //     controller: _gstController,
                    //     label: 'GST (%)',
                    //     hint: '18',
                    //     keyboardType: TextInputType.number,
                    //   ),
                    // ),
                    // const SizedBox(width: 16),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        initialValue: _category,
                        decoration: InputDecoration(
                          labelText: 'Category',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: 'Electronics',
                            child: Text('Electronics'),
                          ),
                          DropdownMenuItem(
                            value: 'Fashion',
                            child: Text('Fashion'),
                          ),
                          DropdownMenuItem(
                            value: 'Grocery',
                            child: Text('Grocery'),
                          ),
                        ],
                        onChanged: (val) {
                          if (val != null) setState(() => _category = val);
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                const Text(
                  'Inventory',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        controller: _stockController,
                        label: 'Stock Quantity',
                        hint: '100',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                BlocConsumer<
                  AdminAddorUpdateProductBloc,
                  AdminAddorUpdateProductState
                >(
                  listener: (context, state) {
                    state.whenOrNull(
                      failure: (message) {
                        AppSnackBar.show(context, message);
                      },

                      success: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                'Success',
                                style: AppFont.subHeading16BoldStyle,
                                textAlign: TextAlign.center,
                              ),
                              content: Text(
                                'Product added successfully',
                                style: AppFont.title14Style,
                                textAlign: TextAlign.center,
                              ),
                              actions: [
                                Center(
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                  builder: (context, state) {
                    return ButtonWidget(
                      isloading: state == AdminAddorUpdateProductState.loading()
                          ? true
                          : false,
                      title: widget.isEdit ? 'Update Product' : 'Save Product',
                      height: 50,
                      ontap: () {
                        if (state != AdminAddorUpdateProductState.loading()) {
                          final product = AdminProductsModel(
                            name: _nameController.text.trim(),
                            description: _descController.text.trim(),
                            price: _mrpController.text.trim(),
                            newProfileImage: selectedImage,
                          );

                          if (widget.isEdit == true) {
                            context.read<AdminAddorUpdateProductBloc>().add(
                              AdminAddorUpdateProductEvent.editProduct(product),
                            );
                          } else {
                            context.read<AdminAddorUpdateProductBloc>().add(
                              AdminAddorUpdateProductEvent.addProduct(product),
                            );
                          }
                        }
                      },
                    );
                  },
                ),
                const SizedBox(height: 32),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePreview() {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          const Center(child: Icon(Icons.image, color: Colors.grey)),
          Positioned(
            top: 4,
            right: 4,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.close, size: 14, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    int maxLines = 1,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
