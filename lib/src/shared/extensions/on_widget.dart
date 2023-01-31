import 'package:flutter/material.dart';

extension OnWidget on Widget {
  MaterialPageRoute toMatRoute() => MaterialPageRoute(builder: (_) => this);
}
