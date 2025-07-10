import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tokio_teste/features/authentication/presentation/bloc/login/login_bloc.dart';
import 'package:tokio_teste/features/authentication/presentation/bloc/login/login_state.dart';
import 'package:tokio_teste/features/authentication/presentation/pages/login_page.dart';

class MockLoginBloc extends Mock implements LoginBloc {}

void main() {
  late LoginBloc loginBloc;

  setUp(() {
    loginBloc = MockLoginBloc();
    when(() => loginBloc.state).thenReturn(LoginInitial());
    when(() => loginBloc.stream).thenAnswer((_) => const Stream.empty());
  });

  testWidgets('LoginPage is shown', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MediaQuery(
          data: const MediaQueryData(size: Size(1280, 800)),
          child: BlocProvider<LoginBloc>.value(
            value: loginBloc,
            child: const LoginPage(),
          ),
        ),
      ),
    );
    expect(find.byType(LoginPage), findsOneWidget);
  });
}
