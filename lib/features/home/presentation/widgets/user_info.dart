import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  final IconData icon;
  final String username;
  const UserInfo({
    super.key,
    required this.icon,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Icon(
                icon,
                size: 36,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Bem vindo',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                username,
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
