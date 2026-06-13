import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class AuthVisualShell extends StatelessWidget {
  const AuthVisualShell({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(color: AppColors.background, child: child);
  }
}

class AuthContentPanel extends StatelessWidget {
  const AuthContentPanel({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 430),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.all(Radius.circular(38)),
      ),
      child: child,
    );
  }
}

class AuthIllustration extends StatelessWidget {
  const AuthIllustration({required this.icon, super.key});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 178,
            height: 130,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(70),
            ),
          ),
          Positioned(
            right: 80,
            top: 46,
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.22),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Container(
            width: 104,
            height: 104,
            decoration: BoxDecoration(
              color: AppColors.surface,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primary, width: 3),
            ),
            child: Icon(icon, color: AppColors.accent, size: 48),
          ),
        ],
      ),
    );
  }
}

class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: textTheme.headlineSmall?.copyWith(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w900,
          letterSpacing: -0.8,
        ),
        children: const [
          TextSpan(text: 'Gym'),
          TextSpan(
            text: 'Pro',
            style: TextStyle(color: AppColors.primary),
          ),
          TextSpan(text: '.'),
        ],
      ),
    );
  }
}
