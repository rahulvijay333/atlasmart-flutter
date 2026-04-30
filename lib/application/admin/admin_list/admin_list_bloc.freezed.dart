// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AdminListEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminListEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdminListEvent()';
}


}

/// @nodoc
class $AdminListEventCopyWith<$Res>  {
$AdminListEventCopyWith(AdminListEvent _, $Res Function(AdminListEvent) __);
}


/// Adds pattern-matching-related methods to [AdminListEvent].
extension AdminListEventPatterns on AdminListEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _GetAllAdminList value)?  getAllAdminList,TResult Function( _DeleteAdmin value)?  deleteAdmin,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _GetAllAdminList() when getAllAdminList != null:
return getAllAdminList(_that);case _DeleteAdmin() when deleteAdmin != null:
return deleteAdmin(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _GetAllAdminList value)  getAllAdminList,required TResult Function( _DeleteAdmin value)  deleteAdmin,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _GetAllAdminList():
return getAllAdminList(_that);case _DeleteAdmin():
return deleteAdmin(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _GetAllAdminList value)?  getAllAdminList,TResult? Function( _DeleteAdmin value)?  deleteAdmin,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _GetAllAdminList() when getAllAdminList != null:
return getAllAdminList(_that);case _DeleteAdmin() when deleteAdmin != null:
return deleteAdmin(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  getAllAdminList,TResult Function( String id)?  deleteAdmin,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _GetAllAdminList() when getAllAdminList != null:
return getAllAdminList();case _DeleteAdmin() when deleteAdmin != null:
return deleteAdmin(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  getAllAdminList,required TResult Function( String id)  deleteAdmin,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _GetAllAdminList():
return getAllAdminList();case _DeleteAdmin():
return deleteAdmin(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  getAllAdminList,TResult? Function( String id)?  deleteAdmin,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _GetAllAdminList() when getAllAdminList != null:
return getAllAdminList();case _DeleteAdmin() when deleteAdmin != null:
return deleteAdmin(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements AdminListEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdminListEvent.started()';
}


}




/// @nodoc


class _GetAllAdminList implements AdminListEvent {
  const _GetAllAdminList();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetAllAdminList);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdminListEvent.getAllAdminList()';
}


}




/// @nodoc


class _DeleteAdmin implements AdminListEvent {
  const _DeleteAdmin(this.id);
  

 final  String id;

/// Create a copy of AdminListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteAdminCopyWith<_DeleteAdmin> get copyWith => __$DeleteAdminCopyWithImpl<_DeleteAdmin>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteAdmin&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'AdminListEvent.deleteAdmin(id: $id)';
}


}

/// @nodoc
abstract mixin class _$DeleteAdminCopyWith<$Res> implements $AdminListEventCopyWith<$Res> {
  factory _$DeleteAdminCopyWith(_DeleteAdmin value, $Res Function(_DeleteAdmin) _then) = __$DeleteAdminCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class __$DeleteAdminCopyWithImpl<$Res>
    implements _$DeleteAdminCopyWith<$Res> {
  __$DeleteAdminCopyWithImpl(this._self, this._then);

  final _DeleteAdmin _self;
  final $Res Function(_DeleteAdmin) _then;

/// Create a copy of AdminListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_DeleteAdmin(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$AdminListState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminListState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdminListState()';
}


}

/// @nodoc
class $AdminListStateCopyWith<$Res>  {
$AdminListStateCopyWith(AdminListState _, $Res Function(AdminListState) __);
}


/// Adds pattern-matching-related methods to [AdminListState].
extension AdminListStatePatterns on AdminListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _loading value)?  loading,TResult Function( _success value)?  success,TResult Function( _failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _loading() when loading != null:
return loading(_that);case _success() when success != null:
return success(_that);case _failure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _loading value)  loading,required TResult Function( _success value)  success,required TResult Function( _failure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _loading():
return loading(_that);case _success():
return success(_that);case _failure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _loading value)?  loading,TResult? Function( _success value)?  success,TResult? Function( _failure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _loading() when loading != null:
return loading(_that);case _success() when success != null:
return success(_that);case _failure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<AdminUserModel> adminList)?  success,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _loading() when loading != null:
return loading();case _success() when success != null:
return success(_that.adminList);case _failure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<AdminUserModel> adminList)  success,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _loading():
return loading();case _success():
return success(_that.adminList);case _failure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<AdminUserModel> adminList)?  success,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _loading() when loading != null:
return loading();case _success() when success != null:
return success(_that.adminList);case _failure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AdminListState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdminListState.initial()';
}


}




/// @nodoc


class _loading implements AdminListState {
  const _loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdminListState.loading()';
}


}




/// @nodoc


class _success implements AdminListState {
  const _success(final  List<AdminUserModel> adminList): _adminList = adminList;
  

 final  List<AdminUserModel> _adminList;
 List<AdminUserModel> get adminList {
  if (_adminList is EqualUnmodifiableListView) return _adminList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_adminList);
}


/// Create a copy of AdminListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$successCopyWith<_success> get copyWith => __$successCopyWithImpl<_success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _success&&const DeepCollectionEquality().equals(other._adminList, _adminList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_adminList));

@override
String toString() {
  return 'AdminListState.success(adminList: $adminList)';
}


}

/// @nodoc
abstract mixin class _$successCopyWith<$Res> implements $AdminListStateCopyWith<$Res> {
  factory _$successCopyWith(_success value, $Res Function(_success) _then) = __$successCopyWithImpl;
@useResult
$Res call({
 List<AdminUserModel> adminList
});




}
/// @nodoc
class __$successCopyWithImpl<$Res>
    implements _$successCopyWith<$Res> {
  __$successCopyWithImpl(this._self, this._then);

  final _success _self;
  final $Res Function(_success) _then;

/// Create a copy of AdminListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? adminList = null,}) {
  return _then(_success(
null == adminList ? _self._adminList : adminList // ignore: cast_nullable_to_non_nullable
as List<AdminUserModel>,
  ));
}


}

/// @nodoc


class _failure implements AdminListState {
  const _failure(this.message);
  

 final  String message;

/// Create a copy of AdminListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$failureCopyWith<_failure> get copyWith => __$failureCopyWithImpl<_failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _failure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AdminListState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$failureCopyWith<$Res> implements $AdminListStateCopyWith<$Res> {
  factory _$failureCopyWith(_failure value, $Res Function(_failure) _then) = __$failureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$failureCopyWithImpl<$Res>
    implements _$failureCopyWith<$Res> {
  __$failureCopyWithImpl(this._self, this._then);

  final _failure _self;
  final $Res Function(_failure) _then;

/// Create a copy of AdminListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_failure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
