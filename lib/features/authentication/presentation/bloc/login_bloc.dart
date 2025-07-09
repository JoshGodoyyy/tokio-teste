import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokio_teste/core/error/failure.dart';
import '../../domain/usecases/login.dart';
import 'login_state.dart';
import 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Login loginUseCase;

  LoginBloc({required this.loginUseCase}) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());

      final result = await loginUseCase(
        LoginParams(cpf: event.cpf, password: event.password),
      );

      result.fold(
        (failure) {
          emit(LoginFailure(message: _mapFailureToMessage(failure)));
        },
        (user) {
          emit(LoginSuccess(user: user));
        },
      );
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case InvalidCpfFailure:
        return 'CPF Inválido.';
      case ServerFailure:
        return 'Erro no servidor.';
      default:
        return 'Ocorreu um erro inesperado.';
    }
  }
}
