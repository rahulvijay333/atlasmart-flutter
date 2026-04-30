// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_register_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CustomerRegisterEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerRegisterEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CustomerRegisterEvent()';
}


}

/// @nodoc
class $CustomerRegisterEventCopyWith<$Res>  {
$CustomerRegisterEventCopyWith(CustomerRegisterEvent _, $Res Function(CustomerRegisterEvent) __);
}


/// Adds pattern-matching-related methods to [CustomerRegisterEvent].
extension CustomerRegisterEventPatterns on CustomerRegisterEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _initial value)?  initial,TResult Function( _CreateAccount value)?  createAccount,TResult Function( _VerifyOtpButtonClick value)?  verifyOtpButtonClick,TResult Function( _SendOtp value)?  sendOtp,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _initial() when initial != null:
return initial(_that);case _CreateAccount() when createAccount != null:
return createAccount(_that);case _VerifyOtpButtonClick() when verifyOtpButtonClick != null:
return verifyOtpButtonClick(_that);case _SendOtp() when sendOtp != null:
return sendOtp(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _initial value)  initial,required TResult Function( _CreateAccount value)  createAccount,required TResult Function( _VerifyOtpButtonClick value)  verifyOtpButtonClick,required TResult Function( _SendOtp value)  sendOtp,}){
final _that = this;
switch (_that) {
case _initial():
return initial(_that);case _CreateAccount():
return createAccount(_that);case _VerifyOtpButtonClick():
return verifyOtpButtonClick(_that);case _SendOtp():
return sendOtp(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _initial value)?  initial,TResult? Function( _CreateAccount value)?  createAccount,TResult? Function( _VerifyOtpButtonClick value)?  verifyOtpButtonClick,TResult? Function( _SendOtp value)?  sendOtp,}){
final _that = this;
switch (_that) {
case _initial() when initial != null:
return initial(_that);case _CreateAccount() when createAccount != null:
return createAccount(_that);case _VerifyOtpButtonClick() when verifyOtpButtonClick != null:
return verifyOtpButtonClick(_that);case _SendOtp() when sendOtp != null:
return sendOtp(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( CustomerRegisterModel customer)?  createAccount,TResult Function( CustomerRegisterModel customer)?  verifyOtpButtonClick,TResult Function( CustomerRegisterModel customer,  bool resendOtp)?  sendOtp,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _initial() when initial != null:
return initial();case _CreateAccount() when createAccount != null:
return createAccount(_that.customer);case _VerifyOtpButtonClick() when verifyOtpButtonClick != null:
return verifyOtpButtonClick(_that.customer);case _SendOtp() when sendOtp != null:
return sendOtp(_that.customer,_that.resendOtp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( CustomerRegisterModel customer)  createAccount,required TResult Function( CustomerRegisterModel customer)  verifyOtpButtonClick,required TResult Function( CustomerRegisterModel customer,  bool resendOtp)  sendOtp,}) {final _that = this;
switch (_that) {
case _initial():
return initial();case _CreateAccount():
return createAccount(_that.customer);case _VerifyOtpButtonClick():
return verifyOtpButtonClick(_that.customer);case _SendOtp():
return sendOtp(_that.customer,_that.resendOtp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( CustomerRegisterModel customer)?  createAccount,TResult? Function( CustomerRegisterModel customer)?  verifyOtpButtonClick,TResult? Function( CustomerRegisterModel customer,  bool resendOtp)?  sendOtp,}) {final _that = this;
switch (_that) {
case _initial() when initial != null:
return initial();case _CreateAccount() when createAccount != null:
return createAccount(_that.customer);case _VerifyOtpButtonClick() when verifyOtpButtonClick != null:
return verifyOtpButtonClick(_that.customer);case _SendOtp() when sendOtp != null:
return sendOtp(_that.customer,_that.resendOtp);case _:
  return null;

}
}

}

/// @nodoc


class _initial implements CustomerRegisterEvent {
  const _initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CustomerRegisterEvent.initial()';
}


}




/// @nodoc


class _CreateAccount implements CustomerRegisterEvent {
  const _CreateAccount({required this.customer});
  

 final  CustomerRegisterModel customer;

/// Create a copy of CustomerRegisterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateAccountCopyWith<_CreateAccount> get copyWith => __$CreateAccountCopyWithImpl<_CreateAccount>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateAccount&&(identical(other.customer, customer) || other.customer == customer));
}


@override
int get hashCode => Object.hash(runtimeType,customer);

@override
String toString() {
  return 'CustomerRegisterEvent.createAccount(customer: $customer)';
}


}

