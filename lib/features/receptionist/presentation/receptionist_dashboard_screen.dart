import 'package:flutter/material.dart';

import '../../../core/widgets/app_navigation_list.dart';
import '../../../core/widgets/app_page.dart';
import '../../../routes/app_route_paths.dart';

class ReceptionistDashboardScreen extends StatelessWidget {
  const ReceptionistDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppPage(
      title: 'Receptionist Dashboard',
      child: AppNavigationList(
        items: [
          AppNavigationItem(
            title: 'Add Member',
            route: AppRoutePaths.receptionistAddMember,
          ),
          AppNavigationItem(
            title: 'Attendance',
            route: AppRoutePaths.receptionistAttendance,
          ),
          AppNavigationItem(
            title: 'Payments',
            route: AppRoutePaths.receptionistPayments,
          ),
        ],
      ),
    );
  }
}
