import 'package:flutter/material.dart';
import 'package:tokio_teste/core/themes/app_colors.dart';

class IconButtonCotacao extends StatelessWidget {
  final Function? onTap;
  final IconData icon;
  final String label;
  const IconButtonCotacao({
    super.key,
    this.onTap,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primaryColor,
      elevation: 5,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: SizedBox(
        width: 120,
        child: InkWell(
          onTap: () {
            if (onTap != null) onTap!();
          },
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                ),
                const SizedBox(height: 8),
                Flexible(
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
