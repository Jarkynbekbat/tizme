import 'package:flutter/material.dart';

extension OnContext on BuildContext {
  NavigatorState get navigator => Navigator.of(this);
  NavigatorState get rootNavigator => Navigator.of(this, rootNavigator: true);

  Future<T?> push<T>(Widget page) {
    return navigator.push(MaterialPageRoute(builder: (_) => page));
  }

  void pushNamed(String routeName, {Object? arguments}) {
    navigator.pushNamed(routeName, arguments: arguments);
  }

  void pushReplacementNamed(String routeName) {
    navigator.pushReplacementNamed(routeName);
  }

  void pop() => navigator.pop();
}
