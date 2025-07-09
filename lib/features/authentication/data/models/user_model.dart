import 'package:tokio_teste/features/authentication/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.name,
    required super.cpf,
    required super.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    name: json['name'] as String,
    cpf: json['cpf'] as String,
    password: json['password'] as String,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'cpf': cpf,
    'password': password,
  };
}
