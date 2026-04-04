import 'dart:io';
import 'package:flutter/foundation.dart';

import 'package:atlasmart/domain/admin/manage_products/model/admin_products_model.dart';
import 'package:atlasmart/presentation/common/button_widget.dart';
import 'package:atlasmart/presentation/common/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:atlasmart/application/admin/category_list/category_list_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../application/admin/admin_add_or_update_product/admin_addor_update_product_bloc.dart';
import '../../../domain/core/constants/colors.dart';
import '../../../domain/core/constants/font.dart';
import '../../../domain/core/util/image_picker.dart';
import '../../../domain/admin/manage_category/model/category_model.dart';

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
  String? _selectedCategoryId;
  XFile? selectedImage;
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
    _selectedCategoryId = widget.product?.categoryid;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CategoryListBloc>().add(
        const CategoryListEvent.getAllCategoryList(),
      );
    });
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
                              ? (kIsWeb
                                    ? NetworkImage(selectedImage!.path)
                                    : FileImage(File(selectedImage!.path))
                                          as ImageProvider)
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
                      child: BlocBuilder<CategoryListBloc, CategoryListState>(
                        builder: (context, state) {
                          List<CategoryModel> categories = [];
                          bool isLoading = false;
                          bool isError = false;

                          state.maybeWhen(
                            success: (list) {
                              categories = list;
                              if (_selectedCategoryId != null &&
                                  !categories.any(
                                    (e) => e.id == _selectedCategoryId,
                                  )) {
                                _selectedCategoryId = null;
                              }
                            },
                            loading: () => isLoading = true,
                            failure: (_) => isError = true,
                            orElse: () {},
                          );

                          return DropdownButtonFormField<String>(
                            value: _selectedCategoryId,
                            decoration: InputDecoration(
                              labelText: 'Category',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                              suffixIcon: isLoading
                                  ? const Padding(
                                      padding: EdgeInsets.all(12),
                                      child: SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                        ),
                                      ),
                                    )
                                  : Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        if (_selectedCategoryId != null)
                                          IconButton(
                                            iconSize: 20,
                                            icon: const Icon(
                                              Icons.clear,
                                              color: Colors.grey,
                                            ),
                                            onPressed: () {
                                              setState(
                                                () =>
                                                    _selectedCategoryId = null,
                                              );
                                            },
                                          ),
                                        if (isError ||
                                            (categories.isEmpty && !isLoading))
                                          IconButton(
                                            iconSize: 20,
                                            icon: const Icon(Icons.refresh),
                                            onPressed: () {
                                              context.read<CategoryListBloc>().add(
                                                const CategoryListEvent.getAllCategoryList(),
                                              );
                                            },
                                          ),
                                      ],
                                    ),
                            ),
                            hint: Text(
                              isLoading
                                  ? 'Loading...'
                                  : isError
                                  ? 'Error loading'
                                  : categories.isEmpty
                                  ? 'No categories'
                                  : 'Select Category',
                              style: TextStyle(
                                color: _selectedCategoryId == null
                                    ? Colors.grey
                                    : null,
                              ),
                            ),
                            items: categories.map((CategoryModel category) {
                              return DropdownMenuItem<String>(
                                value: category.id,
                                child: Text(category.categoryName),
                              );
                            }).toList(),
                            onChanged: categories.isEmpty
                                ? null
                                : (val) {
                                    setState(() => _selectedCategoryId = val);
                                  },
                          );
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
                        hint: '0',
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
                                widget.isEdit == false
                                    ? 'Product added successfully'
                                    : 'Product updated successfully',
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
                          if (_selectedCategoryId == null) {
                            AppSnackBar.show(context, 'Select a category');
                            return;
                          }

                          if (_stockController.text.isEmpty ||
                              _stockController.text == '0') {
                            AppSnackBar.show(context, 'Invalid stock value');
                            return;
                          }

                          final product = AdminProductsModel(
                            name: _nameController.text.trim(),
                            description: _descController.text.trim(),
                            price: _mrpController.text.trim(),
                            newProfileImage: selectedImage,
                            stock: _stockController.text.trim(),
                            categoryid: _selectedCategoryId,
                            id: widget.product?.id,
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
      textCapitalization: TextCapitalization.words,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