/// @nodoc
abstract mixin class _$CreateAccountCopyWith<$Res> implements $CustomerRegisterEventCopyWith<$Res> {
  factory _$CreateAccountCopyWith(_CreateAccount value, $Res Function(_CreateAccount) _then) = __$CreateAccountCopyWithImpl;
@useResult
$Res call({
 CustomerRegisterModel customer
});




}
/// @nodoc
class __$CreateAccountCopyWithImpl<$Res>
    implements _$CreateAccountCopyWith<$Res> {
  __$CreateAccountCopyWithImpl(this._self, this._then);

  final _CreateAccount _self;
  final $Res Function(_CreateAccount) _then;

/// Create a copy of CustomerRegisterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? customer = null,}) {
  return _then(_CreateAccount(
customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as CustomerRegisterModel,
  ));
}


}

/// @nodoc


class _VerifyOtpButtonClick implements CustomerRegisterEvent {
  const _VerifyOtpButtonClick({required this.customer});
  

 final  CustomerRegisterModel customer;

/// Create a copy of CustomerRegisterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyOtpButtonClickCopyWith<_VerifyOtpButtonClick> get copyWith => __$VerifyOtpButtonClickCopyWithImpl<_VerifyOtpButtonClick>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyOtpButtonClick&&(identical(other.customer, customer) || other.customer == customer));
}


@override
int get hashCode => Object.hash(runtimeType,customer);

@override
String toString() {
  return 'CustomerRegisterEvent.verifyOtpButtonClick(customer: $customer)';
}


}

/// @nodoc
abstract mixin class _$VerifyOtpButtonClickCopyWith<$Res> implements $CustomerRegisterEventCopyWith<$Res> {
  factory _$VerifyOtpButtonClickCopyWith(_VerifyOtpButtonClick value, $Res Function(_VerifyOtpButtonClick) _then) = __$VerifyOtpButtonClickCopyWithImpl;
@useResult
$Res call({
 CustomerRegisterModel customer
});




}
/// @nodoc
class __$VerifyOtpButtonClickCopyWithImpl<$Res>
    implements _$VerifyOtpButtonClickCopyWith<$Res> {
  __$VerifyOtpButtonClickCopyWithImpl(this._self, this._then);

  final _VerifyOtpButtonClick _self;
  final $Res Function(_VerifyOtpButtonClick) _then;

/// Create a copy of CustomerRegisterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? customer = null,}) {
  return _then(_VerifyOtpButtonClick(
customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as CustomerRegisterModel,
  ));
}


}

/// @nodoc


class _SendOtp implements CustomerRegisterEvent {
  const _SendOtp({required this.customer, required this.resendOtp});
  

 final  CustomerRegisterModel customer;
 final  bool resendOtp;

/// Create a copy of CustomerRegisterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendOtpCopyWith<_SendOtp> get copyWith => __$SendOtpCopyWithImpl<_SendOtp>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendOtp&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.resendOtp, resendOtp) || other.resendOtp == resendOtp));
}


@override
int get hashCode => Object.hash(runtimeType,customer,resendOtp);

@override
String toString() {
  return 'CustomerRegisterEvent.sendOtp(customer: $customer, resendOtp: $resendOtp)';
}


}

