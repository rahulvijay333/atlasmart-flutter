// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InventoryEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InventoryEvent()';
}


}

/// @nodoc
class $InventoryEventCopyWith<$Res>  {
$InventoryEventCopyWith(InventoryEvent _, $Res Function(InventoryEvent) __);
}


/// Adds pattern-matching-related methods to [InventoryEvent].
extension InventoryEventPatterns on InventoryEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadInventory value)?  loadInventory,TResult Function( _UpdateStock value)?  updateStock,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadInventory() when loadInventory != null:
return loadInventory(_that);case _UpdateStock() when updateStock != null:
return updateStock(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadInventory value)  loadInventory,required TResult Function( _UpdateStock value)  updateStock,}){
final _that = this;
switch (_that) {
case _LoadInventory():
return loadInventory(_that);case _UpdateStock():
return updateStock(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadInventory value)?  loadInventory,TResult? Function( _UpdateStock value)?  updateStock,}){
final _that = this;
switch (_that) {
case _LoadInventory() when loadInventory != null:
return loadInventory(_that);case _UpdateStock() when updateStock != null:
return updateStock(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadInventory,TResult Function( AdminProductsModel product)?  updateStock,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadInventory() when loadInventory != null:
return loadInventory();case _UpdateStock() when updateStock != null:
return updateStock(_that.product);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadInventory,required TResult Function( AdminProductsModel product)  updateStock,}) {final _that = this;
switch (_that) {
case _LoadInventory():
return loadInventory();case _UpdateStock():
return updateStock(_that.product);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadInventory,TResult? Function( AdminProductsModel product)?  updateStock,}) {final _that = this;
switch (_that) {
case _LoadInventory() when loadInventory != null:
return loadInventory();case _UpdateStock() when updateStock != null:
return updateStock(_that.product);case _:
  return null;

}
}

}

/// @nodoc


class _LoadInventory implements InventoryEvent {
  const _LoadInventory();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadInventory);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InventoryEvent.loadInventory()';
}


}




/// @nodoc


class _UpdateStock implements InventoryEvent {
  const _UpdateStock({required this.product});
  

 final  AdminProductsModel product;

/// Create a copy of InventoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateStockCopyWith<_UpdateStock> get copyWith => __$UpdateStockCopyWithImpl<_UpdateStock>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateStock&&(identical(other.product, product) || other.product == product));
}


@override
int get hashCode => Object.hash(runtimeType,product);

@override
String toString() {
  return 'InventoryEvent.updateStock(product: $product)';
}


}

/// @nodoc
abstract mixin class _$UpdateStockCopyWith<$Res> implements $InventoryEventCopyWith<$Res> {
  factory _$UpdateStockCopyWith(_UpdateStock value, $Res Function(_UpdateStock) _then) = __$UpdateStockCopyWithImpl;
@useResult
$Res call({
 AdminProductsModel product
});




}
/// @nodoc
class __$UpdateStockCopyWithImpl<$Res>
    implements _$UpdateStockCopyWith<$Res> {
  __$UpdateStockCopyWithImpl(this._self, this._then);

  final _UpdateStock _self;
  final $Res Function(_UpdateStock) _then;

/// Create a copy of InventoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? product = null,}) {
  return _then(_UpdateStock(
product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as AdminProductsModel,
  ));
}


}

/// @nodoc
mixin _$InventoryState {

 List<AdminProductsModel> get products; bool get isLoading; bool get isUpdating; bool get updateSuccess; String? get errorMessage; String? get updateErrorMessage;
/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventoryStateCopyWith<InventoryState> get copyWith => _$InventoryStateCopyWithImpl<InventoryState>(this as InventoryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryState&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isUpdating, isUpdating) || other.isUpdating == isUpdating)&&(identical(other.updateSuccess, updateSuccess) || other.updateSuccess == updateSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.updateErrorMessage, updateErrorMessage) || other.updateErrorMessage == updateErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(products),isLoading,isUpdating,updateSuccess,errorMessage,updateErrorMessage);

@override
String toString() {
  return 'InventoryState(products: $products, isLoading: $isLoading, isUpdating: $isUpdating, updateSuccess: $updateSuccess, errorMessage: $errorMessage, updateErrorMessage: $updateErrorMessage)';
}


}

