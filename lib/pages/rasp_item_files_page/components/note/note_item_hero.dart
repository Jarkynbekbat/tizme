import 'dart:async';

import 'package:flutter/material.dart';
//components
import 'package:new_rasp_app/components/my_app_bar.dart';
import 'package:new_rasp_app/components/my_container.dart';
import 'package:new_rasp_app/helpers/show_snackbar.dart';
//services
import 'package:new_rasp_app/services/local/local_note_service.dart';

class NoteItemHero extends StatefulWidget {
  static const String route = '/note_item_hero';
  @override
  _NoteItemHeroState createState() => _NoteItemHeroState();
}

class _NoteItemHeroState extends State<NoteItemHero> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void updateNote(subject, obj) async {
    bool res = await LocalNoteService.updateNote(subject, obj);
    res == true
        ? showSnackBar('заметка успешно изменена.', _scaffoldKey)
        : showSnackBar('упс ... что то пошло не так ...', _scaffoldKey);
    Timer(
      Duration(seconds: 1),
      () => Navigator.pop(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> _note = ModalRoute.of(context).settings.arguments;

    return Container(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: MyAppBar(_note['obj']['date'], 'default', 'default', [
          GestureDetector(
            onTap: () => updateNote(_note['subject'], _note['obj']),
            child: Container(
              margin: EdgeInsets.only(
                right: 15,
              ),
              child: Icon(Icons.check),
            ),
          )
        ]),
        body: MyContainer(
          [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).dividerColor,
                    blurRadius: 10.0, // has the effect of softening the shadow
                    // spreadRadius: 0.0, // has the effect of extending the shadow
                    offset: Offset(
                      0, // horizontal, move right 10
                      0, // vertical, move down 10
                    ),
                  )
                ],
              ),
              child: Card(
                color: Theme.of(context).appBarTheme.color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextFormField(
                  cursorColor: Theme.of(context).textTheme.body1.color,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.body1.color,
                  ),
                  controller: null,
                  initialValue: _note['obj']['content'],
                  onChanged: (text) => _note['obj']['content'] = text,
                  textCapitalization: TextCapitalization.sentences,
                  maxLines: 25,
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).textTheme.body1.color, width: 3.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).textTheme.body1.color, width: 0.0),
                    ),
                    border: const OutlineInputBorder(),
                    labelStyle: TextStyle(
                      color: Theme.of(context).textTheme.body1.color,
                    ),
                    labelText: 'введите текст заметки...',
                    fillColor: Theme.of(context).textTheme.body1.color,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
