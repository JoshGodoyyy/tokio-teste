import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tokio_teste/core/constants/app_constants.dart';
import 'package:tokio_teste/features/authentication/presentation/bloc/login_bloc.dart';
import 'package:tokio_teste/features/authentication/presentation/bloc/login_event.dart';
import 'package:tokio_teste/features/authentication/presentation/bloc/login_state.dart';
import 'package:tokio_teste/features/home/presentation/pages/home_page.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  int _screenIndex = 0;

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Não foi possível iniciar o link');
    }
  }

  void _clearFields() {
    _cpfController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is LoginSuccess) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          }
        },
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xff32a28c),
                      Color(0xfff2ec8c),
                    ],
                  ),
                ),
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 42,
                  vertical: 86,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight:
                        MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top -
                        172,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/images/logo.png',
                              width: 180,
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Bem vindo!',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 30,
                              ),
                            ),
                            const Text(
                              'Aqui você gerencia seus seguros e de seus Familiares em poucos cliques',
                            ),
                          ],
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Material(
                              color: Color(0xff2e2d3d),
                              elevation: 5,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      children: [
                                        TextButton(
                                          onPressed: () =>
                                              setState(() => _screenIndex = 0),
                                          child: Text(
                                            'Entrar',
                                            style: TextStyle(
                                              fontSize: 24,
                                              color: _screenIndex == 0
                                                  ? Colors.green
                                                  : Colors.white,
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              setState(() => _screenIndex = 1),
                                          child: Text(
                                            'Cadastrar',
                                            style: TextStyle(
                                              fontSize: 24,
                                              color: _screenIndex == 1
                                                  ? Colors.green
                                                  : Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 18),
                                    CustomTextField(
                                      controller: _cpfController,
                                      label: 'CPF',
                                      keyboardType:
                                          TextInputType.numberWithOptions(),
                                    ),
                                    const SizedBox(height: 18),
                                    CustomTextField(
                                      controller: _passwordController,
                                      label: 'Senha',
                                      obscure: true,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Row(
                                            children: [
                                              Checkbox(
                                                value: false,
                                                onChanged: (value) {},
                                              ),
                                              Text('Lembrar Sempre'),
                                            ],
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            'Esqueceu a senha?',
                                            style: TextStyle(
                                              color: Colors.green,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 32),
                                  ],
                                ),
                              ),
                            ),
                            BlocBuilder<LoginBloc, LoginState>(
                              builder: (context, state) {
                                if (state is LoginLoading) {
                                  return CircularProgressIndicator();
                                }
                                return Positioned(
                                  bottom: -40,
                                  right: 0,
                                  left: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      context.read<LoginBloc>().add(
                                        LoginButtonPressed(
                                          cpf: _cpfController.text,
                                          password: _passwordController.text,
                                        ),
                                      );
                                      _clearFields();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xff2d2d3d),
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(0xff32a28c),
                                              Color(0xfff2ec8c),
                                            ],
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        padding: const EdgeInsets.all(16),
                                        child: Icon(
                                          Icons.arrow_forward_rounded,
                                          size: 36,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text('Acesse através das redes sociais'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    _launchUrl(AppConstants.googleLink);
                                  },
                                  icon: Icon(
                                    FontAwesomeIcons.google,
                                    color: Colors.white,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    _launchUrl(AppConstants.facebookLink);
                                  },
                                  icon: Icon(
                                    FontAwesomeIcons.facebook,
                                    color: Colors.white,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    _launchUrl(AppConstants.twitterLink);
                                  },
                                  icon: Icon(
                                    FontAwesomeIcons.twitter,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
