// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ForgotPasswordEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgotPasswordEvent()';
}


}

/// @nodoc
class $ForgotPasswordEventCopyWith<$Res>  {
$ForgotPasswordEventCopyWith(ForgotPasswordEvent _, $Res Function(ForgotPasswordEvent) __);
}


/// Adds pattern-matching-related methods to [ForgotPasswordEvent].
extension ForgotPasswordEventPatterns on ForgotPasswordEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _reset value)?  reset,TResult Function( _sentEmailOtp value)?  sentEmailOtp,TResult Function( _verifyOtpButtonClick value)?  verifyOtpButtonClick,TResult Function( _setPasswordButtonClick value)?  setPasswordButtonClick,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _reset() when reset != null:
return reset(_that);case _sentEmailOtp() when sentEmailOtp != null:
return sentEmailOtp(_that);case _verifyOtpButtonClick() when verifyOtpButtonClick != null:
return verifyOtpButtonClick(_that);case _setPasswordButtonClick() when setPasswordButtonClick != null:
return setPasswordButtonClick(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _reset value)  reset,required TResult Function( _sentEmailOtp value)  sentEmailOtp,required TResult Function( _verifyOtpButtonClick value)  verifyOtpButtonClick,required TResult Function( _setPasswordButtonClick value)  setPasswordButtonClick,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _reset():
return reset(_that);case _sentEmailOtp():
return sentEmailOtp(_that);case _verifyOtpButtonClick():
return verifyOtpButtonClick(_that);case _setPasswordButtonClick():
return setPasswordButtonClick(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _reset value)?  reset,TResult? Function( _sentEmailOtp value)?  sentEmailOtp,TResult? Function( _verifyOtpButtonClick value)?  verifyOtpButtonClick,TResult? Function( _setPasswordButtonClick value)?  setPasswordButtonClick,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _reset() when reset != null:
return reset(_that);case _sentEmailOtp() when sentEmailOtp != null:
return sentEmailOtp(_that);case _verifyOtpButtonClick() when verifyOtpButtonClick != null:
return verifyOtpButtonClick(_that);case _setPasswordButtonClick() when setPasswordButtonClick != null:
return setPasswordButtonClick(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  reset,TResult Function( String email)?  sentEmailOtp,TResult Function( String email,  String otp)?  verifyOtpButtonClick,TResult Function( String email,  String otp,  String password)?  setPasswordButtonClick,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _reset() when reset != null:
return reset();case _sentEmailOtp() when sentEmailOtp != null:
return sentEmailOtp(_that.email);case _verifyOtpButtonClick() when verifyOtpButtonClick != null:
return verifyOtpButtonClick(_that.email,_that.otp);case _setPasswordButtonClick() when setPasswordButtonClick != null:
return setPasswordButtonClick(_that.email,_that.otp,_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  reset,required TResult Function( String email)  sentEmailOtp,required TResult Function( String email,  String otp)  verifyOtpButtonClick,required TResult Function( String email,  String otp,  String password)  setPasswordButtonClick,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _reset():
return reset();case _sentEmailOtp():
return sentEmailOtp(_that.email);case _verifyOtpButtonClick():
return verifyOtpButtonClick(_that.email,_that.otp);case _setPasswordButtonClick():
return setPasswordButtonClick(_that.email,_that.otp,_that.password);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  reset,TResult? Function( String email)?  sentEmailOtp,TResult? Function( String email,  String otp)?  verifyOtpButtonClick,TResult? Function( String email,  String otp,  String password)?  setPasswordButtonClick,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _reset() when reset != null:
return reset();case _sentEmailOtp() when sentEmailOtp != null:
return sentEmailOtp(_that.email);case _verifyOtpButtonClick() when verifyOtpButtonClick != null:
return verifyOtpButtonClick(_that.email,_that.otp);case _setPasswordButtonClick() when setPasswordButtonClick != null:
return setPasswordButtonClick(_that.email,_that.otp,_that.password);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements ForgotPasswordEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgotPasswordEvent.started()';
}


}




/// @nodoc


class _reset implements ForgotPasswordEvent {
  const _reset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgotPasswordEvent.reset()';
}


}




/// @nodoc


class _sentEmailOtp implements ForgotPasswordEvent {
  const _sentEmailOtp({required this.email});
  

