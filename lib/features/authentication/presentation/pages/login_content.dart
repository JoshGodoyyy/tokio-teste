import 'package:flutter/material.dart';

import '../widgets/custom_text_field.dart';

class LoginContent extends StatefulWidget {
  final TextEditingController cpfController;
  final TextEditingController passwordController;

  const LoginContent({
    super.key,
    required this.cpfController,
    required this.passwordController,
  });

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  bool lembrarSempre = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: widget.cpfController,
          label: 'CPF',
          keyboardType: TextInputType.numberWithOptions(),
        ),
        const SizedBox(height: 18),
        CustomTextField(
          controller: widget.passwordController,
          label: 'Senha',
          obscure: true,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                children: [
                  Checkbox(
                    value: lembrarSempre,
                    onChanged: (value) =>
                        setState(() => lembrarSempre = value!),
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
      ],
    );
  }
}
