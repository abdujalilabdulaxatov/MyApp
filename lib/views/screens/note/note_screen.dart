import 'package:flutter/material.dart';
import 'package:homework/controllers/note%20controller/note_controller.dart';
import 'package:homework/models/note_models/note_models.dart';
import 'package:homework/views/screens/note/widgets/add_note_alert_dialog.dart';
import 'package:homework/views/screens/note/widgets/add_note_item.dart';
import 'package:homework/views/screens/note/widgets/note_item.dart';

class NoteScreen extends StatefulWidget {
  NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final noteController = NoteController();
  @override
  void initState() {
    super.initState();
    getNotes();
  }

  void getNotes() async {
    await noteController.getNote();
    setState(() {});
  }

  void editNote() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          width: double.infinity,
          height: 663,
          child: ListView.builder(
              itemCount: noteController.lst.length,
              itemBuilder: (ctx, index) {
                var data = noteController.lst[index];
                return NoteItem(
                  index: index,
                  onDelete: () {
                    noteController.deleteNote(data.id);
                  },
                  note: NoteModels(
                      date: data.date,
                      name: data.name,
                      description: data.description,
                      id: data.id),
                );
              }),
        ),
        AddNoteItem()
      ],
    ));
  }
}
