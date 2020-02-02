//libs
import 'package:flutter/material.dart';
//components
import 'package:new_rasp_app/components/my_app_bar.dart';
import 'package:new_rasp_app/components/my_container.dart';
import 'package:new_rasp_app/helpers/show_snackbar.dart';

//services
import 'package:new_rasp_app/services/local/local_note_service.dart';

class RaspItemNoteAddPage extends StatefulWidget {
  @override
  _RaspItemNoteAddState createState() => _RaspItemNoteAddState();
}

class _RaspItemNoteAddState extends State<RaspItemNoteAddPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // subject name
    String _subject = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      key: _scaffoldKey,
      appBar: MyAppBar(
        'Добавление заметки',
        'default',
        'default',
        [
          // save button
          GestureDetector(
            onTap: () async {
              if (_noteController.text != "") {
                bool res = await LocalNoteService.addNote(
                    _subject, _noteController.text);
                res == true
                    ? showSnackBar('заметка сохранена', _scaffoldKey)
                    : showSnackBar(
                        'упс ... что то пошло не так ...', _scaffoldKey);
              } else {
                showSnackBar(
                    'Пустая заметка сохранена ... где то ...', _scaffoldKey);
              }
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(
                right: 15,
              ),
              child: Icon(Icons.check),
            ),
          )
        ],
      ),
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
              child: TextField(
                cursorColor: Theme.of(context).textTheme.body1.color,
                style:
                    TextStyle(color: Theme.of(context).textTheme.body1.color),
                controller: _noteController,
                textCapitalization: TextCapitalization.sentences,
                maxLines: 25,
                decoration: InputDecoration(
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).textTheme.body1.color,
                        width: 3.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).textTheme.body1.color,
                        width: 0.0),
                  ),
                  border: const OutlineInputBorder(),
                  labelStyle: TextStyle(
                    color: Theme.of(context).textTheme.body1.color,
                  ),
                  labelText: 'введите текст заметки...',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
