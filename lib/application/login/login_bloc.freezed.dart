// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent()';
}


}

/// @nodoc
class $LoginEventCopyWith<$Res>  {
$LoginEventCopyWith(LoginEvent _, $Res Function(LoginEvent) __);
}


/// Adds pattern-matching-related methods to [LoginEvent].
extension LoginEventPatterns on LoginEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoginButtonClickEvent value)?  loginButtonClickEvent,TResult Function( _sendOtpButtonClick value)?  sendOtpButtonClick,TResult Function( _verifyAccountButtonClick value)?  verifyAccountButtonClick,TResult Function( _LogOutButtonClick value)?  logOutButtonClick,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginButtonClickEvent() when loginButtonClickEvent != null:
return loginButtonClickEvent(_that);case _sendOtpButtonClick() when sendOtpButtonClick != null:
return sendOtpButtonClick(_that);case _verifyAccountButtonClick() when verifyAccountButtonClick != null:
return verifyAccountButtonClick(_that);case _LogOutButtonClick() when logOutButtonClick != null:
return logOutButtonClick(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoginButtonClickEvent value)  loginButtonClickEvent,required TResult Function( _sendOtpButtonClick value)  sendOtpButtonClick,required TResult Function( _verifyAccountButtonClick value)  verifyAccountButtonClick,required TResult Function( _LogOutButtonClick value)  logOutButtonClick,}){
final _that = this;
switch (_that) {
case _LoginButtonClickEvent():
return loginButtonClickEvent(_that);case _sendOtpButtonClick():
return sendOtpButtonClick(_that);case _verifyAccountButtonClick():
return verifyAccountButtonClick(_that);case _LogOutButtonClick():
return logOutButtonClick(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoginButtonClickEvent value)?  loginButtonClickEvent,TResult? Function( _sendOtpButtonClick value)?  sendOtpButtonClick,TResult? Function( _verifyAccountButtonClick value)?  verifyAccountButtonClick,TResult? Function( _LogOutButtonClick value)?  logOutButtonClick,}){
final _that = this;
switch (_that) {
case _LoginButtonClickEvent() when loginButtonClickEvent != null:
return loginButtonClickEvent(_that);case _sendOtpButtonClick() when sendOtpButtonClick != null:
return sendOtpButtonClick(_that);case _verifyAccountButtonClick() when verifyAccountButtonClick != null:
return verifyAccountButtonClick(_that);case _LogOutButtonClick() when logOutButtonClick != null:
return logOutButtonClick(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String email,  String password)?  loginButtonClickEvent,TResult Function( String email)?  sendOtpButtonClick,TResult Function( String email,  String otp)?  verifyAccountButtonClick,TResult Function()?  logOutButtonClick,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginButtonClickEvent() when loginButtonClickEvent != null:
return loginButtonClickEvent(_that.email,_that.password);case _sendOtpButtonClick() when sendOtpButtonClick != null:
return sendOtpButtonClick(_that.email);case _verifyAccountButtonClick() when verifyAccountButtonClick != null:
return verifyAccountButtonClick(_that.email,_that.otp);case _LogOutButtonClick() when logOutButtonClick != null:
return logOutButtonClick();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String email,  String password)  loginButtonClickEvent,required TResult Function( String email)  sendOtpButtonClick,required TResult Function( String email,  String otp)  verifyAccountButtonClick,required TResult Function()  logOutButtonClick,}) {final _that = this;
switch (_that) {
case _LoginButtonClickEvent():
return loginButtonClickEvent(_that.email,_that.password);case _sendOtpButtonClick():
return sendOtpButtonClick(_that.email);case _verifyAccountButtonClick():
return verifyAccountButtonClick(_that.email,_that.otp);case _LogOutButtonClick():
return logOutButtonClick();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String email,  String password)?  loginButtonClickEvent,TResult? Function( String email)?  sendOtpButtonClick,TResult? Function( String email,  String otp)?  verifyAccountButtonClick,TResult? Function()?  logOutButtonClick,}) {final _that = this;
switch (_that) {
case _LoginButtonClickEvent() when loginButtonClickEvent != null:
return loginButtonClickEvent(_that.email,_that.password);case _sendOtpButtonClick() when sendOtpButtonClick != null:
return sendOtpButtonClick(_that.email);case _verifyAccountButtonClick() when verifyAccountButtonClick != null:
return verifyAccountButtonClick(_that.email,_that.otp);case _LogOutButtonClick() when logOutButtonClick != null:
return logOutButtonClick();case _:
  return null;

}
}

}

