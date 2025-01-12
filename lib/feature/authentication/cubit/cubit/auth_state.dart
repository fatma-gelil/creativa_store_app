sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoad extends AuthState {}

final class AuthSuccess extends AuthState {
  final userData;
  AuthSuccess({required this.userData});
}

final class AuthFail extends AuthState {}