 final  String email;

/// Create a copy of ForgotPasswordEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$sentEmailOtpCopyWith<_sentEmailOtp> get copyWith => __$sentEmailOtpCopyWithImpl<_sentEmailOtp>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _sentEmailOtp&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'ForgotPasswordEvent.sentEmailOtp(email: $email)';
}


}

/// @nodoc
abstract mixin class _$sentEmailOtpCopyWith<$Res> implements $ForgotPasswordEventCopyWith<$Res> {
  factory _$sentEmailOtpCopyWith(_sentEmailOtp value, $Res Function(_sentEmailOtp) _then) = __$sentEmailOtpCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class __$sentEmailOtpCopyWithImpl<$Res>
    implements _$sentEmailOtpCopyWith<$Res> {
  __$sentEmailOtpCopyWithImpl(this._self, this._then);

  final _sentEmailOtp _self;
  final $Res Function(_sentEmailOtp) _then;

/// Create a copy of ForgotPasswordEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_sentEmailOtp(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _verifyOtpButtonClick implements ForgotPasswordEvent {
  const _verifyOtpButtonClick({required this.email, required this.otp});
  

 final  String email;
 final  String otp;

/// Create a copy of ForgotPasswordEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$verifyOtpButtonClickCopyWith<_verifyOtpButtonClick> get copyWith => __$verifyOtpButtonClickCopyWithImpl<_verifyOtpButtonClick>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _verifyOtpButtonClick&&(identical(other.email, email) || other.email == email)&&(identical(other.otp, otp) || other.otp == otp));
}


@override
int get hashCode => Object.hash(runtimeType,email,otp);

@override
String toString() {
  return 'ForgotPasswordEvent.verifyOtpButtonClick(email: $email, otp: $otp)';
}


}

