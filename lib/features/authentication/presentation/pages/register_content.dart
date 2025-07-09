import 'package:flutter/material.dart';
import 'package:tokio_teste/features/authentication/presentation/widgets/custom_text_field.dart';

class RegisterContent extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController cpfController;
  final TextEditingController passwordController;
  const RegisterContent({
    super.key,
    required this.nameController,
    required this.cpfController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(controller: nameController, label: 'Nome'),
        const SizedBox(height: 18),
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
        const SizedBox(height: 18),
      ],
    );
  }
}
