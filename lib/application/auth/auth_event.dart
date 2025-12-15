part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AppStarted extends AuthEvent {}

class AuthStatusChanged extends AuthEvent {
  final bool isAuthenticated;
  AuthStatusChanged(this.isAuthenticated);
}

class LogoutRequested extends AuthEvent {}
