import 'package:flutter/material.dart';

class AppPage extends StatelessWidget {
  const AppPage({required this.title, this.child, super.key});

  final String title;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: child ?? Center(child: Text(title)),
    );
  }
}
