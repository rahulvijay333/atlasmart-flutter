part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthAuthenticated extends AuthState {
  final String? role;

  AuthAuthenticated({ this.role});
}

class AuthUnauthenticated extends AuthState {}

class AuthLoading extends AuthState {}
