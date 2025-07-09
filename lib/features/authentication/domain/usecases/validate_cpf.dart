import 'package:dartz/dartz.dart';
import 'package:tokio_teste/core/error/failure.dart';
import 'package:tokio_teste/core/usecases/usecase.dart';

class ValidateCpf implements Usecase<bool, String> {
  @override
  Future<Either<Failure, bool>> call(String cpf) async {
    final unmaskCpf = cpf.replaceAll(RegExp(r'[^0-9]'), '');

    if (unmaskCpf.length != 11) return Left(InvalidCpfFailure());

    return Right(true);
  }
}
