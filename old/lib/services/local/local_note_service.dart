import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalNoteService {
  static Future<bool> addNote(subject, note) async {
    // note content to json note
    var noteObj = {
      'date': DateTime.now().toUtc().toLocal().toString(),
      'content': note,
    };
    //get notes of this subject
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList(subject) == null) {
      //if dont have notes , create array  and push there
      return prefs.setStringList(subject, [json.encode(noteObj)]);
    } else {
      //if we have notes , add new note there
      var noteList = prefs.getStringList(subject);
      noteList.insert(0, json.encode(noteObj));
      return prefs.setStringList(subject, noteList);
    }
  }

  static Object getNoteByDate(subject, date) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //get all list
    var list = prefs.getStringList(subject);
    //find item where date == date from params
    var findedItem = list.singleWhere((item) => json.decode(item)['date'] == date);
    // string to JSON
    return json.decode(findedItem);
  }

  static Future<bool> deleteNoteByDate(subject, date) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var list = prefs.getStringList(subject);
    list.removeWhere((item) => json.decode(item)['date'] == date);
    return prefs.setStringList(subject, list);
  }

  static getAllNotes(subject) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var list = prefs.getStringList(subject);
    if (list != null) {
      // JSONS
      var notes = [];
      // strings to JSONs
      list.forEach((item) => notes.add(json.decode(item)));
      return notes;
    }
    return [];
  }

  static Future<bool> updateNote(subject, obj) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var list = prefs.getStringList(subject);
    list.removeWhere((item) => json.decode(item)['date'] == obj['date']);
    list.add(json.encode(obj));
    return prefs.setStringList(subject, list);
  }
}