/// @nodoc
abstract mixin class $InventoryStateCopyWith<$Res>  {
  factory $InventoryStateCopyWith(InventoryState value, $Res Function(InventoryState) _then) = _$InventoryStateCopyWithImpl;
@useResult
$Res call({
 List<AdminProductsModel> products, bool isLoading, bool isUpdating, bool updateSuccess, String? errorMessage, String? updateErrorMessage
});




}
/// @nodoc
class _$InventoryStateCopyWithImpl<$Res>
    implements $InventoryStateCopyWith<$Res> {
  _$InventoryStateCopyWithImpl(this._self, this._then);

  final InventoryState _self;
  final $Res Function(InventoryState) _then;

/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? products = null,Object? isLoading = null,Object? isUpdating = null,Object? updateSuccess = null,Object? errorMessage = freezed,Object? updateErrorMessage = freezed,}) {
  return _then(_self.copyWith(
products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<AdminProductsModel>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isUpdating: null == isUpdating ? _self.isUpdating : isUpdating // ignore: cast_nullable_to_non_nullable
as bool,updateSuccess: null == updateSuccess ? _self.updateSuccess : updateSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,updateErrorMessage: freezed == updateErrorMessage ? _self.updateErrorMessage : updateErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [InventoryState].
extension InventoryStatePatterns on InventoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InventoryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InventoryState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InventoryState value)  $default,){
final _that = this;
switch (_that) {
case _InventoryState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InventoryState value)?  $default,){
final _that = this;
switch (_that) {
case _InventoryState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AdminProductsModel> products,  bool isLoading,  bool isUpdating,  bool updateSuccess,  String? errorMessage,  String? updateErrorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InventoryState() when $default != null:
return $default(_that.products,_that.isLoading,_that.isUpdating,_that.updateSuccess,_that.errorMessage,_that.updateErrorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AdminProductsModel> products,  bool isLoading,  bool isUpdating,  bool updateSuccess,  String? errorMessage,  String? updateErrorMessage)  $default,) {final _that = this;
switch (_that) {
case _InventoryState():
return $default(_that.products,_that.isLoading,_that.isUpdating,_that.updateSuccess,_that.errorMessage,_that.updateErrorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AdminProductsModel> products,  bool isLoading,  bool isUpdating,  bool updateSuccess,  String? errorMessage,  String? updateErrorMessage)?  $default,) {final _that = this;
switch (_that) {
case _InventoryState() when $default != null:
return $default(_that.products,_that.isLoading,_that.isUpdating,_that.updateSuccess,_that.errorMessage,_that.updateErrorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _InventoryState implements InventoryState {
  const _InventoryState({required final  List<AdminProductsModel> products, required this.isLoading, required this.isUpdating, required this.updateSuccess, this.errorMessage, this.updateErrorMessage}): _products = products;
  

 final  List<AdminProductsModel> _products;
@override List<AdminProductsModel> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

@override final  bool isLoading;
@override final  bool isUpdating;
@override final  bool updateSuccess;
@override final  String? errorMessage;
@override final  String? updateErrorMessage;

/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InventoryStateCopyWith<_InventoryState> get copyWith => __$InventoryStateCopyWithImpl<_InventoryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InventoryState&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isUpdating, isUpdating) || other.isUpdating == isUpdating)&&(identical(other.updateSuccess, updateSuccess) || other.updateSuccess == updateSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.updateErrorMessage, updateErrorMessage) || other.updateErrorMessage == updateErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products),isLoading,isUpdating,updateSuccess,errorMessage,updateErrorMessage);

@override
String toString() {
  return 'InventoryState(products: $products, isLoading: $isLoading, isUpdating: $isUpdating, updateSuccess: $updateSuccess, errorMessage: $errorMessage, updateErrorMessage: $updateErrorMessage)';
}


}

/// @nodoc
abstract mixin class _$InventoryStateCopyWith<$Res> implements $InventoryStateCopyWith<$Res> {
  factory _$InventoryStateCopyWith(_InventoryState value, $Res Function(_InventoryState) _then) = __$InventoryStateCopyWithImpl;
@override @useResult
$Res call({
 List<AdminProductsModel> products, bool isLoading, bool isUpdating, bool updateSuccess, String? errorMessage, String? updateErrorMessage
});




}
/// @nodoc
class __$InventoryStateCopyWithImpl<$Res>
    implements _$InventoryStateCopyWith<$Res> {
  __$InventoryStateCopyWithImpl(this._self, this._then);

  final _InventoryState _self;
  final $Res Function(_InventoryState) _then;

/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? products = null,Object? isLoading = null,Object? isUpdating = null,Object? updateSuccess = null,Object? errorMessage = freezed,Object? updateErrorMessage = freezed,}) {
  return _then(_InventoryState(
products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<AdminProductsModel>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isUpdating: null == isUpdating ? _self.isUpdating : isUpdating // ignore: cast_nullable_to_non_nullable
as bool,updateSuccess: null == updateSuccess ? _self.updateSuccess : updateSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,updateErrorMessage: freezed == updateErrorMessage ? _self.updateErrorMessage : updateErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
