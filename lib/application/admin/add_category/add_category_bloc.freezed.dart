// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_category_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddCategoryEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddCategoryEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddCategoryEvent()';
}


}

/// @nodoc
class $AddCategoryEventCopyWith<$Res>  {
$AddCategoryEventCopyWith(AddCategoryEvent _, $Res Function(AddCategoryEvent) __);
}


/// Adds pattern-matching-related methods to [AddCategoryEvent].
extension AddCategoryEventPatterns on AddCategoryEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _AddCategory value)?  addCategory,TResult Function( _EditCategory value)?  editCategory,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _AddCategory() when addCategory != null:
return addCategory(_that);case _EditCategory() when editCategory != null:
return editCategory(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _AddCategory value)  addCategory,required TResult Function( _EditCategory value)  editCategory,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _AddCategory():
return addCategory(_that);case _EditCategory():
return editCategory(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _AddCategory value)?  addCategory,TResult? Function( _EditCategory value)?  editCategory,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _AddCategory() when addCategory != null:
return addCategory(_that);case _EditCategory() when editCategory != null:
return editCategory(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( CategoryModel category)?  addCategory,TResult Function( CategoryModel category)?  editCategory,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _AddCategory() when addCategory != null:
return addCategory(_that.category);case _EditCategory() when editCategory != null:
return editCategory(_that.category);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( CategoryModel category)  addCategory,required TResult Function( CategoryModel category)  editCategory,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _AddCategory():
return addCategory(_that.category);case _EditCategory():
return editCategory(_that.category);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( CategoryModel category)?  addCategory,TResult? Function( CategoryModel category)?  editCategory,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _AddCategory() when addCategory != null:
return addCategory(_that.category);case _EditCategory() when editCategory != null:
return editCategory(_that.category);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements AddCategoryEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddCategoryEvent.started()';
}


}




/// @nodoc


class _AddCategory implements AddCategoryEvent {
  const _AddCategory(this.category);
  

 final  CategoryModel category;

/// Create a copy of AddCategoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddCategoryCopyWith<_AddCategory> get copyWith => __$AddCategoryCopyWithImpl<_AddCategory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddCategory&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,category);

@override
String toString() {
  return 'AddCategoryEvent.addCategory(category: $category)';
}


}

/// @nodoc
abstract mixin class _$AddCategoryCopyWith<$Res> implements $AddCategoryEventCopyWith<$Res> {
  factory _$AddCategoryCopyWith(_AddCategory value, $Res Function(_AddCategory) _then) = __$AddCategoryCopyWithImpl;
@useResult
$Res call({
 CategoryModel category
});




}
/// @nodoc
class __$AddCategoryCopyWithImpl<$Res>
    implements _$AddCategoryCopyWith<$Res> {
  __$AddCategoryCopyWithImpl(this._self, this._then);

  final _AddCategory _self;
  final $Res Function(_AddCategory) _then;

/// Create a copy of AddCategoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,}) {
  return _then(_AddCategory(
null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,
  ));
}


}

/// @nodoc


class _EditCategory implements AddCategoryEvent {
  const _EditCategory(this.category);
  

 final  CategoryModel category;

/// Create a copy of AddCategoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditCategoryCopyWith<_EditCategory> get copyWith => __$EditCategoryCopyWithImpl<_EditCategory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditCategory&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,category);

@override
String toString() {
  return 'AddCategoryEvent.editCategory(category: $category)';
}


}

/// @nodoc
abstract mixin class _$EditCategoryCopyWith<$Res> implements $AddCategoryEventCopyWith<$Res> {
  factory _$EditCategoryCopyWith(_EditCategory value, $Res Function(_EditCategory) _then) = __$EditCategoryCopyWithImpl;
@useResult
$Res call({
 CategoryModel category
});




}
/// @nodoc
class __$EditCategoryCopyWithImpl<$Res>
    implements _$EditCategoryCopyWith<$Res> {
  __$EditCategoryCopyWithImpl(this._self, this._then);

  final _EditCategory _self;
  final $Res Function(_EditCategory) _then;

/// Create a copy of AddCategoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,}) {
  return _then(_EditCategory(
null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,
  ));
}


}

/// @nodoc
mixin _$AddCategoryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddCategoryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddCategoryState()';
}


}

/// @nodoc
class $AddCategoryStateCopyWith<$Res>  {
$AddCategoryStateCopyWith(AddCategoryState _, $Res Function(AddCategoryState) __);
}


/// Adds pattern-matching-related methods to [AddCategoryState].
extension AddCategoryStatePatterns on AddCategoryState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Success value)?  success,TResult Function( _Failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Success value)  success,required TResult Function( _Failure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Success():
return success(_that);case _Failure():
return failure(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Success value)?  success,TResult? Function( _Failure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  success,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success();case _Failure() when failure != null:
return failure(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  success,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Success():
return success();case _Failure():
return failure(_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success();case _Failure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AddCategoryState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddCategoryState.initial()';
}


}




/// @nodoc


class _Loading implements AddCategoryState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddCategoryState.loading()';
}


}




/// @nodoc


class _Success implements AddCategoryState {
  const _Success();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddCategoryState.success()';
}


}




/// @nodoc


class _Failure implements AddCategoryState {
  const _Failure(this.message);
  

 final  String message;

/// Create a copy of AddCategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AddCategoryState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $AddCategoryStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of AddCategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Failure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
