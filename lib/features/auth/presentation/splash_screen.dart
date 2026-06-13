import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../routes/app_route_paths.dart';

class SplashScreen extends StatelessWidget {
  // StatelessWidget is used because this screen only displays static UI and
  // delegates the two-second navigation timing to TweenAnimationBuilder.
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // Scaffold provides the Material page structure, background color, and a
    // safe foundation for adding app bars, drawers, snack bars, or body content.
    return Scaffold(
      backgroundColor: colorScheme.surface,
      // TweenAnimationBuilder gives this StatelessWidget a production-friendly
      // timed callback. When the two-second animation ends, GoRouter navigates
      // to LoginScreen without requiring mutable state or initState.
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
        // Center places the splash content in the exact middle of the screen,
        // which keeps the launch experience balanced on phones and tablets.
        child: Center(
          // Column stacks the icon, app name, and tagline vertically with
          // deliberate spacing so the splash remains readable and polished.
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon uses the built-in fitness_center symbol and theme colors,
              // avoiding hardcoded branding colors while keeping Material 3 fit.
              // Icon(Icons.fitness_center, size: 72, color: colorScheme.primary),
              // const SizedBox(height: 24),
              // Text displays the app name using the active Material text theme,
              // so typography stays consistent across the whole application.
              Text(
                'GymPro',
                style: textTheme.headlineLarge?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // Text displays the tagline with a secondary theme color to create
              // visual hierarchy without introducing custom business logic.
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
