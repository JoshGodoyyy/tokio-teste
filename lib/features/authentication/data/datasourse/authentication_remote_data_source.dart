import 'package:firebase_auth/firebase_auth.dart' as firebase;
import '../models/user_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<UserModel> login(String cpf, String password);
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  final firebase.FirebaseAuth firebaseAuth;

  AuthenticationRemoteDataSourceImpl({required this.firebaseAuth});

  @override
  Future<UserModel> login(String cpf, String password) async {
    final response = await firebaseAuth.signInWithEmailAndPassword(
      email: '$cpf@tokio-app.com',
      password: password,
    );

    if (response.user != null) {
      return UserModel(cpf: response.user!.email!, password: '');
    } else {
      throw Exception('Erro inesperado.');
    }
  }
}