/// @nodoc
abstract mixin class _$SendOtpCopyWith<$Res> implements $CustomerRegisterEventCopyWith<$Res> {
  factory _$SendOtpCopyWith(_SendOtp value, $Res Function(_SendOtp) _then) = __$SendOtpCopyWithImpl;
@useResult
$Res call({
 CustomerRegisterModel customer, bool resendOtp
});




}
/// @nodoc
class __$SendOtpCopyWithImpl<$Res>
    implements _$SendOtpCopyWith<$Res> {
  __$SendOtpCopyWithImpl(this._self, this._then);

  final _SendOtp _self;
  final $Res Function(_SendOtp) _then;

/// Create a copy of CustomerRegisterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? customer = null,Object? resendOtp = null,}) {
  return _then(_SendOtp(
customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as CustomerRegisterModel,resendOtp: null == resendOtp ? _self.resendOtp : resendOtp // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$CustomerRegisterState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerRegisterState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CustomerRegisterState()';
}


}

/// @nodoc
class $CustomerRegisterStateCopyWith<$Res>  {
$CustomerRegisterStateCopyWith(CustomerRegisterState _, $Res Function(CustomerRegisterState) __);
}


/// Adds pattern-matching-related methods to [CustomerRegisterState].
extension CustomerRegisterStatePatterns on CustomerRegisterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _loading value)?  loading,TResult Function( _sendOtp value)?  sendOtp,TResult Function( _sendOtpLoading value)?  sendOtpLoading,TResult Function( _sendOtpFailed value)?  sendOtpFailed,TResult Function( _verifyOtp value)?  verifyOtp,TResult Function( _verifyOtpLoading value)?  verifyOtpLoading,TResult Function( _success value)?  success,TResult Function( _failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _loading() when loading != null:
return loading(_that);case _sendOtp() when sendOtp != null:
return sendOtp(_that);case _sendOtpLoading() when sendOtpLoading != null:
return sendOtpLoading(_that);case _sendOtpFailed() when sendOtpFailed != null:
return sendOtpFailed(_that);case _verifyOtp() when verifyOtp != null:
return verifyOtp(_that);case _verifyOtpLoading() when verifyOtpLoading != null:
return verifyOtpLoading(_that);case _success() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _loading value)  loading,required TResult Function( _sendOtp value)  sendOtp,required TResult Function( _sendOtpLoading value)  sendOtpLoading,required TResult Function( _sendOtpFailed value)  sendOtpFailed,required TResult Function( _verifyOtp value)  verifyOtp,required TResult Function( _verifyOtpLoading value)  verifyOtpLoading,required TResult Function( _success value)  success,required TResult Function( _failure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _loading():
return loading(_that);case _sendOtp():
return sendOtp(_that);case _sendOtpLoading():
return sendOtpLoading(_that);case _sendOtpFailed():
return sendOtpFailed(_that);case _verifyOtp():
return verifyOtp(_that);case _verifyOtpLoading():
return verifyOtpLoading(_that);case _success():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _loading value)?  loading,TResult? Function( _sendOtp value)?  sendOtp,TResult? Function( _sendOtpLoading value)?  sendOtpLoading,TResult? Function( _sendOtpFailed value)?  sendOtpFailed,TResult? Function( _verifyOtp value)?  verifyOtp,TResult? Function( _verifyOtpLoading value)?  verifyOtpLoading,TResult? Function( _success value)?  success,TResult? Function( _failure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _loading() when loading != null:
return loading(_that);case _sendOtp() when sendOtp != null:
return sendOtp(_that);case _sendOtpLoading() when sendOtpLoading != null:
return sendOtpLoading(_that);case _sendOtpFailed() when sendOtpFailed != null:
return sendOtpFailed(_that);case _verifyOtp() when verifyOtp != null:
return verifyOtp(_that);case _verifyOtpLoading() when verifyOtpLoading != null:
return verifyOtpLoading(_that);case _success() when success != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( CustomerRegisterModel customer)?  sendOtp,TResult Function()?  sendOtpLoading,TResult Function( String message,  CustomerRegisterModel customer)?  sendOtpFailed,TResult Function( CustomerRegisterModel customer)?  verifyOtp,TResult Function()?  verifyOtpLoading,TResult Function()?  success,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _loading() when loading != null:
return loading();case _sendOtp() when sendOtp != null:
return sendOtp(_that.customer);case _sendOtpLoading() when sendOtpLoading != null:
return sendOtpLoading();case _sendOtpFailed() when sendOtpFailed != null:
return sendOtpFailed(_that.message,_that.customer);case _verifyOtp() when verifyOtp != null:
return verifyOtp(_that.customer);case _verifyOtpLoading() when verifyOtpLoading != null:
return verifyOtpLoading();case _success() when success != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( CustomerRegisterModel customer)  sendOtp,required TResult Function()  sendOtpLoading,required TResult Function( String message,  CustomerRegisterModel customer)  sendOtpFailed,required TResult Function( CustomerRegisterModel customer)  verifyOtp,required TResult Function()  verifyOtpLoading,required TResult Function()  success,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _loading():
return loading();case _sendOtp():
return sendOtp(_that.customer);case _sendOtpLoading():
return sendOtpLoading();case _sendOtpFailed():
return sendOtpFailed(_that.message,_that.customer);case _verifyOtp():
return verifyOtp(_that.customer);case _verifyOtpLoading():
return verifyOtpLoading();case _success():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( CustomerRegisterModel customer)?  sendOtp,TResult? Function()?  sendOtpLoading,TResult? Function( String message,  CustomerRegisterModel customer)?  sendOtpFailed,TResult? Function( CustomerRegisterModel customer)?  verifyOtp,TResult? Function()?  verifyOtpLoading,TResult? Function()?  success,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _loading() when loading != null:
return loading();case _sendOtp() when sendOtp != null:
return sendOtp(_that.customer);case _sendOtpLoading() when sendOtpLoading != null:
return sendOtpLoading();case _sendOtpFailed() when sendOtpFailed != null:
return sendOtpFailed(_that.message,_that.customer);case _verifyOtp() when verifyOtp != null:
return verifyOtp(_that.customer);case _verifyOtpLoading() when verifyOtpLoading != null:
return verifyOtpLoading();case _success() when success != null:
return success();case _failure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CustomerRegisterState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CustomerRegisterState.initial()';
}


}




