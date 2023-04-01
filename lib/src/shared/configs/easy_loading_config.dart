import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:studtime/src/shared/styles/app_colors.dart';

void setupEasyLoading() {
  EasyLoading.instance
    ..userInteractions = false
    ..dismissOnTap = false
    ..displayDuration = const Duration(milliseconds: 2000)

    ///
    ..maskColor = Colors.transparent
    ..backgroundColor = AppColors.primaryColor.withOpacity(0.66)
    ..textColor = Colors.white
    ..maskType = EasyLoadingMaskType.custom
    ..loadingStyle = EasyLoadingStyle.custom
    ..boxShadow = []

    ///
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..indicatorColor = Colors.white;
}