/// @nodoc


class _LoginButtonClickEvent implements LoginEvent {
  const _LoginButtonClickEvent({required this.email, required this.password});
  

 final  String email;
 final  String password;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginButtonClickEventCopyWith<_LoginButtonClickEvent> get copyWith => __$LoginButtonClickEventCopyWithImpl<_LoginButtonClickEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginButtonClickEvent&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'LoginEvent.loginButtonClickEvent(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$LoginButtonClickEventCopyWith<$Res> implements $LoginEventCopyWith<$Res> {
  factory _$LoginButtonClickEventCopyWith(_LoginButtonClickEvent value, $Res Function(_LoginButtonClickEvent) _then) = __$LoginButtonClickEventCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class __$LoginButtonClickEventCopyWithImpl<$Res>
    implements _$LoginButtonClickEventCopyWith<$Res> {
  __$LoginButtonClickEventCopyWithImpl(this._self, this._then);

  final _LoginButtonClickEvent _self;
  final $Res Function(_LoginButtonClickEvent) _then;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(_LoginButtonClickEvent(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _sendOtpButtonClick implements LoginEvent {
  const _sendOtpButtonClick({required this.email});
  

 final  String email;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$sendOtpButtonClickCopyWith<_sendOtpButtonClick> get copyWith => __$sendOtpButtonClickCopyWithImpl<_sendOtpButtonClick>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _sendOtpButtonClick&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'LoginEvent.sendOtpButtonClick(email: $email)';
}


}

/// @nodoc
abstract mixin class _$sendOtpButtonClickCopyWith<$Res> implements $LoginEventCopyWith<$Res> {
  factory _$sendOtpButtonClickCopyWith(_sendOtpButtonClick value, $Res Function(_sendOtpButtonClick) _then) = __$sendOtpButtonClickCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class __$sendOtpButtonClickCopyWithImpl<$Res>
    implements _$sendOtpButtonClickCopyWith<$Res> {
  __$sendOtpButtonClickCopyWithImpl(this._self, this._then);

  final _sendOtpButtonClick _self;
  final $Res Function(_sendOtpButtonClick) _then;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_sendOtpButtonClick(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _verifyAccountButtonClick implements LoginEvent {
  const _verifyAccountButtonClick({required this.email, required this.otp});
  

 final  String email;
 final  String otp;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$verifyAccountButtonClickCopyWith<_verifyAccountButtonClick> get copyWith => __$verifyAccountButtonClickCopyWithImpl<_verifyAccountButtonClick>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _verifyAccountButtonClick&&(identical(other.email, email) || other.email == email)&&(identical(other.otp, otp) || other.otp == otp));
}


@override
int get hashCode => Object.hash(runtimeType,email,otp);

@override
String toString() {
  return 'LoginEvent.verifyAccountButtonClick(email: $email, otp: $otp)';
}


}

/// @nodoc
abstract mixin class _$verifyAccountButtonClickCopyWith<$Res> implements $LoginEventCopyWith<$Res> {
  factory _$verifyAccountButtonClickCopyWith(_verifyAccountButtonClick value, $Res Function(_verifyAccountButtonClick) _then) = __$verifyAccountButtonClickCopyWithImpl;
@useResult
$Res call({
 String email, String otp
});




}
/// @nodoc
class __$verifyAccountButtonClickCopyWithImpl<$Res>
    implements _$verifyAccountButtonClickCopyWith<$Res> {
  __$verifyAccountButtonClickCopyWithImpl(this._self, this._then);

  final _verifyAccountButtonClick _self;
  final $Res Function(_verifyAccountButtonClick) _then;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? otp = null,}) {
  return _then(_verifyAccountButtonClick(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _LogOutButtonClick implements LoginEvent {
  const _LogOutButtonClick();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogOutButtonClick);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent.logOutButtonClick()';
}


}




/// @nodoc
mixin _$LoginState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState()';
}


}

/// @nodoc
class $LoginStateCopyWith<$Res>  {
$LoginStateCopyWith(LoginState _, $Res Function(LoginState) __);
}


/// Adds pattern-matching-related methods to [LoginState].
extension LoginStatePatterns on LoginState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _notverified value)?  notverified,TResult Function( _verifyOtpSentLoading value)?  verifyOtpSentLoading,TResult Function( _verifyOtpSentSuccess value)?  verifyOtpSentSuccess,TResult Function( _verifyOtpSendFailed value)?  verifyOtpSendFailed,TResult Function( _verifyingAccount value)?  verifyingAccount,TResult Function( _Success value)?  success,TResult Function( _Failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _notverified() when notverified != null:
return notverified(_that);case _verifyOtpSentLoading() when verifyOtpSentLoading != null:
return verifyOtpSentLoading(_that);case _verifyOtpSentSuccess() when verifyOtpSentSuccess != null:
return verifyOtpSentSuccess(_that);case _verifyOtpSendFailed() when verifyOtpSendFailed != null:
return verifyOtpSendFailed(_that);case _verifyingAccount() when verifyingAccount != null:
return verifyingAccount(_that);case _Success() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _notverified value)  notverified,required TResult Function( _verifyOtpSentLoading value)  verifyOtpSentLoading,required TResult Function( _verifyOtpSentSuccess value)  verifyOtpSentSuccess,required TResult Function( _verifyOtpSendFailed value)  verifyOtpSendFailed,required TResult Function( _verifyingAccount value)  verifyingAccount,required TResult Function( _Success value)  success,required TResult Function( _Failure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _notverified():
return notverified(_that);case _verifyOtpSentLoading():
return verifyOtpSentLoading(_that);case _verifyOtpSentSuccess():
return verifyOtpSentSuccess(_that);case _verifyOtpSendFailed():
return verifyOtpSendFailed(_that);case _verifyingAccount():
return verifyingAccount(_that);case _Success():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _notverified value)?  notverified,TResult? Function( _verifyOtpSentLoading value)?  verifyOtpSentLoading,TResult? Function( _verifyOtpSentSuccess value)?  verifyOtpSentSuccess,TResult? Function( _verifyOtpSendFailed value)?  verifyOtpSendFailed,TResult? Function( _verifyingAccount value)?  verifyingAccount,TResult? Function( _Success value)?  success,TResult? Function( _Failure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _notverified() when notverified != null:
return notverified(_that);case _verifyOtpSentLoading() when verifyOtpSentLoading != null:
return verifyOtpSentLoading(_that);case _verifyOtpSentSuccess() when verifyOtpSentSuccess != null:
return verifyOtpSentSuccess(_that);case _verifyOtpSendFailed() when verifyOtpSendFailed != null:
return verifyOtpSendFailed(_that);case _verifyingAccount() when verifyingAccount != null:
return verifyingAccount(_that);case _Success() when success != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( UserDetails user)?  notverified,TResult Function()?  verifyOtpSentLoading,TResult Function( String email)?  verifyOtpSentSuccess,TResult Function( String message)?  verifyOtpSendFailed,TResult Function()?  verifyingAccount,TResult Function( AuthTokens tokens)?  success,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _notverified() when notverified != null:
return notverified(_that.user);case _verifyOtpSentLoading() when verifyOtpSentLoading != null:
return verifyOtpSentLoading();case _verifyOtpSentSuccess() when verifyOtpSentSuccess != null:
return verifyOtpSentSuccess(_that.email);case _verifyOtpSendFailed() when verifyOtpSendFailed != null:
return verifyOtpSendFailed(_that.message);case _verifyingAccount() when verifyingAccount != null:
return verifyingAccount();case _Success() when success != null:
return success(_that.tokens);case _Failure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( UserDetails user)  notverified,required TResult Function()  verifyOtpSentLoading,required TResult Function( String email)  verifyOtpSentSuccess,required TResult Function( String message)  verifyOtpSendFailed,required TResult Function()  verifyingAccount,required TResult Function( AuthTokens tokens)  success,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _notverified():
return notverified(_that.user);case _verifyOtpSentLoading():
return verifyOtpSentLoading();case _verifyOtpSentSuccess():
return verifyOtpSentSuccess(_that.email);case _verifyOtpSendFailed():
return verifyOtpSendFailed(_that.message);case _verifyingAccount():
return verifyingAccount();case _Success():
return success(_that.tokens);case _Failure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( UserDetails user)?  notverified,TResult? Function()?  verifyOtpSentLoading,TResult? Function( String email)?  verifyOtpSentSuccess,TResult? Function( String message)?  verifyOtpSendFailed,TResult? Function()?  verifyingAccount,TResult? Function( AuthTokens tokens)?  success,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _notverified() when notverified != null:
return notverified(_that.user);case _verifyOtpSentLoading() when verifyOtpSentLoading != null:
return verifyOtpSentLoading();case _verifyOtpSentSuccess() when verifyOtpSentSuccess != null:
return verifyOtpSentSuccess(_that.email);case _verifyOtpSendFailed() when verifyOtpSendFailed != null:
return verifyOtpSendFailed(_that.message);case _verifyingAccount() when verifyingAccount != null:
return verifyingAccount();case _Success() when success != null:
return success(_that.tokens);case _Failure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements LoginState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.initial()';
}


}




