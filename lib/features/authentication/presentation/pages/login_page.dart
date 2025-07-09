import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tokio_teste/core/constants/app_constants.dart';
import 'package:tokio_teste/core/themes/app_colors.dart';
import 'package:tokio_teste/features/authentication/presentation/bloc/login/login_bloc.dart';
import 'package:tokio_teste/features/authentication/presentation/bloc/login/login_event.dart';
import 'package:tokio_teste/features/authentication/presentation/bloc/login/login_state.dart';
import 'package:tokio_teste/features/authentication/presentation/pages/login_content.dart';
import 'package:tokio_teste/features/authentication/presentation/pages/register_content.dart';
import 'package:tokio_teste/features/authentication/presentation/widgets/tab_text_button.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _registerNameController = TextEditingController();
  final TextEditingController _registerCpfController = TextEditingController();
  final TextEditingController _registerPasswordController =
      TextEditingController();

  int _screenIndex = 0;

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Não foi possível iniciar o link');
    }
  }

  void _clearFields() {
    _cpfController.clear();
    _passwordController.clear();
    _registerNameController.clear();
    _registerCpfController.clear();
    _registerPasswordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double containerWidth;

    switch (screenWidth) {
      case > 620:
        containerWidth = screenWidth * 0.5;
        break;
      default:
        containerWidth = screenWidth;
        break;
    }

    final contents = [
      LoginContent(
        cpfController: _cpfController,
        passwordController: _passwordController,
      ),
      RegisterContent(
        nameController: _registerNameController,
        cpfController: _registerCpfController,
        passwordController: _registerPasswordController,
      ),
    ];

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
              Center(
                child: SizedBox(
                  width: containerWidth,
                  child: Padding(
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
                                  color: AppColors.primaryColor,
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
                                            Flexible(
                                              child: TabTextButton(
                                                onTap: () => setState(
                                                  () => _screenIndex = 0,
                                                ),
                                                label: 'Entrar',
                                                isActive: _screenIndex == 0,
                                              ),
                                            ),
                                            Flexible(
                                              child: TabTextButton(
                                                onTap: () => setState(
                                                  () => _screenIndex = 1,
                                                ),
                                                label: 'Cadastrar',
                                                isActive: _screenIndex == 1,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 18),
                                        contents[_screenIndex],
                                        const SizedBox(height: 32),
                                      ],
                                    ),
                                  ),
                                ),
                                BlocBuilder<LoginBloc, LoginState>(
                                  builder: (context, state) {
                                    if (state is LoginLoading) {
                                      return Positioned(
                                        bottom: -40,
                                        right: 0,
                                        left: 0,
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
                                            child: CircularProgressIndicator(),
                                          ),
                                        ),
                                      );
                                    }
                                    return Positioned(
                                      bottom: -40,
                                      right: 0,
                                      left: 0,
                                      child: InkWell(
                                        onTap: () {
                                          if (_screenIndex == 0) {
                                            context.read<LoginBloc>().add(
                                              LoginButtonPressed(
                                                cpf: _cpfController.text,
                                                password:
                                                    _passwordController.text,
                                              ),
                                            );
                                          } else {
                                            context.read<LoginBloc>().add(
                                              RegisterButtonPressed(
                                                name: _registerNameController
                                                    .text,
                                                cpf:
                                                    _registerCpfController.text,
                                                password:
                                                    _registerPasswordController
                                                        .text,
                                              ),
                                            );
                                          }
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