/// @nodoc
abstract mixin class _$verifyOtpButtonClickCopyWith<$Res> implements $ForgotPasswordEventCopyWith<$Res> {
  factory _$verifyOtpButtonClickCopyWith(_verifyOtpButtonClick value, $Res Function(_verifyOtpButtonClick) _then) = __$verifyOtpButtonClickCopyWithImpl;
@useResult
$Res call({
 String email, String otp
});




}
/// @nodoc
class __$verifyOtpButtonClickCopyWithImpl<$Res>
    implements _$verifyOtpButtonClickCopyWith<$Res> {
  __$verifyOtpButtonClickCopyWithImpl(this._self, this._then);

  final _verifyOtpButtonClick _self;
  final $Res Function(_verifyOtpButtonClick) _then;

/// Create a copy of ForgotPasswordEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? otp = null,}) {
  return _then(_verifyOtpButtonClick(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _setPasswordButtonClick implements ForgotPasswordEvent {
  const _setPasswordButtonClick({required this.email, required this.otp, required this.password});
  

 final  String email;
 final  String otp;
 final  String password;

/// Create a copy of ForgotPasswordEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$setPasswordButtonClickCopyWith<_setPasswordButtonClick> get copyWith => __$setPasswordButtonClickCopyWithImpl<_setPasswordButtonClick>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _setPasswordButtonClick&&(identical(other.email, email) || other.email == email)&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,otp,password);

@override
String toString() {
  return 'ForgotPasswordEvent.setPasswordButtonClick(email: $email, otp: $otp, password: $password)';
}


}

/// @nodoc
abstract mixin class _$setPasswordButtonClickCopyWith<$Res> implements $ForgotPasswordEventCopyWith<$Res> {
  factory _$setPasswordButtonClickCopyWith(_setPasswordButtonClick value, $Res Function(_setPasswordButtonClick) _then) = __$setPasswordButtonClickCopyWithImpl;
@useResult
$Res call({
 String email, String otp, String password
});




}
/// @nodoc
class __$setPasswordButtonClickCopyWithImpl<$Res>
    implements _$setPasswordButtonClickCopyWith<$Res> {
  __$setPasswordButtonClickCopyWithImpl(this._self, this._then);

  final _setPasswordButtonClick _self;
  final $Res Function(_setPasswordButtonClick) _then;

/// Create a copy of ForgotPasswordEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? otp = null,Object? password = null,}) {
  return _then(_setPasswordButtonClick(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ForgotPasswordState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgotPasswordState()';
}


}

/// @nodoc
class $ForgotPasswordStateCopyWith<$Res>  {
$ForgotPasswordStateCopyWith(ForgotPasswordState _, $Res Function(ForgotPasswordState) __);
}


/// Adds pattern-matching-related methods to [ForgotPasswordState].
extension ForgotPasswordStatePatterns on ForgotPasswordState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _enterEmail value)?  enterEmail,TResult Function( _sentEmailOtpLoading value)?  sentEmailOtpLoading,TResult Function( __sentEmailOtpFailed value)?  sentEmailOtpFailed,TResult Function( _verifyOtp value)?  verifyOtp,TResult Function( _verifyOtpLoading value)?  verifyOtpLoading,TResult Function( _verifyOtpFailed value)?  verifyOtpFailed,TResult Function( _setPassword value)?  setPassword,TResult Function( _setPasswordLoading value)?  setPasswordLoading,TResult Function( _success value)?  success,TResult Function( _setPasswordfailed value)?  setPasswordfailed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _enterEmail() when enterEmail != null:
return enterEmail(_that);case _sentEmailOtpLoading() when sentEmailOtpLoading != null:
return sentEmailOtpLoading(_that);case __sentEmailOtpFailed() when sentEmailOtpFailed != null:
return sentEmailOtpFailed(_that);case _verifyOtp() when verifyOtp != null:
return verifyOtp(_that);case _verifyOtpLoading() when verifyOtpLoading != null:
return verifyOtpLoading(_that);case _verifyOtpFailed() when verifyOtpFailed != null:
return verifyOtpFailed(_that);case _setPassword() when setPassword != null:
return setPassword(_that);case _setPasswordLoading() when setPasswordLoading != null:
return setPasswordLoading(_that);case _success() when success != null:
return success(_that);case _setPasswordfailed() when setPasswordfailed != null:
return setPasswordfailed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _enterEmail value)  enterEmail,required TResult Function( _sentEmailOtpLoading value)  sentEmailOtpLoading,required TResult Function( __sentEmailOtpFailed value)  sentEmailOtpFailed,required TResult Function( _verifyOtp value)  verifyOtp,required TResult Function( _verifyOtpLoading value)  verifyOtpLoading,required TResult Function( _verifyOtpFailed value)  verifyOtpFailed,required TResult Function( _setPassword value)  setPassword,required TResult Function( _setPasswordLoading value)  setPasswordLoading,required TResult Function( _success value)  success,required TResult Function( _setPasswordfailed value)  setPasswordfailed,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _enterEmail():
return enterEmail(_that);case _sentEmailOtpLoading():
return sentEmailOtpLoading(_that);case __sentEmailOtpFailed():
return sentEmailOtpFailed(_that);case _verifyOtp():
return verifyOtp(_that);case _verifyOtpLoading():
return verifyOtpLoading(_that);case _verifyOtpFailed():
return verifyOtpFailed(_that);case _setPassword():
return setPassword(_that);case _setPasswordLoading():
return setPasswordLoading(_that);case _success():
return success(_that);case _setPasswordfailed():
return setPasswordfailed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _enterEmail value)?  enterEmail,TResult? Function( _sentEmailOtpLoading value)?  sentEmailOtpLoading,TResult? Function( __sentEmailOtpFailed value)?  sentEmailOtpFailed,TResult? Function( _verifyOtp value)?  verifyOtp,TResult? Function( _verifyOtpLoading value)?  verifyOtpLoading,TResult? Function( _verifyOtpFailed value)?  verifyOtpFailed,TResult? Function( _setPassword value)?  setPassword,TResult? Function( _setPasswordLoading value)?  setPasswordLoading,TResult? Function( _success value)?  success,TResult? Function( _setPasswordfailed value)?  setPasswordfailed,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _enterEmail() when enterEmail != null:
return enterEmail(_that);case _sentEmailOtpLoading() when sentEmailOtpLoading != null:
return sentEmailOtpLoading(_that);case __sentEmailOtpFailed() when sentEmailOtpFailed != null:
return sentEmailOtpFailed(_that);case _verifyOtp() when verifyOtp != null:
return verifyOtp(_that);case _verifyOtpLoading() when verifyOtpLoading != null:
return verifyOtpLoading(_that);case _verifyOtpFailed() when verifyOtpFailed != null:
return verifyOtpFailed(_that);case _setPassword() when setPassword != null:
return setPassword(_that);case _setPasswordLoading() when setPasswordLoading != null:
return setPasswordLoading(_that);case _success() when success != null:
return success(_that);case _setPasswordfailed() when setPasswordfailed != null:
return setPasswordfailed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  enterEmail,TResult Function()?  sentEmailOtpLoading,TResult Function( String message)?  sentEmailOtpFailed,TResult Function()?  verifyOtp,TResult Function()?  verifyOtpLoading,TResult Function( String message)?  verifyOtpFailed,TResult Function()?  setPassword,TResult Function()?  setPasswordLoading,TResult Function()?  success,TResult Function( String message)?  setPasswordfailed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _enterEmail() when enterEmail != null:
return enterEmail();case _sentEmailOtpLoading() when sentEmailOtpLoading != null:
return sentEmailOtpLoading();case __sentEmailOtpFailed() when sentEmailOtpFailed != null:
return sentEmailOtpFailed(_that.message);case _verifyOtp() when verifyOtp != null:
return verifyOtp();case _verifyOtpLoading() when verifyOtpLoading != null:
return verifyOtpLoading();case _verifyOtpFailed() when verifyOtpFailed != null:
return verifyOtpFailed(_that.message);case _setPassword() when setPassword != null:
return setPassword();case _setPasswordLoading() when setPasswordLoading != null:
return setPasswordLoading();case _success() when success != null:
return success();case _setPasswordfailed() when setPasswordfailed != null:
return setPasswordfailed(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  enterEmail,required TResult Function()  sentEmailOtpLoading,required TResult Function( String message)  sentEmailOtpFailed,required TResult Function()  verifyOtp,required TResult Function()  verifyOtpLoading,required TResult Function( String message)  verifyOtpFailed,required TResult Function()  setPassword,required TResult Function()  setPasswordLoading,required TResult Function()  success,required TResult Function( String message)  setPasswordfailed,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _enterEmail():
return enterEmail();case _sentEmailOtpLoading():
return sentEmailOtpLoading();case __sentEmailOtpFailed():
return sentEmailOtpFailed(_that.message);case _verifyOtp():
return verifyOtp();case _verifyOtpLoading():
return verifyOtpLoading();case _verifyOtpFailed():
return verifyOtpFailed(_that.message);case _setPassword():
return setPassword();case _setPasswordLoading():
return setPasswordLoading();case _success():
return success();case _setPasswordfailed():
return setPasswordfailed(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  enterEmail,TResult? Function()?  sentEmailOtpLoading,TResult? Function( String message)?  sentEmailOtpFailed,TResult? Function()?  verifyOtp,TResult? Function()?  verifyOtpLoading,TResult? Function( String message)?  verifyOtpFailed,TResult? Function()?  setPassword,TResult? Function()?  setPasswordLoading,TResult? Function()?  success,TResult? Function( String message)?  setPasswordfailed,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _enterEmail() when enterEmail != null:
return enterEmail();case _sentEmailOtpLoading() when sentEmailOtpLoading != null:
return sentEmailOtpLoading();case __sentEmailOtpFailed() when sentEmailOtpFailed != null:
return sentEmailOtpFailed(_that.message);case _verifyOtp() when verifyOtp != null:
return verifyOtp();case _verifyOtpLoading() when verifyOtpLoading != null:
return verifyOtpLoading();case _verifyOtpFailed() when verifyOtpFailed != null:
return verifyOtpFailed(_that.message);case _setPassword() when setPassword != null:
return setPassword();case _setPasswordLoading() when setPasswordLoading != null:
return setPasswordLoading();case _success() when success != null:
return success();case _setPasswordfailed() when setPasswordfailed != null:
return setPasswordfailed(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ForgotPasswordState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgotPasswordState.initial()';
}


}




/// @nodoc


class _enterEmail implements ForgotPasswordState {
  const _enterEmail();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _enterEmail);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgotPasswordState.enterEmail()';
}


}




