import 'package:flutter/material.dart';

import '../widgets/custom_text_field.dart';

class LoginContent extends StatelessWidget {
  final TextEditingController cpfController;
  final TextEditingController passwordController;

  const LoginContent({
    super.key,
    required this.cpfController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: cpfController,
          label: 'CPF',
          keyboardType: TextInputType.numberWithOptions(),
        ),
        const SizedBox(height: 18),
        CustomTextField(
          controller: passwordController,
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
      ],
    );
  }
}
