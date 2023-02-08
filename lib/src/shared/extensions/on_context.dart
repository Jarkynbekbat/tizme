import 'package:flutter/material.dart';

extension OnContext on BuildContext {
  NavigatorState get navigator => Navigator.of(this);
  NavigatorState get rootNavigator => Navigator.of(this, rootNavigator: true);

  void pushNamed(String routeName, {Object? arguments}) {
    navigator.pushNamed(routeName, arguments: arguments);
  }

  void pushReplacementNamed(String routeName) {
    navigator.pushReplacementNamed(routeName);
  }

  void pop() => navigator.pop();
}
