import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  final String label;
  const TitleSection({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
