import 'package:atlasmart/application/admin/category_list/category_list_bloc.dart';
import 'package:atlasmart/domain/core/constants/font.dart';
import 'package:atlasmart/domain/core/constants/strings.dart';
import 'package:atlasmart/presentation/common/error_state_widget.dart';
import 'package:atlasmart/presentation/common/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../common/admin_search_bar.dart';
import 'screen_add_category.dart';

class ScreenCategories extends StatelessWidget {
  const ScreenCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryListBloc, CategoryListState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: const AdminSearchBar(
                hintText: AppStrings.searchCategoriesHint,
              ),
            ),
            state.when(
              initial: () => const SizedBox(),
              loading: () => const Expanded(child: LoadingWidget()),
              failure: (message) => Expanded(
                child: ErrorStateWidgetWithMessage(
                  message,
                  hasRefresh: true,
                  ontap: () {
                    context.read<CategoryListBloc>().add(
                          const CategoryListEvent.getAllCategoryList(),
                        );
                  },
                ),
              ),
              success: (categories) {
                if (categories.isEmpty) {
                  return Expanded(
                    child: ErrorStateWidgetWithMessage(
                      'No categories found',
                      hasRefresh: true,
                      ontap: () {
                        context.read<CategoryListBloc>().add(
                              const CategoryListEvent.getAllCategoryList(),
                            );
                      },
                    ),
                  );
                }

                return Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      context.read<CategoryListBloc>().add(
                            const CategoryListEvent.getAllCategoryList(),
                          );
                    },
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      itemCount: categories.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final category = categories[index];

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
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(12),
                            leading: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(12),
                                image: category.categoryImage.isNotEmpty
                                    ? DecorationImage(
                                        image: NetworkImage(
                                          category.categoryImage,
                                        ),
                                        fit: BoxFit.cover,
                                      )
                                    : null,
                              ),
                              child: category.categoryImage.isEmpty
                                  ? const Icon(
                                      Icons.category_outlined,
                                      color: Colors.grey,
                                    )
                                  : null,
                            ),
                            title: Text(
                              category.categoryName,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            trailing: PopupMenuButton(
                              icon: const Icon(
                                Icons.more_vert,
                                color: Colors.grey,
                              ),
                              onSelected: (value) {
                                if (value == 'edit') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ScreenAddCategory(
                                        isEdit: true,
                                        category: category,
                                      ),
                                    ),
                                  ).then((value) {
                                    if (value == true && context.mounted) {
                                      context.read<CategoryListBloc>().add(
                                            const CategoryListEvent
                                                .getAllCategoryList(),
                                          );
                                    }
                                  });
                                } else if (value == 'delete') {
                                  _showDeleteDialog(
                                    context,
                                    category.id,
                                    category.categoryName,
                                  );
                                }
                              },
                              itemBuilder: (context) => [
                                const PopupMenuItem(
                                  value: 'edit',
                                  child: Text('Edit'),
                                ),
                                const PopupMenuItem(
                                  value: 'delete',
                                  child: Text(
                                    AppStrings.delete,
                                    style: TextStyle(color: Colors.red),
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
        );
      },
    );
  }

  void _showDeleteDialog(BuildContext context, String? id, String name) {
    if (id == null) return;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Category', style: AppFont.subHeading16BoldStyle),
          content: Text('Are you sure you want to delete "$name"?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(AppStrings.cancel),
            ),
            TextButton(
              onPressed: () {
                context.read<CategoryListBloc>().add(
                      CategoryListEvent.deleteCategory(id),
                    );
                Navigator.pop(context);
              },
              child: const Text(
                AppStrings.delete,
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