/// @nodoc


class _Loading implements LoginState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.loading()';
}


}




/// @nodoc


class _notverified implements LoginState {
  const _notverified({required this.user});
  

 final  UserDetails user;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$notverifiedCopyWith<_notverified> get copyWith => __$notverifiedCopyWithImpl<_notverified>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _notverified&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'LoginState.notverified(user: $user)';
}


}

/// @nodoc
abstract mixin class _$notverifiedCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$notverifiedCopyWith(_notverified value, $Res Function(_notverified) _then) = __$notverifiedCopyWithImpl;
@useResult
$Res call({
 UserDetails user
});




}
/// @nodoc
class __$notverifiedCopyWithImpl<$Res>
    implements _$notverifiedCopyWith<$Res> {
  __$notverifiedCopyWithImpl(this._self, this._then);

  final _notverified _self;
  final $Res Function(_notverified) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_notverified(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserDetails,
  ));
}


}

/// @nodoc


class _verifyOtpSentLoading implements LoginState {
  const _verifyOtpSentLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _verifyOtpSentLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.verifyOtpSentLoading()';
}


}




/// @nodoc


class _verifyOtpSentSuccess implements LoginState {
  const _verifyOtpSentSuccess({required this.email});
  

 final  String email;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$verifyOtpSentSuccessCopyWith<_verifyOtpSentSuccess> get copyWith => __$verifyOtpSentSuccessCopyWithImpl<_verifyOtpSentSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _verifyOtpSentSuccess&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'LoginState.verifyOtpSentSuccess(email: $email)';
}


}

