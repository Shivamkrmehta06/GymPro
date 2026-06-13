import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../routes/app_route_paths.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Role Selection')),
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final maxContentWidth = constraints.maxWidth < 520
                ? double.infinity
                : 480.0;

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - 64,
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: maxContentWidth),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Choose your role',
                          textAlign: TextAlign.center,
                          style: textTheme.headlineMedium?.copyWith(
                            color: colorScheme.onSurface,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'GymPro will personalize your workspace.',
                          textAlign: TextAlign.center,
                          style: textTheme.bodyLarge?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 32),
                        _RoleCard(
                          icon: Icons.admin_panel_settings_rounded,
                          title: 'Owner',
                          subtitle: 'Manage operations, revenue, and reports.',
                          onTap: () => context.go(AppRoutePaths.ownerDashboard),
                        ),
                        const SizedBox(height: 12),
                        _RoleCard(
                          icon: Icons.support_agent_rounded,
                          title: 'Receptionist',
                          subtitle: 'Handle front desk and daily check-ins.',
                          onTap: () =>
                              context.go(AppRoutePaths.receptionistDashboard),
                        ),
                        const SizedBox(height: 12),
                        _RoleCard(
                          icon: Icons.fitness_center_rounded,
                          title: 'Trainer',
                          subtitle: 'Track clients, workouts, and progress.',
                          onTap: () =>
                              context.go(AppRoutePaths.trainerDashboard),
                        ),
                        const SizedBox(height: 12),
                        _RoleCard(
                          icon: Icons.person_rounded,
                          title: 'Member',
                          subtitle: 'View workouts, diet, and progress.',
                          onTap: () =>
                              context.go(AppRoutePaths.memberDashboard),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  const _RoleCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      elevation: 0,
      color: colorScheme.surfaceContainerHighest,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, color: colorScheme.onPrimaryContainer),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: textTheme.titleMedium?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Icon(
                Icons.chevron_right_rounded,
                color: colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
