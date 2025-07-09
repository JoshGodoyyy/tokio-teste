import 'package:dartz/dartz.dart';
import 'package:tokio_teste/core/error/failure.dart';
import '../entities/user.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, User>> login(String cpf, String password);
}
