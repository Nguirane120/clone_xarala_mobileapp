import 'package:clonexaralalmobileapp/bloc/bloc/auth_state.dart';

abstract class AuthenticationEvent {}

class AuthenticationStatusChanged extends AuthenticationEvent {
  final AuthenticationState status;

  AuthenticationStatusChanged(this.status);
}

class AuthenticationLogoutRequested extends AuthenticationEvent {}
