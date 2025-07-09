abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  final String cpf;
  final String password;

  LoginButtonPressed({required this.cpf, required this.password});
}

class RegisterButtonPressed extends LoginEvent {
  final String name;
  final String cpf;
  final String password;

  RegisterButtonPressed({
    required this.name,
    required this.cpf,
    required this.password,
  });
}
