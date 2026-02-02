import 'package:atlasmart/domain/admin/manage_category/manage_category.dart';
import 'package:atlasmart/domain/admin/manage_category/model/category_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_category_event.dart';
part 'add_category_state.dart';
part 'add_category_bloc.freezed.dart';

class AddCategoryBloc extends Bloc<AddCategoryEvent, AddCategoryState> {
  final ManageCategoryService _manageCategoryService;

  AddCategoryBloc(this._manageCategoryService) : super(_Initial()) {
    on<_AddCategory>((event, emit) async {
      emit(_Loading());

      try {
        final addStatus = await _manageCategoryService.addCategory(
          event.category,
        );

        if (addStatus == true) {
          emit(_Success());
        } else {
          emit(_Failure('Category Add Failed'));
        }
      } catch (e) {
        emit(_Failure(e.toString()));
      }
    });
  }
}
