import 'dart:convert';

import 'package:homework/models/note_models/note_models.dart';
import 'package:http/http.dart' as http;

class NoteHttpServices {
  Future<List<NoteModels>> getNote() async {
    Uri url =
        Uri.parse("https://myapp-d7f06-default-rtdb.firebaseio.com/notes.json");
    var response = await http.get(url);
    var data = jsonDecode(response.body);
    List<NoteModels> lst = [];
    if (data != null) {
      data.forEach((key, value) {
        lst.add(NoteModels(
            id: key,
            name: value['name'],
            description: value['description'],
            date: value['date']));
      });
    }
    return lst;
  }

  Future<void> addNote(String name, String description, String date) async {
    Uri url =
        Uri.parse("https://myapp-d7f06-default-rtdb.firebaseio.com/notes.json");
    await http.post(url,
        body: jsonEncode(
            {"name": name, "description": description, "date": date}));
  }

  Future<void> editNote(
      String id, String name, String description, String date) async {
    Uri url = Uri.parse(
        "https://myapp-d7f06-default-rtdb.firebaseio.com/notes/$id.json");
    await http.patch(url,
        body: jsonEncode(
            {"name": name, "description": description, "date": date}));
  }

  Future<void> deleteNote(String id) async {
    Uri url = Uri.parse(
        "https://myapp-d7f06-default-rtdb.firebaseio.com/notes/$id.json");
    print(id);
    await http.delete(url);
  }
}
