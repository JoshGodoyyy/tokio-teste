import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tokio_teste/core/themes/app_colors.dart';
import 'package:tokio_teste/features/authentication/presentation/bloc/login/login_bloc.dart';
import 'package:tokio_teste/features/authentication/presentation/bloc/login/login_state.dart';
import 'package:tokio_teste/features/automovel_webview/automovel_webview.dart';
import 'package:tokio_teste/features/home/presentation/widgets/title_section.dart';

import '../widgets/icon_button_cotacao.dart';
import '../widgets/user_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is LoginSuccess) {
          return Scaffold(
            appBar: AppBar(
              title: Image.asset(
                'assets/images/logo_light.png',
                width: 140,
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    FontAwesomeIcons.bell,
                  ),
                ),
              ],
            ),
            drawer: Drawer(
              backgroundColor: AppColors.primaryColor,
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Olá!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                CircleAvatar(
                                  child: Icon(FontAwesomeIcons.person),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  state.user.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 36),
                            ListTile(
                              leading: Icon(
                                Icons.settings,
                                color: Colors.green,
                              ),
                              title: const Text(
                                'Home / Seguros',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.settings,
                                color: Colors.green,
                              ),
                              title: const Text(
                                'Minhas Contratações',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.settings,
                                color: Colors.green,
                              ),
                              title: const Text(
                                'Meus Sinistros',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.settings,
                                color: Colors.green,
                              ),
                              title: const Text(
                                'Minha Família',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.settings,
                                color: Colors.green,
                              ),
                              title: const Text(
                                'Meus Bens',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.settings,
                                color: Colors.green,
                              ),
                              title: const Text(
                                'Pagamentos',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.settings,
                                color: Colors.green,
                              ),
                              title: const Text(
                                'Coberturas',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.settings,
                                color: Colors.green,
                              ),
                              title: const Text(
                                'Validar Boleto',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.settings,
                                color: Colors.green,
                              ),
                              title: const Text(
                                'Telefones Importantes',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.settings,
                                color: Colors.green,
                              ),
                              title: const Text(
                                'Configurações',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Sair',
                                style: TextStyle(
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
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
                      padding: const EdgeInsets.all(12),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          CircleAvatar(
                            child: Icon(Icons.person),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Dúvidas?',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Clique aqui e entre em contato com o nosso SAC.',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: ListView(
              children: [
                UserInfo(
                  icon: FontAwesomeIcons.person,
                  username: state.user.name,
                ),
                Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleSection(label: 'Cotar e Contratar'),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 100,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            IconButtonCotacao(
                              icon: FontAwesomeIcons.carSide,
                              label: 'Automóvel',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AutomovelWebview(),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(width: 8),
                            IconButtonCotacao(
                              icon: FontAwesomeIcons.house,
                              label: 'Residência',
                            ),
                            const SizedBox(width: 8),
                            IconButtonCotacao(
                              icon: FontAwesomeIcons.heart,
                              label: 'Vida',
                            ),
                            const SizedBox(width: 8),
                            IconButtonCotacao(
                              icon: FontAwesomeIcons.crutch,
                              label: 'Acidentes Pessoais',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      TitleSection(label: 'Minha Família'),
                      const SizedBox(height: 12),
                      Material(
                        elevation: 5,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: AppColors.primaryColor,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(56),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_circle_outline,
                                  color: Colors.white,
                                  size: 64,
                                ),
                                const SizedBox(height: 32),
                                const Text(
                                  'Adicione aqui membros da sua família e compartilhe os seguros com eles.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TitleSection(label: 'Contratados'),
                      const SizedBox(height: 12),
                      Material(
                        elevation: 5,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: AppColors.primaryColor,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(56),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.faceFrown,
                                  color: Colors.white,
                                  size: 64,
                                ),
                                const SizedBox(height: 32),
                                const Text(
                                  'Você ainda não possui seguros contratados.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
