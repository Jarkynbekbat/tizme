import 'package:flutter/material.dart';
import 'package:studtime/components/intro_page/elements/intro_body.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: IntroBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}
