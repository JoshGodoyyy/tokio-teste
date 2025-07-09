import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:firebase_database/firebase_database.dart';
import '../models/user_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<UserModel> login(String cpf, String password);
  Future<UserModel> register(
    String name,
    String cpf,
    String password,
  );
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  final firebase.FirebaseAuth firebaseAuth;
  final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

  AuthenticationRemoteDataSourceImpl({required this.firebaseAuth});

  @override
  Future<UserModel> login(String cpf, String password) async {
    final response = await firebaseAuth.signInWithEmailAndPassword(
      email: '$cpf@tokio-app.com',
      password: password,
    );

    if (response.user != null) {
      final userRef = databaseReference
          .child('users')
          .child(response.user!.uid);

      final snapshot = await userRef.get();
      String username = (snapshot.value as Map)['name'];

      return UserModel(
        name: username,
        cpf: response.user!.email!,
        password: '',
      );
    } else {
      throw Exception('Erro inesperado.');
    }
  }

  @override
  Future<UserModel> register(String name, String cpf, String password) async {
    final response = await firebaseAuth.createUserWithEmailAndPassword(
      email: '$cpf@tokio-app.com',
      password: password,
    );

    if (response.user != null) {
      await databaseReference.child('users').child(response.user!.uid).set({
        'name': name,
      });

      return UserModel(name: name, cpf: cpf, password: '');
    }

    throw Exception('Erro inesperado');
  }
}
