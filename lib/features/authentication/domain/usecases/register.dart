import 'package:dartz/dartz.dart';
import 'package:tokio_teste/core/error/failure.dart';
import 'package:tokio_teste/core/usecases/usecase.dart';
import 'package:tokio_teste/features/authentication/domain/entities/user.dart';
import 'package:tokio_teste/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:tokio_teste/features/authentication/domain/usecases/validate_cpf.dart';

class RegisterParams {
  final String name;
  final String cpf;
  final String password;

  RegisterParams({
    required this.name,
    required this.cpf,
    required this.password,
  });
}

class Register implements Usecase<User, RegisterParams> {
  final AuthenticationRepository repository;
  final ValidateCpf validateCpf;

  Register(this.repository, this.validateCpf);

  @override
  Future<Either<Failure, User>> call(RegisterParams params) async {
    final validationResult = await validateCpf(params.cpf);

    return validationResult.fold((failure) => Left(failure), (_) async {
      return await repository.register(
        params.name,
        params.cpf,
        params.password,
      );
    });
  }
}
