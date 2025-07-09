import 'package:flutter/material.dart';

class TabTextButton extends StatelessWidget {
  final Function onTap;
  final String label;
  final bool isActive;
  const TabTextButton({
    super.key,
    required this.onTap,
    required this.label,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Text(
                label,
                overflow: TextOverflow.visible,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 24,
                  color: isActive ? Colors.green : Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                color: isActive ? Colors.green : null,
                height: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
