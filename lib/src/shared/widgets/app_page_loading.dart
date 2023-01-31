import 'package:flutter/material.dart';

class AppPageLoading extends StatelessWidget {
  const AppPageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
