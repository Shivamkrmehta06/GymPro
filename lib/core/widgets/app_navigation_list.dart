import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavigationItem {
  const AppNavigationItem({required this.title, required this.route});

  final String title;
  final String route;
}

class AppNavigationList extends StatelessWidget {
  const AppNavigationList({required this.items, super.key});

  final List<AppNavigationItem> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(24),
      itemCount: items.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final item = items[index];

        return FilledButton.tonal(
          onPressed: () => context.go(item.route),
          style: FilledButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            alignment: Alignment.centerLeft,
          ),
          child: Text(item.title),
        );
      },
    );
  }
}
