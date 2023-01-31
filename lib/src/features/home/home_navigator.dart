import 'package:flutter/material.dart';
import 'package:studtime/src/features/home/pages/home_page/home_page.dart';
import 'package:studtime/src/shared/extensions/on_widget.dart';

class HomeNavigator extends StatelessWidget {
  const HomeNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return const HomePage().toMatRoute();
          default:
            return null;
        }
      },
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        return true;
      },
    );
  }
}
