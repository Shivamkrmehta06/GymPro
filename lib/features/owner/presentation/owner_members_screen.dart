import 'package:flutter/material.dart';

import '../../../core/widgets/app_navigation_list.dart';
import '../../../core/widgets/app_page.dart';
import '../../../routes/app_route_paths.dart';

class OwnerMembersScreen extends StatelessWidget {
  const OwnerMembersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppPage(
      title: 'Owner Members',
      child: AppNavigationList(
        items: [
          AppNavigationItem(
            title: 'Add Member',
            route: AppRoutePaths.ownerAddMember,
          ),
          AppNavigationItem(
            title: 'Member Details',
            route: AppRoutePaths.ownerMemberDetails,
          ),
        ],
      ),
    );
  }
}
