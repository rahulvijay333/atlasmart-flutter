import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/token/token_storage.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final TokenStorage storage;

  AuthBloc(this.storage) : super(AuthInitial()) {
    on<AppStarted>(_onAppStarted);
    on<AuthStatusChanged>(_onAuthStatusChanged);
    on<LogoutRequested>(_onLogoutRequested);
  }

  Future<void> _onAppStarted(AppStarted event, Emitter<AuthState> emit) async {
    final accessToken = await storage.getAccessToken();
    final role = await storage.getRole();

    if (accessToken != null && !storage.isExpired(accessToken)) {
      emit(AuthAuthenticated(role: role));
    } else {
      emit(AuthUnauthenticated());
    }
  }

  void _onAuthStatusChanged(
    AuthStatusChanged event,
    Emitter<AuthState> emit,
  ) async {
    final role = await storage.getRole();
    if (event.isAuthenticated) {
      emit(AuthAuthenticated(role: role));
    } else {
      emit(AuthUnauthenticated());
    }
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    await storage.clear();
    emit(AuthUnauthenticated());
  }
}
