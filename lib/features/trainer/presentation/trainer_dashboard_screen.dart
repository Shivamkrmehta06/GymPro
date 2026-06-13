import 'package:flutter/material.dart';

import '../../../core/widgets/app_navigation_list.dart';
import '../../../core/widgets/app_page.dart';
import '../../../routes/app_route_paths.dart';

class TrainerDashboardScreen extends StatelessWidget {
  const TrainerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppPage(
      title: 'Trainer Dashboard',
      child: AppNavigationList(
        items: [
          AppNavigationItem(
            title: 'Clients',
            route: AppRoutePaths.trainerClients,
          ),
          AppNavigationItem(
            title: 'Workout Plans',
            route: AppRoutePaths.trainerWorkoutPlans,
          ),
          AppNavigationItem(
            title: 'Diet Plans',
            route: AppRoutePaths.trainerDietPlans,
          ),
          AppNavigationItem(
            title: 'Progress',
            route: AppRoutePaths.trainerProgress,
          ),
        ],
      ),
    );
  }
}
