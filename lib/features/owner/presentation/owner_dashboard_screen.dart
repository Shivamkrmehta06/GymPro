import 'package:flutter/material.dart';

import '../../../core/widgets/app_navigation_list.dart';
import '../../../core/widgets/app_page.dart';
import '../../../routes/app_route_paths.dart';

class OwnerDashboardScreen extends StatelessWidget {
  const OwnerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppPage(
      title: 'Owner Dashboard',
      child: AppNavigationList(
        items: [
          AppNavigationItem(
            title: 'Members',
            route: AppRoutePaths.ownerMembers,
          ),
          AppNavigationItem(
            title: 'Attendance',
            route: AppRoutePaths.ownerAttendance,
          ),
          AppNavigationItem(
            title: 'Payments',
            route: AppRoutePaths.ownerPayments,
          ),
          AppNavigationItem(
            title: 'Reports',
            route: AppRoutePaths.ownerReports,
          ),
          AppNavigationItem(
            title: 'Settings',
            route: AppRoutePaths.ownerSettings,
          ),
        ],
      ),
    );
  }
}
