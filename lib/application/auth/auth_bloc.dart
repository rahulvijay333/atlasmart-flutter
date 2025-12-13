import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/auth/auth_service.dart';
import '../../domain/token/token_storage.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;
  final TokenStorage storage;

  AuthBloc(this.repository, this.storage) : super(AuthInitial()) {
    on<AppStarted>(_onAppStarted);
    on<LoginSubmitted>(_onLogin);
    on<LogoutPressed>(_onLogout);
  }

  Future<void> _onAppStarted(AppStarted event, Emitter emit) async {
    final access = await storage.getAccessToken();
    if (access != null && !storage.isExpired(access)) {
      emit(AuthLoggedIn());
    } else {
      emit(AuthLoggedOut());
    }
  }

  Future<void> _onLogin(LoginSubmitted event, Emitter emit) async {
    emit(AuthLoading());
    try {
      final tokens = await repository.login(event.email, event.password);
      await storage.saveTokens(tokens.accessToken, tokens.refreshToken);
      emit(AuthLoggedIn());
    } catch (e) {
      emit(AuthError("Login failed"));
    }
  }

  Future<void> _onLogout(LogoutPressed event, Emitter emit) async {
    await repository.logout();
    await storage.clear();
    emit(AuthLoggedOut());
  }
}
