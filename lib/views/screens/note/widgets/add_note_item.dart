import 'package:flutter/material.dart';
import 'package:homework/controllers/note%20controller/note_controller.dart';
import 'package:homework/views/screens/note/widgets/add_note_alert_dialog.dart';

class AddNoteItem extends StatefulWidget {
  AddNoteItem({super.key});

  @override
  State<AddNoteItem> createState() => _AddNoteItemState();
}

class _AddNoteItemState extends State<AddNoteItem> {
  final noteController = NoteController();

  @override
  void initState() {
    super.initState();

    noteController.getNote();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        Map<String, dynamic> data = await showDialog(
            context: context, builder: (context) => AddNoteAlertDialog());
        noteController.addNote(data['name'], data['description'], data['date']);
      },
      child: Container(
        width: 250,
        height: 50,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 7, 195, 35),
            borderRadius: BorderRadius.circular(30)),
        child: const Center(
          child: Icon(
            Icons.add,
            size: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
