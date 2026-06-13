import 'package:flutter/material.dart';

import '../../../core/widgets/app_navigation_list.dart';
import '../../../core/widgets/app_page.dart';
import '../../../routes/app_route_paths.dart';

class MemberDashboardScreen extends StatelessWidget {
  const MemberDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppPage(
      title: 'Member Dashboard',
      child: AppNavigationList(
        items: [
          AppNavigationItem(
            title: 'Workouts',
            route: AppRoutePaths.memberWorkouts,
          ),
          AppNavigationItem(title: 'Diet', route: AppRoutePaths.memberDiet),
          AppNavigationItem(
            title: 'Progress',
            route: AppRoutePaths.memberProgress,
          ),
          AppNavigationItem(
            title: 'Membership',
            route: AppRoutePaths.memberMembership,
          ),
          AppNavigationItem(
            title: 'Profile',
            route: AppRoutePaths.memberProfile,
          ),
        ],
      ),
    );
  }
}
