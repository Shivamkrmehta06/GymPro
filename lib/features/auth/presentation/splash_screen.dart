import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../routes/app_route_paths.dart';
import 'widgets/auth_visual_shell.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

  
    return Scaffold(
      body: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 1),
        duration: const Duration(seconds: 3),
        onEnd: () => context.go(AppRoutePaths.login),
        builder: (context, opacity, child) {
          return AnimatedOpacity(
            opacity: opacity,
            duration: const Duration(milliseconds: 0),
            child: child,
          );
        },
        child: Center(

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const AuthLogo(),
              const SizedBox(height: 8),
              Text(
                'Fitness Business OS',
                style: textTheme.titleMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
