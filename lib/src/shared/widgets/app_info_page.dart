import 'package:flutter/material.dart';
import 'package:studtime/src/shared/styles/app_paddings.dart';

class AppInfoPage extends StatelessWidget {
  final String text;
  final String title;

  const AppInfoPage({Key? key, required this.text, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppPadding.defaultPadding),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14.0,
            ),
          ),
        ),
      ),
    );
  }
}
