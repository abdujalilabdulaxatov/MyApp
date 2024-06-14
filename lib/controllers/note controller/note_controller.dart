import 'package:homework/models/note_models/note_models.dart';
import 'package:homework/services/note/note_http_services.dart';

class NoteController {
  final noteHttpServices = NoteHttpServices();
  List<NoteModels> lst = [];

  Future<void> getNote() async {
    lst = await noteHttpServices.getNote();
    print(lst[0].description);
  }

  Future<void> addNote(String name, String description, String date) async {
    noteHttpServices.addNote(name, description, date);
  }

  Future<void> editNote(
      String id, String name, String description, String date) async {
    noteHttpServices.editNote(id, name, description, date);
  }

  Future<void> deleteNote(String id) async {
    noteHttpServices.deleteNote(id);
  }
}
