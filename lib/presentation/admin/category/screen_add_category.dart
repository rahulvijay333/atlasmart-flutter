import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:atlasmart/application/admin/add_category/add_category_bloc.dart';
import 'package:atlasmart/domain/admin/manage_category/model/category_model.dart';
import 'package:atlasmart/domain/core/constants/colors.dart';
import 'package:atlasmart/domain/core/constants/font.dart';

import 'package:atlasmart/domain/core/util/image_picker.dart';
import 'package:atlasmart/presentation/common/button_widget.dart';
import 'package:atlasmart/presentation/common/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ScreenAddCategory extends StatefulWidget {
  final bool isEdit;
  final CategoryModel? category;

  const ScreenAddCategory({super.key, this.isEdit = false, this.category});

  @override
  State<ScreenAddCategory> createState() => _ScreenAddCategoryState();
}

class _ScreenAddCategoryState extends State<ScreenAddCategory> {
  late TextEditingController _nameController;
  XFile? _selectedImage;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.category?.categoryName);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEdit ? 'Edit Category' : 'Add New Category'),
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              'Image',
              style: AppFont.title16Style.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
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
                      backgroundImage: _selectedImage != null
                          ? (kIsWeb
                              ? NetworkImage(_selectedImage!.path)
                              : FileImage(File(_selectedImage!.path)) as ImageProvider)
                          : (widget.category?.categoryImage != null &&
                                  widget.category!.categoryImage.isNotEmpty)
                              ? NetworkImage(widget.category!.categoryImage)
                              : null,
                      child: _selectedImage == null &&
                              (widget.category?.categoryImage == null ||
                                  widget.category!.categoryImage.isEmpty)
                          ? const Icon(
                              Icons.category_outlined,
                              size: 60,
                              color: Colors.grey,
                            )
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
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 4,
                            ),
                          ],
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
                              setState(() => _selectedImage = image);
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

            Text(
              'Name',
              style: AppFont.title16Style.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            _buildTextField(
              controller: _nameController,
              label: 'Category Name',
              hint: 'Ex. Electronics, Fashion',
            ),
            const SizedBox(height: 40),
            BlocConsumer<AddCategoryBloc, AddCategoryState>(
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
                          title: Center(
                            child: Text(
                              'Success',
                              style: AppFont.subHeading16BoldStyle,
                            ),
                          ),
                          content: Text(
                            widget.isEdit
                                ? 'Category updated successfully'
                                : 'Category added successfully',
                            style: AppFont.title14Style,
                            textAlign: TextAlign.center,
                          ),
                          actions: [
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop(true);
                                },
                                child: const Text('OK'),
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
                  isloading: state == const AddCategoryState.loading(),
                  title: widget.isEdit ? 'Update Category' : 'Save Category',
                  height: 50,
                  ontap: () {
                    final name = _nameController.text.trim();
                    if (name.isEmpty) {
                      AppSnackBar.show(context, 'Please enter category name');
                      return;
                    }
                    // if (_selectedImage == null) {
                    //   AppSnackBar.show(
                    //     context,
                    //     'Please select a category image',
                    //   );
                    //   return;
                    // }

                    final category = CategoryModel(
                      categoryName: name,
                      categoryImage: widget.category?.categoryImage ?? '',
                      selectedImage: _selectedImage,
                      id: widget.category?.id,
                    );

                    if (widget.isEdit) {
                      context.read<AddCategoryBloc>().add(
                            AddCategoryEvent.editCategory(category),
                          );
                    } else {
                      context.read<AddCategoryBloc>().add(
                            AddCategoryEvent.addCategory(category),
                          );
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
  }) {
    return TextFormField(
      controller: controller,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        // labelText: label,
        hintText: hint,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
