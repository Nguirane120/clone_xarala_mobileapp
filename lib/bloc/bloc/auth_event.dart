abstract class AuthenticationEvent {}

class AuthenticationSignUpRequested extends AuthenticationEvent {
  final String email;
  final String password;

  AuthenticationSignUpRequested({required this.email, required this.password});
}

class AuthenticationSignInRequested extends AuthenticationEvent {
  final String email;
  final String password;

  AuthenticationSignInRequested({required this.email, required this.password});
}

class AuthenticationSignOutRequested extends AuthenticationEvent {}

class AuthenticationCheckStatusRequested extends AuthenticationEvent {}
