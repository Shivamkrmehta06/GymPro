import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:gym_book/features/auth/presentation/login_screen.dart';
import 'package:gym_book/features/auth/presentation/signup_screen.dart';
import 'package:gym_book/features/auth/presentation/widgets/auth_visual_shell.dart';
import 'package:gym_book/main.dart';

void main() {
  testWidgets('shows the splash screen first', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: GymBookApp()));

    expect(find.byType(AuthLogo), findsOneWidget);
    expect(find.text('Fitness Business OS'), findsOneWidget);
  });

  testWidgets('login phone field accepts phone number', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const ProviderScope(child: MaterialApp(home: LoginScreen())),
    );

    await tester.enterText(
      find.byKey(const ValueKey('login_phone_field')),
      '9876543210',
    );

    expect(find.text('9876543210'), findsOneWidget);
  });

  testWidgets('signup phone field accepts phone number', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: SignupScreen()));

    await tester.enterText(
      find.byKey(const ValueKey('signup_phone_field')),
      '9876543210',
    );

    expect(find.text('9876543210'), findsOneWidget);
  });
}
