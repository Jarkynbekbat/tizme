import 'package:flutter/material.dart';
import 'package:new_rasp_app/helpers/screen.dart';
import 'package:new_rasp_app/models/rasp_model.dart';

class RaspItemView extends StatelessWidget {
  final RaspItem raspItem;
  const RaspItemView({this.raspItem});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        width: Screen.width(context) * 0.90,
        height: Screen.heigth(context) * 0.15,
        color: Colors.lightGreen,
        margin: EdgeInsets.all(8),
        child: Flex(
          direction: Axis.horizontal,
          // crossAxisAlignment: WrapCrossAlignment.center,
          // alignment: WrapAlignment.start,
          children: [
            Flexible(
              flex: 3,
              child: Wrap(
                direction: Axis.vertical,
                children: [
                  Text(raspItem.timeFrom),
                  Text(raspItem.timeTo),
                ],
              ),
            ),
            Flexible(
              flex: 7,
              child: Wrap(
                direction: Axis.vertical,
                children: [
                  Text(raspItem.subjectName),
                  Text(
                      '${raspItem.teacherName} / ${raspItem.classroomName} / ${raspItem.lestypeName}')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
