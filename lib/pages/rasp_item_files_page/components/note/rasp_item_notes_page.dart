import 'package:flutter/material.dart';
import 'package:new_rasp_app/components/my_app_bar.dart';
import 'package:new_rasp_app/pages/rasp_item_files_page/components/note/note_item.dart';
import 'package:new_rasp_app/services/local/local_note_service.dart';

class RaspItemNotesPage extends StatefulWidget {
  @override
  _RaspItemNoteAddState createState() => _RaspItemNoteAddState();
}

class _RaspItemNoteAddState extends State<RaspItemNotesPage> {
  var searchController = new TextEditingController();

  var _notes;

  // json to view
  getNoteItems(subject) async {
    var notes = <Widget>[];
    List<dynamic> list;
    list = list == null ? await LocalNoteService.getAllNotes(subject) : list;

    var onDelete = (obj, date) async {
      await LocalNoteService.deleteNoteByDate(subject, obj['date']);
      list.removeWhere((el) => el['date'] == date);
      getNoteItems(subject);
    };

    list.forEach(
      (obj) => notes.add(
        NoteItem(obj, subject, onDelete),
      ),
    );
    setState(() => _notes = notes);
  }

  @override
  Widget build(BuildContext context) {
    String _subject = ModalRoute.of(context).settings.arguments;
    getNoteItems(_subject);

    return Scaffold(
      appBar: MyAppBar(
        'Заметки',
        'default',
        'default',
        [
          Container(
            margin: EdgeInsets.only(
              right: 15,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed('/rasp_item_note_add', arguments: '$_subject');
              },
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 6, left: 10, right: 10),
        child: Column(
          children: _notes != null ? _notes : [],
        ),
      ),
    );
  }
}
