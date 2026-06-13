import 'package:go_router/go_router.dart';

import '../features/auth/presentation/login_screen.dart';
import '../features/auth/presentation/otp_screen.dart';
import '../features/auth/presentation/role_selection_screen.dart';
import '../features/auth/presentation/signup_screen.dart';
import '../features/auth/presentation/splash_screen.dart';
import '../features/member/presentation/member_dashboard_screen.dart';
import '../features/member/presentation/member_diet_screen.dart';
import '../features/member/presentation/member_membership_screen.dart';
import '../features/member/presentation/member_profile_screen.dart';
import '../features/member/presentation/member_progress_screen.dart';
import '../features/member/presentation/member_workouts_screen.dart';
import '../features/owner/presentation/owner_add_member_screen.dart';
import '../features/owner/presentation/owner_attendance_screen.dart';
import '../features/owner/presentation/owner_dashboard_screen.dart';
import '../features/owner/presentation/owner_member_details_screen.dart';
import '../features/owner/presentation/owner_members_screen.dart';
import '../features/owner/presentation/owner_payments_screen.dart';
import '../features/owner/presentation/owner_reports_screen.dart';
import '../features/owner/presentation/owner_settings_screen.dart';
import '../features/receptionist/presentation/receptionist_add_member_screen.dart';
import '../features/receptionist/presentation/receptionist_attendance_screen.dart';
import '../features/receptionist/presentation/receptionist_dashboard_screen.dart';
import '../features/receptionist/presentation/receptionist_payments_screen.dart';
import '../features/trainer/presentation/trainer_clients_screen.dart';
import '../features/trainer/presentation/trainer_dashboard_screen.dart';
import '../features/trainer/presentation/trainer_diet_plans_screen.dart';
import '../features/trainer/presentation/trainer_progress_screen.dart';
import '../features/trainer/presentation/trainer_workout_plans_screen.dart';
import 'app_route_paths.dart';

final appRouter = GoRouter(
  initialLocation: AppRoutePaths.splash,
  routes: [
    GoRoute(
      path: AppRoutePaths.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.signup,
      builder: (context, state) => const SignupScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.otp,
      builder: (context, state) => const OtpScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.roleSelection,
      builder: (context, state) => const RoleSelectionScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.ownerDashboard,
      builder: (context, state) => const OwnerDashboardScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.ownerMembers,
      builder: (context, state) => const OwnerMembersScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.ownerAddMember,
      builder: (context, state) => const OwnerAddMemberScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.ownerMemberDetails,
      builder: (context, state) => const OwnerMemberDetailsScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.ownerAttendance,
      builder: (context, state) => const OwnerAttendanceScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.ownerPayments,
      builder: (context, state) => const OwnerPaymentsScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.ownerReports,
      builder: (context, state) => const OwnerReportsScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.ownerSettings,
      builder: (context, state) => const OwnerSettingsScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.receptionistDashboard,
      builder: (context, state) => const ReceptionistDashboardScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.receptionistAddMember,
      builder: (context, state) => const ReceptionistAddMemberScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.receptionistAttendance,
      builder: (context, state) => const ReceptionistAttendanceScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.receptionistPayments,
      builder: (context, state) => const ReceptionistPaymentsScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.trainerDashboard,
      builder: (context, state) => const TrainerDashboardScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.trainerClients,
      builder: (context, state) => const TrainerClientsScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.trainerWorkoutPlans,
      builder: (context, state) => const TrainerWorkoutPlansScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.trainerDietPlans,
      builder: (context, state) => const TrainerDietPlansScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.trainerProgress,
      builder: (context, state) => const TrainerProgressScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.memberDashboard,
      builder: (context, state) => const MemberDashboardScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.memberWorkouts,
      builder: (context, state) => const MemberWorkoutsScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.memberDiet,
      builder: (context, state) => const MemberDietScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.memberProgress,
      builder: (context, state) => const MemberProgressScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.memberMembership,
      builder: (context, state) => const MemberMembershipScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.memberProfile,
      builder: (context, state) => const MemberProfileScreen(),
    ),
  ],
);
