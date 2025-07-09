import 'package:dartz/dartz.dart';
import 'package:tokio_teste/core/error/failure.dart';
import 'package:tokio_teste/core/usecases/usecase.dart';
import 'package:tokio_teste/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:tokio_teste/features/authentication/domain/usecases/validate_cpf.dart';

import '../entities/user.dart';

class LoginParams {
  final String cpf;
  final String password;

  LoginParams({required this.cpf, required this.password});
}

class Login implements Usecase<User, LoginParams> {
  final AuthenticationRepository repository;
  final ValidateCpf validateCpf;

  Login(this.repository, this.validateCpf);

  @override
  Future<Either<Failure, User>> call(LoginParams params) async {
    final validationResult = await validateCpf(params.cpf);

    return validationResult.fold(
      (failure) => Left(failure),
      (_) async {
        return await repository.login(params.cpf, params.password);
      },
    );
  }
}