/// @nodoc


class _loading implements CustomerRegisterState {
  const _loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CustomerRegisterState.loading()';
}


}




/// @nodoc


class _sendOtp implements CustomerRegisterState {
  const _sendOtp({required this.customer});
  

 final  CustomerRegisterModel customer;

/// Create a copy of CustomerRegisterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$sendOtpCopyWith<_sendOtp> get copyWith => __$sendOtpCopyWithImpl<_sendOtp>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _sendOtp&&(identical(other.customer, customer) || other.customer == customer));
}


@override
int get hashCode => Object.hash(runtimeType,customer);

@override
String toString() {
  return 'CustomerRegisterState.sendOtp(customer: $customer)';
}


}

/// @nodoc
abstract mixin class _$sendOtpCopyWith<$Res> implements $CustomerRegisterStateCopyWith<$Res> {
  factory _$sendOtpCopyWith(_sendOtp value, $Res Function(_sendOtp) _then) = __$sendOtpCopyWithImpl;
@useResult
$Res call({
 CustomerRegisterModel customer
});




}
/// @nodoc
class __$sendOtpCopyWithImpl<$Res>
    implements _$sendOtpCopyWith<$Res> {
  __$sendOtpCopyWithImpl(this._self, this._then);

  final _sendOtp _self;
  final $Res Function(_sendOtp) _then;

/// Create a copy of CustomerRegisterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? customer = null,}) {
  return _then(_sendOtp(
customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as CustomerRegisterModel,
  ));
}


}

