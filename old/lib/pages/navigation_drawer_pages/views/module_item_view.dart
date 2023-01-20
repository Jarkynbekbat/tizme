import 'package:flutter/material.dart';

import '../../../models/module_model.dart';

class ModuleItemView extends StatelessWidget {
  final ModuleItem moduleItem;

  ModuleItemView({this.moduleItem});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          "${moduleItem.timeFrom}\n${moduleItem.timeTo}",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.5),
        ),
        const SizedBox(width: 20.0),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
              ),
              color: Colors.white70,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 5.0),
                Text(
                  moduleItem.subjectName,
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple, fontSize: 16.0),
                ),
                Text("аудитория : ${moduleItem.classroomName}")
              ],
            ),
          ),
        )
      ],
    );
  }
}
