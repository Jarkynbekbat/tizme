import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';

import '../../../../components/my_item.dart';

class PhotoItem extends StatelessWidget {
  final File _photo;
  final Function _onDelete;
  const PhotoItem(this._photo, this._onDelete);

// crop and put ...
  String flexing(String content) {
    if (content.length > 16)
      return content.substring(0, 16).replaceFirst(' ', '                    ');
    else
      return content;
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(_photo.toString()),
      background: Container(
        color: Colors.red,
        child: Icon(
          Icons.delete_outline,
          color: Colors.white,
          size: 30,
        ),
      ),
      onDismissed: (DismissDirection key) async {
        await _onDelete(_photo);
      },
      child: MyItem(
        Hero(
          tag: 'my-hero-animation-tag-${basename(_photo.path)}',
          child: Material(
            type: MaterialType.transparency,
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.photo,
                  size: 30,
                  color: Theme.of(context).iconTheme.color,
                ),
                Text(''),
                Container(
                  margin: EdgeInsets.only(left: 25),
                  child: Wrap(
                    spacing: 5.0,
                    runSpacing: 5.0,
                    direction: Axis.vertical, // main axis (rows or columns)
                    children: [
                      Text(
                        flexing(basename(_photo.path)),
                        style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                        overflow: TextOverflow.clip,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Text(''),
        70,
        //open file
        () async {
          Navigator.of(context).pushNamed(
            '/photo_item_hero',
            arguments: _photo,
          );
        },
      ),
    );
  }
}
