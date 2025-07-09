abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  final String cpf;
  final String password;

  LoginButtonPressed({required this.cpf, required this.password});
}
