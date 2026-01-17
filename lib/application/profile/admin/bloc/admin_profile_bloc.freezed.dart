// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AdminProfileEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminProfileEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdminProfileEvent()';
}


}

/// @nodoc
class $AdminProfileEventCopyWith<$Res>  {
$AdminProfileEventCopyWith(AdminProfileEvent _, $Res Function(AdminProfileEvent) __);
}


/// Adds pattern-matching-related methods to [AdminProfileEvent].
extension AdminProfileEventPatterns on AdminProfileEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _GetProfileDetails value)?  getProfileDetails,TResult Function( _UpdateProfileDetailsButtonClick value)?  updateProfileDetailsButtonClick,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _GetProfileDetails() when getProfileDetails != null:
return getProfileDetails(_that);case _UpdateProfileDetailsButtonClick() when updateProfileDetailsButtonClick != null:
return updateProfileDetailsButtonClick(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _GetProfileDetails value)  getProfileDetails,required TResult Function( _UpdateProfileDetailsButtonClick value)  updateProfileDetailsButtonClick,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _GetProfileDetails():
return getProfileDetails(_that);case _UpdateProfileDetailsButtonClick():
return updateProfileDetailsButtonClick(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _GetProfileDetails value)?  getProfileDetails,TResult? Function( _UpdateProfileDetailsButtonClick value)?  updateProfileDetailsButtonClick,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _GetProfileDetails() when getProfileDetails != null:
return getProfileDetails(_that);case _UpdateProfileDetailsButtonClick() when updateProfileDetailsButtonClick != null:
return updateProfileDetailsButtonClick(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  getProfileDetails,TResult Function( AdminUserModel profile)?  updateProfileDetailsButtonClick,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _GetProfileDetails() when getProfileDetails != null:
return getProfileDetails();case _UpdateProfileDetailsButtonClick() when updateProfileDetailsButtonClick != null:
return updateProfileDetailsButtonClick(_that.profile);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  getProfileDetails,required TResult Function( AdminUserModel profile)  updateProfileDetailsButtonClick,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _GetProfileDetails():
return getProfileDetails();case _UpdateProfileDetailsButtonClick():
return updateProfileDetailsButtonClick(_that.profile);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  getProfileDetails,TResult? Function( AdminUserModel profile)?  updateProfileDetailsButtonClick,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _GetProfileDetails() when getProfileDetails != null:
return getProfileDetails();case _UpdateProfileDetailsButtonClick() when updateProfileDetailsButtonClick != null:
return updateProfileDetailsButtonClick(_that.profile);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements AdminProfileEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdminProfileEvent.started()';
}


}




/// @nodoc


class _GetProfileDetails implements AdminProfileEvent {
  const _GetProfileDetails();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetProfileDetails);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdminProfileEvent.getProfileDetails()';
}


}




/// @nodoc


class _UpdateProfileDetailsButtonClick implements AdminProfileEvent {
  const _UpdateProfileDetailsButtonClick({required this.profile});
  

 final  AdminUserModel profile;

/// Create a copy of AdminProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateProfileDetailsButtonClickCopyWith<_UpdateProfileDetailsButtonClick> get copyWith => __$UpdateProfileDetailsButtonClickCopyWithImpl<_UpdateProfileDetailsButtonClick>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateProfileDetailsButtonClick&&(identical(other.profile, profile) || other.profile == profile));
}


@override
int get hashCode => Object.hash(runtimeType,profile);

@override
String toString() {
  return 'AdminProfileEvent.updateProfileDetailsButtonClick(profile: $profile)';
}


}

