import 'package:flutter/material.dart';
import 'package:studtime/src/shared/styles/app_colors.dart';

class DateText extends StatelessWidget {
  final int weekdayIndex;
  const DateText(this.weekdayIndex, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '03.12', // TODO: nur вынести правильную дату в таком формате, в зависимости от weekdayIndex
      style: TextStyle(
        fontSize: 15.0,
        color: AppColors.primaryColor,
      ),
    );
  }
}
