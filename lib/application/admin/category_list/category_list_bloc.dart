import 'package:atlasmart/domain/admin/manage_category/model/category_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/admin/manage_category/manage_category.dart';

part 'category_list_event.dart';
part 'category_list_state.dart';
part 'category_list_bloc.freezed.dart';

class CategoryListBloc extends Bloc<CategoryListEvent, CategoryListState> {
  final ManageCategoryService _manageCategoryService;
  CategoryListBloc(this._manageCategoryService) : super(_Initial()) {
    on<_GetAllCategoryList>((event, emit) async {
      emit(_Loading());

      try {
        final list = await _manageCategoryService.getAllCategories();

        emit(_Success(list));
      } catch (e) {
        emit(_Failure(e.toString()));
      }
    });

    on<_DeleteCategory>((event, emit) async {
      try {
        await _manageCategoryService.deleteCategory(event.id);
        add(const _GetAllCategoryList());
      } catch (e) {
        emit(_Failure(e.toString()));
      }
    });
  }
}