/// @nodoc


class _sentEmailOtpLoading implements ForgotPasswordState {
  const _sentEmailOtpLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _sentEmailOtpLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgotPasswordState.sentEmailOtpLoading()';
}


}




/// @nodoc


class __sentEmailOtpFailed implements ForgotPasswordState {
  const __sentEmailOtpFailed(this.message);
  

 final  String message;

/// Create a copy of ForgotPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$_sentEmailOtpFailedCopyWith<__sentEmailOtpFailed> get copyWith => __$_sentEmailOtpFailedCopyWithImpl<__sentEmailOtpFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is __sentEmailOtpFailed&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ForgotPasswordState.sentEmailOtpFailed(message: $message)';
}


}

/// @nodoc
abstract mixin class _$_sentEmailOtpFailedCopyWith<$Res> implements $ForgotPasswordStateCopyWith<$Res> {
  factory _$_sentEmailOtpFailedCopyWith(__sentEmailOtpFailed value, $Res Function(__sentEmailOtpFailed) _then) = __$_sentEmailOtpFailedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$_sentEmailOtpFailedCopyWithImpl<$Res>
    implements _$_sentEmailOtpFailedCopyWith<$Res> {
  __$_sentEmailOtpFailedCopyWithImpl(this._self, this._then);

  final __sentEmailOtpFailed _self;
  final $Res Function(__sentEmailOtpFailed) _then;

/// Create a copy of ForgotPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(__sentEmailOtpFailed(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _verifyOtp implements ForgotPasswordState {
  const _verifyOtp();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _verifyOtp);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgotPasswordState.verifyOtp()';
}


}




