sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoad extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final dynamic userData;
  RegisterSuccess({required this.userData});
}

final class RegisterFail extends RegisterState {
  String errorMessage;
  RegisterFail({required this.errorMessage});
}

final class ChooseImage extends RegisterState {}