/// @nodoc


class _sendOtpLoading implements CustomerRegisterState {
  const _sendOtpLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _sendOtpLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CustomerRegisterState.sendOtpLoading()';
}


}




/// @nodoc


class _sendOtpFailed implements CustomerRegisterState {
  const _sendOtpFailed({required this.message, required this.customer});
  

 final  String message;
 final  CustomerRegisterModel customer;

/// Create a copy of CustomerRegisterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$sendOtpFailedCopyWith<_sendOtpFailed> get copyWith => __$sendOtpFailedCopyWithImpl<_sendOtpFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _sendOtpFailed&&(identical(other.message, message) || other.message == message)&&(identical(other.customer, customer) || other.customer == customer));
}


@override
int get hashCode => Object.hash(runtimeType,message,customer);

@override
String toString() {
  return 'CustomerRegisterState.sendOtpFailed(message: $message, customer: $customer)';
}


}

/// @nodoc
abstract mixin class _$sendOtpFailedCopyWith<$Res> implements $CustomerRegisterStateCopyWith<$Res> {
  factory _$sendOtpFailedCopyWith(_sendOtpFailed value, $Res Function(_sendOtpFailed) _then) = __$sendOtpFailedCopyWithImpl;
@useResult
$Res call({
 String message, CustomerRegisterModel customer
});




}
/// @nodoc
class __$sendOtpFailedCopyWithImpl<$Res>
    implements _$sendOtpFailedCopyWith<$Res> {
  __$sendOtpFailedCopyWithImpl(this._self, this._then);

  final _sendOtpFailed _self;
  final $Res Function(_sendOtpFailed) _then;

/// Create a copy of CustomerRegisterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? customer = null,}) {
  return _then(_sendOtpFailed(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as CustomerRegisterModel,
  ));
}


}

/// @nodoc


class _verifyOtp implements CustomerRegisterState {
  const _verifyOtp({required this.customer});
  

 final  CustomerRegisterModel customer;

/// Create a copy of CustomerRegisterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$verifyOtpCopyWith<_verifyOtp> get copyWith => __$verifyOtpCopyWithImpl<_verifyOtp>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _verifyOtp&&(identical(other.customer, customer) || other.customer == customer));
}


@override
int get hashCode => Object.hash(runtimeType,customer);

@override
String toString() {
  return 'CustomerRegisterState.verifyOtp(customer: $customer)';
}


}

/// @nodoc
abstract mixin class _$verifyOtpCopyWith<$Res> implements $CustomerRegisterStateCopyWith<$Res> {
  factory _$verifyOtpCopyWith(_verifyOtp value, $Res Function(_verifyOtp) _then) = __$verifyOtpCopyWithImpl;
@useResult
$Res call({
 CustomerRegisterModel customer
});




}
/// @nodoc
class __$verifyOtpCopyWithImpl<$Res>
    implements _$verifyOtpCopyWith<$Res> {
  __$verifyOtpCopyWithImpl(this._self, this._then);

  final _verifyOtp _self;
  final $Res Function(_verifyOtp) _then;

/// Create a copy of CustomerRegisterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? customer = null,}) {
  return _then(_verifyOtp(
customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as CustomerRegisterModel,
  ));
}


}

/// @nodoc


class _verifyOtpLoading implements CustomerRegisterState {
  const _verifyOtpLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _verifyOtpLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CustomerRegisterState.verifyOtpLoading()';
}


}




/// @nodoc


class _success implements CustomerRegisterState {
  const _success();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _success);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CustomerRegisterState.success()';
}


}




/// @nodoc


class _failure implements CustomerRegisterState {
  const _failure({required this.message});
  

 final  String message;

/// Create a copy of CustomerRegisterState
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
  return 'CustomerRegisterState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$failureCopyWith<$Res> implements $CustomerRegisterStateCopyWith<$Res> {
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

/// Create a copy of CustomerRegisterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_failure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
