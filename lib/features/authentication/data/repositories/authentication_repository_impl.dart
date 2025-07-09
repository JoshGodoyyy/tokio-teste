import 'package:dartz/dartz.dart';

import 'package:tokio_teste/core/error/failure.dart';

import 'package:tokio_teste/features/authentication/domain/entities/user.dart';

import '../../domain/repositories/authentication_repository.dart';
import '../datasourse/authentication_remote_data_source.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource remoteDataSource;

  AuthenticationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, User>> login(String cpf, String password) async {
    try {
      final userModel = await remoteDataSource.login(cpf, password);

      return Right(userModel);
    } catch (ex) {
      return Left(ServerFailure());
    }
  }
}