/// @nodoc


class _verifyOtpLoading implements ForgotPasswordState {
  const _verifyOtpLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _verifyOtpLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgotPasswordState.verifyOtpLoading()';
}


}




/// @nodoc


class _verifyOtpFailed implements ForgotPasswordState {
  const _verifyOtpFailed(this.message);
  

 final  String message;

/// Create a copy of ForgotPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$verifyOtpFailedCopyWith<_verifyOtpFailed> get copyWith => __$verifyOtpFailedCopyWithImpl<_verifyOtpFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _verifyOtpFailed&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ForgotPasswordState.verifyOtpFailed(message: $message)';
}


}

/// @nodoc
abstract mixin class _$verifyOtpFailedCopyWith<$Res> implements $ForgotPasswordStateCopyWith<$Res> {
  factory _$verifyOtpFailedCopyWith(_verifyOtpFailed value, $Res Function(_verifyOtpFailed) _then) = __$verifyOtpFailedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$verifyOtpFailedCopyWithImpl<$Res>
    implements _$verifyOtpFailedCopyWith<$Res> {
  __$verifyOtpFailedCopyWithImpl(this._self, this._then);

  final _verifyOtpFailed _self;
  final $Res Function(_verifyOtpFailed) _then;

/// Create a copy of ForgotPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_verifyOtpFailed(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _setPassword implements ForgotPasswordState {
  const _setPassword();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _setPassword);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgotPasswordState.setPassword()';
}


}




/// @nodoc


class _setPasswordLoading implements ForgotPasswordState {
  const _setPasswordLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _setPasswordLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgotPasswordState.setPasswordLoading()';
}


}




/// @nodoc


class _success implements ForgotPasswordState {
  const _success();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _success);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgotPasswordState.success()';
}


}




/// @nodoc


class _setPasswordfailed implements ForgotPasswordState {
  const _setPasswordfailed({required this.message});
  

 final  String message;

/// Create a copy of ForgotPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$setPasswordfailedCopyWith<_setPasswordfailed> get copyWith => __$setPasswordfailedCopyWithImpl<_setPasswordfailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _setPasswordfailed&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ForgotPasswordState.setPasswordfailed(message: $message)';
}


}

/// @nodoc
abstract mixin class _$setPasswordfailedCopyWith<$Res> implements $ForgotPasswordStateCopyWith<$Res> {
  factory _$setPasswordfailedCopyWith(_setPasswordfailed value, $Res Function(_setPasswordfailed) _then) = __$setPasswordfailedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$setPasswordfailedCopyWithImpl<$Res>
    implements _$setPasswordfailedCopyWith<$Res> {
  __$setPasswordfailedCopyWithImpl(this._self, this._then);

  final _setPasswordfailed _self;
  final $Res Function(_setPasswordfailed) _then;

/// Create a copy of ForgotPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_setPasswordfailed(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
