import 'package:flooz_challenge/res/style/app_colors.dart';
import 'package:flooz_challenge/res/style/app_shadows.dart';
import 'package:flooz_challenge/res/style/app_text_styles.dart';
import 'package:flutter/material.dart';

class FloozButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final Color backgroundColor;

  const FloozButton(
      {Key? key,
      required this.onTap,
      this.backgroundColor = AppColors.purple,
      required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          boxShadow: AppShadows.lightThemeShadow,
        ),
        child: Center(
          child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.kButtonTitle),
        ),

      ),
    );
  }
}
