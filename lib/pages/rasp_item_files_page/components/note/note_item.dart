import 'package:flutter/material.dart';
import 'package:new_rasp_app/components/my_item.dart';

class NoteItem extends StatelessWidget {
  final _obj;
  final String _subject;
  final Function _onDelete;
  const NoteItem(this._obj, this._subject, this._onDelete);

// crop and put ...
  String flexing(String content) {
    if (content.length > 24)
      return content.substring(0, 24) + ' [...]';
    else
      return content;
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: _obj['date'],
      child: Dismissible(
        key: ValueKey(_obj.toString()),
        background: Container(
          color: Colors.red,
          child: Icon(
            Icons.delete_outline,
            color: Colors.white,
            size: 30,
          ),
        ),
        onDismissed: (DismissDirection key) async {
          try {
            await _onDelete(_obj, _obj['date']);
          } catch (e) {
            print(e);
          }
        },
        child: MyItem(
          Row(
            children: <Widget>[
              Icon(
                Icons.insert_drive_file,
                size: 30,
                color: Theme.of(context).iconTheme.color,
              ),
              Text(''),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Wrap(
                  spacing: 5.0,
                  runSpacing: 5.0,
                  direction: Axis.vertical, // main axis (rows or columns)
                  children: [
                    Text(
                      flexing(_obj['content']),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      overflow: TextOverflow.clip,
                      // softWrap: true,
                    ),
                    Text(
                      _obj['date']
                          .substring(0, 16)
                          .replaceFirst(' ', '          '),
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text(''),
          70,
          () {
            Navigator.of(context).pushNamed(
              '/note_item_hero',
              arguments: {
                'obj': _obj,
                'subject': _subject,
              },
            );
          },
        ),
      ),
    );
  }
}
