import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:gym_book/main.dart';

void main() {
  testWidgets('shows the splash screen first', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: GymBookApp()));

    expect(find.text('GymPro'), findsOneWidget);
    expect(find.text('Fitness Business OS'), findsOneWidget);
  });
}
