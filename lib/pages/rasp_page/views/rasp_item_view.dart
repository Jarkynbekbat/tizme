import 'package:flutter/material.dart';
import 'package:new_rasp_app/helpers/screen.dart';
import 'package:new_rasp_app/models/rasp_model.dart';
import 'package:photo_view/photo_view.dart';

class RaspItemView extends StatelessWidget {
  final RaspItem raspItem;
  RaspItemView({this.raspItem});

  final timeTextStyle = TextStyle(
      fontSize: 25.0,
      fontWeight: FontWeight.normal,
      fontFamily: "Niagara Solid");

  final raspTopTextStyle = new TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    fontFamily: "Roboto",
  );

  final raspBottomTextStyle = new TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w300,
    fontFamily: "Roboto",
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              height: 200,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.photo_library,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      title: Text(
                        'Галерея',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.body1.color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        //to photos of this subject
                        Navigator.of(context).pop();
                        Navigator.of(context).pushNamed(
                          '/rasp_item_photos',
                          arguments: raspItem.subjectName,
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.note,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      title: Text(
                        'Заметки',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.body1.color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        //to notes of this subject
                        Navigator.of(context).pop();
                        Navigator.of(context).pushNamed(
                          '/rasp_item_notes',
                          arguments: raspItem.subjectName,
                        );
                      },
                    ),
                    Hero(
                      tag: 'classroom_tag',
                      child: ListTile(
                        enabled: false,
                        subtitle: Text(
                          'в разработке',
                          style: TextStyle(
                              color: Theme.of(context).iconTheme.color),
                        ),
                        leading: Icon(
                          Icons.location_on,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        title: Text(
                          'Путь к аудитории',
                          style: TextStyle(
                            color: Theme.of(context).textTheme.body1.color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () async {
                          Navigator.of(context).pop();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ClassroomHero(
                                AssetImage('./lib/assets/no-img.png'),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        // height: Screen.isPortrait(context)
        //     ? Screen.heigth(context) * 0.15
        //     : Screen.heigth(context) * 0.25,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).dividerColor,
              blurRadius: 10.0, // has the effect of softening the shadow
              spreadRadius: 0.0, // has the effect of extending the shadow
              offset: Offset(0, 0),
            )
          ],
        ),
        child: Card(
          color: Theme.of(context).appBarTheme.color,
          key: null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.only(right: 10, left: 8),
                  decoration: BoxDecoration(
                      border:
                          Border(right: BorderSide(color: Color(0xFFECEBF3)))),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(raspItem.timeFrom, style: timeTextStyle),
                        Text(raspItem.timeTo, style: timeTextStyle)
                      ]),
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        raspItem.subjectName,
                        style: raspTopTextStyle,
                        overflow: TextOverflow.fade,
                        softWrap: true,
                      ),
                      SizedBox(height: 4),
                      Text(
                        "${raspItem.teacherName} / ${raspItem.classroomName} / ${raspItem.lestypeName}",
                        style: raspBottomTextStyle,
                        overflow: TextOverflow.fade,
                        softWrap: true,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ClassroomHero extends StatelessWidget {
  final _image;
  ClassroomHero(this._image);
  @override
  Widget build(BuildContext context) {
    imageCache.clear();
    // subject name
    return Hero(
      tag: 'classroom_tag',
      child: PhotoView(
        enableRotation: true,
        imageProvider: _image,
      ),
    );
  }
}