/// @nodoc
abstract mixin class _$UpdateProfileDetailsButtonClickCopyWith<$Res> implements $AdminProfileEventCopyWith<$Res> {
  factory _$UpdateProfileDetailsButtonClickCopyWith(_UpdateProfileDetailsButtonClick value, $Res Function(_UpdateProfileDetailsButtonClick) _then) = __$UpdateProfileDetailsButtonClickCopyWithImpl;
@useResult
$Res call({
 AdminUserModel profile
});




}
/// @nodoc
class __$UpdateProfileDetailsButtonClickCopyWithImpl<$Res>
    implements _$UpdateProfileDetailsButtonClickCopyWith<$Res> {
  __$UpdateProfileDetailsButtonClickCopyWithImpl(this._self, this._then);

  final _UpdateProfileDetailsButtonClick _self;
  final $Res Function(_UpdateProfileDetailsButtonClick) _then;

/// Create a copy of AdminProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profile = null,}) {
  return _then(_UpdateProfileDetailsButtonClick(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as AdminUserModel,
  ));
}


}

/// @nodoc
mixin _$AdminProfileState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminProfileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdminProfileState()';
}


}

/// @nodoc
class $AdminProfileStateCopyWith<$Res>  {
$AdminProfileStateCopyWith(AdminProfileState _, $Res Function(AdminProfileState) __);
}


/// Adds pattern-matching-related methods to [AdminProfileState].
extension AdminProfileStatePatterns on AdminProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _updateLoading value)?  updateLoading,TResult Function( _Success value)?  success,TResult Function( _Failed value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _updateLoading() when updateLoading != null:
return updateLoading(_that);case _Success() when success != null:
return success(_that);case _Failed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _updateLoading value)  updateLoading,required TResult Function( _Success value)  success,required TResult Function( _Failed value)  failed,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _updateLoading():
return updateLoading(_that);case _Success():
return success(_that);case _Failed():
return failed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _updateLoading value)?  updateLoading,TResult? Function( _Success value)?  success,TResult? Function( _Failed value)?  failed,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _updateLoading() when updateLoading != null:
return updateLoading(_that);case _Success() when success != null:
return success(_that);case _Failed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  updateLoading,TResult Function( AdminUserModel profile)?  success,TResult Function( String message)?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _updateLoading() when updateLoading != null:
return updateLoading();case _Success() when success != null:
return success(_that.profile);case _Failed() when failed != null:
return failed(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  updateLoading,required TResult Function( AdminUserModel profile)  success,required TResult Function( String message)  failed,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _updateLoading():
return updateLoading();case _Success():
return success(_that.profile);case _Failed():
return failed(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  updateLoading,TResult? Function( AdminUserModel profile)?  success,TResult? Function( String message)?  failed,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _updateLoading() when updateLoading != null:
return updateLoading();case _Success() when success != null:
return success(_that.profile);case _Failed() when failed != null:
return failed(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AdminProfileState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdminProfileState.initial()';
}


}




/// @nodoc


class _Loading implements AdminProfileState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdminProfileState.loading()';
}


}




/// @nodoc


class _updateLoading implements AdminProfileState {
  const _updateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _updateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdminProfileState.updateLoading()';
}


}




/// @nodoc


class _Success implements AdminProfileState {
  const _Success({required this.profile});
  

 final  AdminUserModel profile;

/// Create a copy of AdminProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.profile, profile) || other.profile == profile));
}


@override
int get hashCode => Object.hash(runtimeType,profile);

@override
String toString() {
  return 'AdminProfileState.success(profile: $profile)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $AdminProfileStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 AdminUserModel profile
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of AdminProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profile = null,}) {
  return _then(_Success(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as AdminUserModel,
  ));
}


}

/// @nodoc


class _Failed implements AdminProfileState {
  const _Failed({required this.message});
  

 final  String message;

/// Create a copy of AdminProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailedCopyWith<_Failed> get copyWith => __$FailedCopyWithImpl<_Failed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failed&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AdminProfileState.failed(message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailedCopyWith<$Res> implements $AdminProfileStateCopyWith<$Res> {
  factory _$FailedCopyWith(_Failed value, $Res Function(_Failed) _then) = __$FailedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$FailedCopyWithImpl<$Res>
    implements _$FailedCopyWith<$Res> {
  __$FailedCopyWithImpl(this._self, this._then);

  final _Failed _self;
  final $Res Function(_Failed) _then;

/// Create a copy of AdminProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Failed(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