/// @nodoc
abstract mixin class _$verifyOtpSentSuccessCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$verifyOtpSentSuccessCopyWith(_verifyOtpSentSuccess value, $Res Function(_verifyOtpSentSuccess) _then) = __$verifyOtpSentSuccessCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class __$verifyOtpSentSuccessCopyWithImpl<$Res>
    implements _$verifyOtpSentSuccessCopyWith<$Res> {
  __$verifyOtpSentSuccessCopyWithImpl(this._self, this._then);

  final _verifyOtpSentSuccess _self;
  final $Res Function(_verifyOtpSentSuccess) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_verifyOtpSentSuccess(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _verifyOtpSendFailed implements LoginState {
  const _verifyOtpSendFailed(this.message);
  

 final  String message;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$verifyOtpSendFailedCopyWith<_verifyOtpSendFailed> get copyWith => __$verifyOtpSendFailedCopyWithImpl<_verifyOtpSendFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _verifyOtpSendFailed&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LoginState.verifyOtpSendFailed(message: $message)';
}


}

/// @nodoc
abstract mixin class _$verifyOtpSendFailedCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$verifyOtpSendFailedCopyWith(_verifyOtpSendFailed value, $Res Function(_verifyOtpSendFailed) _then) = __$verifyOtpSendFailedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$verifyOtpSendFailedCopyWithImpl<$Res>
    implements _$verifyOtpSendFailedCopyWith<$Res> {
  __$verifyOtpSendFailedCopyWithImpl(this._self, this._then);

  final _verifyOtpSendFailed _self;
  final $Res Function(_verifyOtpSendFailed) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_verifyOtpSendFailed(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _verifyingAccount implements LoginState {
  const _verifyingAccount();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _verifyingAccount);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.verifyingAccount()';
}


}




/// @nodoc


class _Success implements LoginState {
  const _Success(this.tokens);
  

 final  AuthTokens tokens;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.tokens, tokens) || other.tokens == tokens));
}


@override
int get hashCode => Object.hash(runtimeType,tokens);

@override
String toString() {
  return 'LoginState.success(tokens: $tokens)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 AuthTokens tokens
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tokens = null,}) {
  return _then(_Success(
null == tokens ? _self.tokens : tokens // ignore: cast_nullable_to_non_nullable
as AuthTokens,
  ));
}


}

/// @nodoc


class _Failure implements LoginState {
  const _Failure(this.message);
  

 final  String message;

/// Create a copy of LoginState
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
  return 'LoginState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
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

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Failure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
