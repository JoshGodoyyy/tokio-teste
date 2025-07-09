import 'package:dartz/dartz.dart';
import 'package:tokio_teste/core/error/failure.dart';
import '../entities/user.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, User>> login(String cpf, String password);

  Future<Either<Failure, User>> register(
    String name,
    String cpf,
    String password,
  );
}
