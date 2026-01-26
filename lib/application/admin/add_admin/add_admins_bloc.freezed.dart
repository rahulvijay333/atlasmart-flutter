// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_admins_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddAdminsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddAdminsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddAdminsEvent()';
}


}

/// @nodoc
class $AddAdminsEventCopyWith<$Res>  {
$AddAdminsEventCopyWith(AddAdminsEvent _, $Res Function(AddAdminsEvent) __);
}


/// Adds pattern-matching-related methods to [AddAdminsEvent].
extension AddAdminsEventPatterns on AddAdminsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _AddNewAdmin value)?  addNewAdmin,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _AddNewAdmin() when addNewAdmin != null:
return addNewAdmin(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _AddNewAdmin value)  addNewAdmin,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _AddNewAdmin():
return addNewAdmin(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _AddNewAdmin value)?  addNewAdmin,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _AddNewAdmin() when addNewAdmin != null:
return addNewAdmin(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( AdminUserModel newAdmin)?  addNewAdmin,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _AddNewAdmin() when addNewAdmin != null:
return addNewAdmin(_that.newAdmin);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( AdminUserModel newAdmin)  addNewAdmin,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _AddNewAdmin():
return addNewAdmin(_that.newAdmin);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( AdminUserModel newAdmin)?  addNewAdmin,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _AddNewAdmin() when addNewAdmin != null:
return addNewAdmin(_that.newAdmin);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements AddAdminsEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddAdminsEvent.started()';
}


}




/// @nodoc


class _AddNewAdmin implements AddAdminsEvent {
  const _AddNewAdmin(this.newAdmin);
  

 final  AdminUserModel newAdmin;

/// Create a copy of AddAdminsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddNewAdminCopyWith<_AddNewAdmin> get copyWith => __$AddNewAdminCopyWithImpl<_AddNewAdmin>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddNewAdmin&&(identical(other.newAdmin, newAdmin) || other.newAdmin == newAdmin));
}


@override
int get hashCode => Object.hash(runtimeType,newAdmin);

@override
String toString() {
  return 'AddAdminsEvent.addNewAdmin(newAdmin: $newAdmin)';
}


}

/// @nodoc
abstract mixin class _$AddNewAdminCopyWith<$Res> implements $AddAdminsEventCopyWith<$Res> {
  factory _$AddNewAdminCopyWith(_AddNewAdmin value, $Res Function(_AddNewAdmin) _then) = __$AddNewAdminCopyWithImpl;
@useResult
$Res call({
 AdminUserModel newAdmin
});




}
/// @nodoc
class __$AddNewAdminCopyWithImpl<$Res>
    implements _$AddNewAdminCopyWith<$Res> {
  __$AddNewAdminCopyWithImpl(this._self, this._then);

  final _AddNewAdmin _self;
  final $Res Function(_AddNewAdmin) _then;

/// Create a copy of AddAdminsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? newAdmin = null,}) {
  return _then(_AddNewAdmin(
null == newAdmin ? _self.newAdmin : newAdmin // ignore: cast_nullable_to_non_nullable
as AdminUserModel,
  ));
}


}

/// @nodoc
mixin _$AddAdminsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddAdminsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddAdminsState()';
}


}

/// @nodoc
class $AddAdminsStateCopyWith<$Res>  {
$AddAdminsStateCopyWith(AddAdminsState _, $Res Function(AddAdminsState) __);
}


/// Adds pattern-matching-related methods to [AddAdminsState].
extension AddAdminsStatePatterns on AddAdminsState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  success,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _loading() when loading != null:
return loading();case _success() when success != null:
return success();case _failure() when failure != null:
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
return initial();case _loading():
return loading();case _success():
return success();case _failure():
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
return initial();case _loading() when loading != null:
return loading();case _success() when success != null:
return success();case _failure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AddAdminsState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddAdminsState.initial()';
}


}




/// @nodoc


class _loading implements AddAdminsState {
  const _loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddAdminsState.loading()';
}


}




/// @nodoc


class _success implements AddAdminsState {
  const _success();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _success);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddAdminsState.success()';
}


}




/// @nodoc


class _failure implements AddAdminsState {
  const _failure(this.message);
  

 final  String message;

/// Create a copy of AddAdminsState
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
  return 'AddAdminsState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$failureCopyWith<$Res> implements $AddAdminsStateCopyWith<$Res> {
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

/// Create a copy of AddAdminsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_failure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
