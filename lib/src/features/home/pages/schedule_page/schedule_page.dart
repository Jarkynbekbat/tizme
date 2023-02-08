// ignore_for_file: depend_on_referenced_packages

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:studtime/src/shared/data/models/schedule/schedule.dart';
import 'package:studtime/src/shared/styles/app_colors.dart';
import 'package:studtime/src/shared/styles/app_paddings.dart';

class SchedulePage extends StatelessWidget {
  final Schedule schedule;
  const SchedulePage({Key? key, required this.schedule}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          schedule.subject,
          style: const TextStyle(fontSize: 20),
          maxLines: 2,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(AppPadding.defaultPadding),
              children: const [],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.defaultPadding,
              vertical: AppPadding.defaultPaddingHalf,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.01),
                  blurRadius: 20,
                  offset: const Offset(0, -1),
                ),
              ],
            ),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    minLines: 1,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'Введите заметку',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Colors.black12,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.camera_alt_outlined,
                    color: AppColors.primaryColor,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.image_outlined,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
