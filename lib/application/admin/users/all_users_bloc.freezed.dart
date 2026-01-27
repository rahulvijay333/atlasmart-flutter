// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_users_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AllUsersEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AllUsersEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AllUsersEvent()';
}


}

/// @nodoc
class $AllUsersEventCopyWith<$Res>  {
$AllUsersEventCopyWith(AllUsersEvent _, $Res Function(AllUsersEvent) __);
}


/// Adds pattern-matching-related methods to [AllUsersEvent].
extension AllUsersEventPatterns on AllUsersEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _GetAllUsers value)?  getAllUsers,TResult Function( _searchUsers value)?  searchUsers,TResult Function( _DeleteUser value)?  deleteUser,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _GetAllUsers() when getAllUsers != null:
return getAllUsers(_that);case _searchUsers() when searchUsers != null:
return searchUsers(_that);case _DeleteUser() when deleteUser != null:
return deleteUser(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _GetAllUsers value)  getAllUsers,required TResult Function( _searchUsers value)  searchUsers,required TResult Function( _DeleteUser value)  deleteUser,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _GetAllUsers():
return getAllUsers(_that);case _searchUsers():
return searchUsers(_that);case _DeleteUser():
return deleteUser(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _GetAllUsers value)?  getAllUsers,TResult? Function( _searchUsers value)?  searchUsers,TResult? Function( _DeleteUser value)?  deleteUser,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _GetAllUsers() when getAllUsers != null:
return getAllUsers(_that);case _searchUsers() when searchUsers != null:
return searchUsers(_that);case _DeleteUser() when deleteUser != null:
return deleteUser(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  getAllUsers,TResult Function( String keyword)?  searchUsers,TResult Function( String id)?  deleteUser,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _GetAllUsers() when getAllUsers != null:
return getAllUsers();case _searchUsers() when searchUsers != null:
return searchUsers(_that.keyword);case _DeleteUser() when deleteUser != null:
return deleteUser(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  getAllUsers,required TResult Function( String keyword)  searchUsers,required TResult Function( String id)  deleteUser,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _GetAllUsers():
return getAllUsers();case _searchUsers():
return searchUsers(_that.keyword);case _DeleteUser():
return deleteUser(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  getAllUsers,TResult? Function( String keyword)?  searchUsers,TResult? Function( String id)?  deleteUser,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _GetAllUsers() when getAllUsers != null:
return getAllUsers();case _searchUsers() when searchUsers != null:
return searchUsers(_that.keyword);case _DeleteUser() when deleteUser != null:
return deleteUser(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements AllUsersEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AllUsersEvent.started()';
}


}




/// @nodoc


class _GetAllUsers implements AllUsersEvent {
  const _GetAllUsers();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetAllUsers);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AllUsersEvent.getAllUsers()';
}


}




/// @nodoc


class _searchUsers implements AllUsersEvent {
  const _searchUsers({required this.keyword});
  

 final  String keyword;

/// Create a copy of AllUsersEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$searchUsersCopyWith<_searchUsers> get copyWith => __$searchUsersCopyWithImpl<_searchUsers>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _searchUsers&&(identical(other.keyword, keyword) || other.keyword == keyword));
}


@override
int get hashCode => Object.hash(runtimeType,keyword);

@override
String toString() {
  return 'AllUsersEvent.searchUsers(keyword: $keyword)';
}


}

/// @nodoc
abstract mixin class _$searchUsersCopyWith<$Res> implements $AllUsersEventCopyWith<$Res> {
  factory _$searchUsersCopyWith(_searchUsers value, $Res Function(_searchUsers) _then) = __$searchUsersCopyWithImpl;
@useResult
$Res call({
 String keyword
});




}
/// @nodoc
class __$searchUsersCopyWithImpl<$Res>
    implements _$searchUsersCopyWith<$Res> {
  __$searchUsersCopyWithImpl(this._self, this._then);

  final _searchUsers _self;
  final $Res Function(_searchUsers) _then;

/// Create a copy of AllUsersEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? keyword = null,}) {
  return _then(_searchUsers(
keyword: null == keyword ? _self.keyword : keyword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _DeleteUser implements AllUsersEvent {
  const _DeleteUser(this.id);
  

 final  String id;

/// Create a copy of AllUsersEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteUserCopyWith<_DeleteUser> get copyWith => __$DeleteUserCopyWithImpl<_DeleteUser>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteUser&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'AllUsersEvent.deleteUser(id: $id)';
}


}

/// @nodoc
abstract mixin class _$DeleteUserCopyWith<$Res> implements $AllUsersEventCopyWith<$Res> {
  factory _$DeleteUserCopyWith(_DeleteUser value, $Res Function(_DeleteUser) _then) = __$DeleteUserCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class __$DeleteUserCopyWithImpl<$Res>
    implements _$DeleteUserCopyWith<$Res> {
  __$DeleteUserCopyWithImpl(this._self, this._then);

  final _DeleteUser _self;
  final $Res Function(_DeleteUser) _then;

/// Create a copy of AllUsersEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_DeleteUser(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$AllUsersState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AllUsersState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AllUsersState()';
}


}

/// @nodoc
class $AllUsersStateCopyWith<$Res>  {
$AllUsersStateCopyWith(AllUsersState _, $Res Function(AllUsersState) __);
}


/// Adds pattern-matching-related methods to [AllUsersState].
extension AllUsersStatePatterns on AllUsersState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<UserModel> users)?  success,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _loading() when loading != null:
return loading();case _success() when success != null:
return success(_that.users);case _failure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<UserModel> users)  success,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _loading():
return loading();case _success():
return success(_that.users);case _failure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<UserModel> users)?  success,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _loading() when loading != null:
return loading();case _success() when success != null:
return success(_that.users);case _failure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AllUsersState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AllUsersState.initial()';
}


}




/// @nodoc


class _loading implements AllUsersState {
  const _loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AllUsersState.loading()';
}


}




/// @nodoc


class _success implements AllUsersState {
  const _success({required final  List<UserModel> users}): _users = users;
  

 final  List<UserModel> _users;
 List<UserModel> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}


/// Create a copy of AllUsersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$successCopyWith<_success> get copyWith => __$successCopyWithImpl<_success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _success&&const DeepCollectionEquality().equals(other._users, _users));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_users));

@override
String toString() {
  return 'AllUsersState.success(users: $users)';
}


}

/// @nodoc
abstract mixin class _$successCopyWith<$Res> implements $AllUsersStateCopyWith<$Res> {
  factory _$successCopyWith(_success value, $Res Function(_success) _then) = __$successCopyWithImpl;
@useResult
$Res call({
 List<UserModel> users
});




}
/// @nodoc
class __$successCopyWithImpl<$Res>
    implements _$successCopyWith<$Res> {
  __$successCopyWithImpl(this._self, this._then);

  final _success _self;
  final $Res Function(_success) _then;

/// Create a copy of AllUsersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? users = null,}) {
  return _then(_success(
users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<UserModel>,
  ));
}


}

/// @nodoc


class _failure implements AllUsersState {
  const _failure(this.message);
  

 final  String message;

/// Create a copy of AllUsersState
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
  return 'AllUsersState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$failureCopyWith<$Res> implements $AllUsersStateCopyWith<$Res> {
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

/// Create a copy of AllUsersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_failure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
