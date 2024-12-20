import 'package:clonexaralalmobileapp/bloc/bloc/auth_event.dart';
import 'package:clonexaralalmobileapp/bloc/bloc/auth_state.dart';
import 'package:clonexaralalmobileapp/repositry/auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authRepository;

  AuthenticationBloc(this._authRepository) : super(AuthenticationInitial()) {
    on<AuthenticationSignUpRequested>((event, emit) async {
      emit(AuthenticationLoading());
      try {
        await _authRepository.signUp(
            email: event.email, password: event.password);
        emit(AuthenticationAuthenticated(_authRepository.currentUser!));
      } catch (e) {
        emit(AuthenticationError(e.toString()));
      }
    });

    on<AuthenticationSignInRequested>((event, emit) async {
      emit(AuthenticationLoading());
      try {
        await _authRepository.signIn(
            email: event.email, password: event.password);
        emit(AuthenticationAuthenticated(_authRepository.currentUser!));
      } catch (e) {
        emit(AuthenticationError(e.toString()));
      }
    });

    on<AuthenticationSignOutRequested>((event, emit) async {
      emit(AuthenticationLoading());
      await _authRepository.signOut();
      emit(AuthenticationUnauthenticated());
    });

    on<AuthenticationCheckStatusRequested>((event, emit) {
      if (_authRepository.isAuthenticated) {
        emit(AuthenticationAuthenticated(_authRepository.currentUser!));
      } else {
        emit(AuthenticationUnauthenticated());
      }
    });
  }
}
