import 'package:clonexaralalmobileapp/bloc/bloc/auth_event.dart';
import 'package:clonexaralalmobileapp/bloc/bloc/auth_state.dart';
import 'package:clonexaralalmobileapp/repositry/auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationBloc 
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authRepository;

  AuthenticationBloc({required AuthenticationRepository authRepository})
      : _authRepository = authRepository,
        super(const AuthenticationState.unknown()) {
    on<AuthenticationStatusChanged>(_onStatusChanged);
    on<AuthenticationLogoutRequested>(_onLogoutRequested);

    _checkAuthStatus();
  }

  void _checkAuthStatus() {
    if (_authRepository.isAuthenticated) {
      add(AuthenticationStatusChanged(
        AuthenticationState.authenticated(_authRepository.currentUser!),
      ));
    } else {
      add(AuthenticationStatusChanged(
        const AuthenticationState.unauthenticated(),
      ));
    }
  }

  void _onStatusChanged(
    AuthenticationStatusChanged event, 
    Emitter<AuthenticationState> emit,
  ) {
    emit(event.status);
  }

  void _onLogoutRequested(
    AuthenticationLogoutRequested event, 
    Emitter<AuthenticationState> emit,
  ) async {
    await _authRepository.signOut();
    emit(const AuthenticationState.unauthenticated());
  }
}
