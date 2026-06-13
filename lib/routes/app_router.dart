import 'package:go_router/go_router.dart';

import '../features/attendance/presentation/attendance_screen.dart';
import '../features/auth/presentation/auth_screen.dart';
import '../features/auth/presentation/login_screen.dart';
import '../features/auth/presentation/otp_screen.dart';
import '../features/auth/presentation/splash_screen.dart';
import '../features/dashboard/presentation/dashboard_screen.dart';
import '../features/members/presentation/members_screen.dart';
import '../features/payments/presentation/payments_screen.dart';
import '../features/profile/presentation/profile_screen.dart';
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
      path: AppRoutePaths.otp,
      builder: (context, state) => const OtpScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.auth,
      builder: (context, state) => const AuthScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.dashboard,
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.members,
      builder: (context, state) => const MembersScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.attendance,
      builder: (context, state) => const AttendanceScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.payments,
      builder: (context, state) => const PaymentsScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.profile,
      builder: (context, state) => const ProfileScreen(),
    ),
  ],
);
