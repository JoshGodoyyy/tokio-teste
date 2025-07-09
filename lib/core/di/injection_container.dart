import 'package:get_it/get_it.dart';
import 'package:tokio_teste/features/authentication/data/datasourse/authentication_remote_data_source.dart';
import 'package:tokio_teste/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:tokio_teste/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:tokio_teste/features/authentication/domain/usecases/login.dart';
import 'package:tokio_teste/features/authentication/domain/usecases/validate_cpf.dart';
import 'package:tokio_teste/features/authentication/presentation/bloc/login_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
    () => LoginBloc(
      loginUseCase: sl(),
    ),
  );

  sl.registerLazySingleton(() => ValidateCpf());
  sl.registerLazySingleton(
    () => Login(
      sl(),
      sl(),
    ),
  );
  sl.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<AuthenticationRemoteDataSource>(
    () => AuthenticationRemoteDataSourceImpl(
      firebaseAuth: sl(),
    ),
  );
  sl.registerLazySingleton(() => FirebaseAuth.instance);
}
