import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokio_teste/core/themes/app_theme.dart';
import 'package:tokio_teste/features/authentication/presentation/bloc/login/login_bloc.dart';
import 'package:tokio_teste/features/authentication/presentation/bloc/login/login_state.dart';
import 'package:tokio_teste/features/authentication/presentation/pages/login_page.dart';
import 'package:tokio_teste/features/home/presentation/pages/home_page.dart';
import 'package:tokio_teste/firebase_options.dart';
import 'core/di/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await di.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tokio Marine',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: BlocProvider(
        create: (context) => di.sl<LoginBloc>(),
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginSuccess) {
              return const HomePage();
            }
            return const LoginPage();
          },
        ),
      ),
    );
  }
}
