// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrdersEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdersEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrdersEvent()';
}


}

/// @nodoc
class $OrdersEventCopyWith<$Res>  {
$OrdersEventCopyWith(OrdersEvent _, $Res Function(OrdersEvent) __);
}


/// Adds pattern-matching-related methods to [OrdersEvent].
extension OrdersEventPatterns on OrdersEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _GetOrderedProducts value)?  getOrderedProducts,TResult Function( _LoadMoreOrders value)?  loadMoreOrders,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _GetOrderedProducts() when getOrderedProducts != null:
return getOrderedProducts(_that);case _LoadMoreOrders() when loadMoreOrders != null:
return loadMoreOrders(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _GetOrderedProducts value)  getOrderedProducts,required TResult Function( _LoadMoreOrders value)  loadMoreOrders,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _GetOrderedProducts():
return getOrderedProducts(_that);case _LoadMoreOrders():
return loadMoreOrders(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _GetOrderedProducts value)?  getOrderedProducts,TResult? Function( _LoadMoreOrders value)?  loadMoreOrders,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _GetOrderedProducts() when getOrderedProducts != null:
return getOrderedProducts(_that);case _LoadMoreOrders() when loadMoreOrders != null:
return loadMoreOrders(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( int page,  bool isRefresh)?  getOrderedProducts,TResult Function()?  loadMoreOrders,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _GetOrderedProducts() when getOrderedProducts != null:
return getOrderedProducts(_that.page,_that.isRefresh);case _LoadMoreOrders() when loadMoreOrders != null:
return loadMoreOrders();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( int page,  bool isRefresh)  getOrderedProducts,required TResult Function()  loadMoreOrders,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _GetOrderedProducts():
return getOrderedProducts(_that.page,_that.isRefresh);case _LoadMoreOrders():
return loadMoreOrders();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( int page,  bool isRefresh)?  getOrderedProducts,TResult? Function()?  loadMoreOrders,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _GetOrderedProducts() when getOrderedProducts != null:
return getOrderedProducts(_that.page,_that.isRefresh);case _LoadMoreOrders() when loadMoreOrders != null:
return loadMoreOrders();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements OrdersEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrdersEvent.started()';
}


}




/// @nodoc


class _GetOrderedProducts implements OrdersEvent {
  const _GetOrderedProducts({this.page = 1, this.isRefresh = false});
  

@JsonKey() final  int page;
@JsonKey() final  bool isRefresh;

/// Create a copy of OrdersEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetOrderedProductsCopyWith<_GetOrderedProducts> get copyWith => __$GetOrderedProductsCopyWithImpl<_GetOrderedProducts>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetOrderedProducts&&(identical(other.page, page) || other.page == page)&&(identical(other.isRefresh, isRefresh) || other.isRefresh == isRefresh));
}


@override
int get hashCode => Object.hash(runtimeType,page,isRefresh);

@override
String toString() {
  return 'OrdersEvent.getOrderedProducts(page: $page, isRefresh: $isRefresh)';
}


}

/// @nodoc
abstract mixin class _$GetOrderedProductsCopyWith<$Res> implements $OrdersEventCopyWith<$Res> {
  factory _$GetOrderedProductsCopyWith(_GetOrderedProducts value, $Res Function(_GetOrderedProducts) _then) = __$GetOrderedProductsCopyWithImpl;
@useResult
$Res call({
 int page, bool isRefresh
});




}
/// @nodoc
class __$GetOrderedProductsCopyWithImpl<$Res>
    implements _$GetOrderedProductsCopyWith<$Res> {
  __$GetOrderedProductsCopyWithImpl(this._self, this._then);

  final _GetOrderedProducts _self;
  final $Res Function(_GetOrderedProducts) _then;

/// Create a copy of OrdersEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? page = null,Object? isRefresh = null,}) {
  return _then(_GetOrderedProducts(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,isRefresh: null == isRefresh ? _self.isRefresh : isRefresh // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _LoadMoreOrders implements OrdersEvent {
  const _LoadMoreOrders();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadMoreOrders);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrdersEvent.loadMoreOrders()';
}


}




/// @nodoc
mixin _$OrdersState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdersState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrdersState()';
}


}

/// @nodoc
class $OrdersStateCopyWith<$Res>  {
$OrdersStateCopyWith(OrdersState _, $Res Function(OrdersState) __);
}


/// Adds pattern-matching-related methods to [OrdersState].
extension OrdersStatePatterns on OrdersState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<OrderedProductModel> orderedProducts,  bool isLoadingMore,  bool hasReachedMax,  int currentPage)?  success,TResult Function()?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.orderedProducts,_that.isLoadingMore,_that.hasReachedMax,_that.currentPage);case _Failure() when failure != null:
return failure();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<OrderedProductModel> orderedProducts,  bool isLoadingMore,  bool hasReachedMax,  int currentPage)  success,required TResult Function()  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Success():
return success(_that.orderedProducts,_that.isLoadingMore,_that.hasReachedMax,_that.currentPage);case _Failure():
return failure();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<OrderedProductModel> orderedProducts,  bool isLoadingMore,  bool hasReachedMax,  int currentPage)?  success,TResult? Function()?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.orderedProducts,_that.isLoadingMore,_that.hasReachedMax,_that.currentPage);case _Failure() when failure != null:
return failure();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements OrdersState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrdersState.initial()';
}


}




/// @nodoc


class _Loading implements OrdersState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrdersState.loading()';
}


}




/// @nodoc


class _Success implements OrdersState {
  const _Success(final  List<OrderedProductModel> orderedProducts, {this.isLoadingMore = false, this.hasReachedMax = false, this.currentPage = 1}): _orderedProducts = orderedProducts;
  

 final  List<OrderedProductModel> _orderedProducts;
 List<OrderedProductModel> get orderedProducts {
  if (_orderedProducts is EqualUnmodifiableListView) return _orderedProducts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_orderedProducts);
}

@JsonKey() final  bool isLoadingMore;
@JsonKey() final  bool hasReachedMax;
@JsonKey() final  int currentPage;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&const DeepCollectionEquality().equals(other._orderedProducts, _orderedProducts)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasReachedMax, hasReachedMax) || other.hasReachedMax == hasReachedMax)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_orderedProducts),isLoadingMore,hasReachedMax,currentPage);

@override
String toString() {
  return 'OrdersState.success(orderedProducts: $orderedProducts, isLoadingMore: $isLoadingMore, hasReachedMax: $hasReachedMax, currentPage: $currentPage)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $OrdersStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 List<OrderedProductModel> orderedProducts, bool isLoadingMore, bool hasReachedMax, int currentPage
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? orderedProducts = null,Object? isLoadingMore = null,Object? hasReachedMax = null,Object? currentPage = null,}) {
  return _then(_Success(
null == orderedProducts ? _self._orderedProducts : orderedProducts // ignore: cast_nullable_to_non_nullable
as List<OrderedProductModel>,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasReachedMax: null == hasReachedMax ? _self.hasReachedMax : hasReachedMax // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Failure implements OrdersState {
  const _Failure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrdersState.failure()';
}


}




// dart format on
