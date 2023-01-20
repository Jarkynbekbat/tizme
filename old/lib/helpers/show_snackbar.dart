import 'package:flutter/material.dart';

void showSnackBar(message, _scaffoldKey) {
  final snackBar = SnackBar(content: Text(message));
  _scaffoldKey.currentState.showSnackBar(snackBar);
}
