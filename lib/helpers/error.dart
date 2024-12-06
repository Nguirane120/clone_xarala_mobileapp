class AuthenticationException implements Exception {
  final String message;

  const AuthenticationException(this.message);

  factory AuthenticationException.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const AuthenticationException('Invalid email address');
      case 'user-disabled':
        return const AuthenticationException('User account has been disabled');
      case 'user-not-found':
        return const AuthenticationException('No user found with this email');
      case 'wrong-password':
        return const AuthenticationException('Incorrect password');
      case 'email-already-in-use':
        return const AuthenticationException('Email is already registered');
      case 'weak-password':
        return const AuthenticationException('Password is too weak');
      default:
        return const AuthenticationException('Authentication error occurred');
    }
  }
}
