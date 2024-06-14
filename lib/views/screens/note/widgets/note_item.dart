import 'package:flutter/material.dart';
import 'package:homework/controllers/note%20controller/note_controller.dart';
import 'package:homework/models/note_models/note_models.dart';
import 'package:homework/views/screens/note/note_description.dart';
import 'package:homework/views/screens/note/widgets/add_note_alert_dialog.dart';

class NoteItem extends StatefulWidget {
  final NoteModels note;
  final int index;
  final Function() onDelete;

  NoteItem({
    super.key,
    required this.note,
    required this.index,
    required this.onDelete,
  });

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  final noteController = NoteController();

  @override
  Widget build(BuildContext context) {
    double screenW = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (ctx) => NoteDescription(
                    name: widget.note.name,
                    description: widget.note.description,
                    date: widget.note.date)));
      },
      child: ListTile(
        leading: Text(
          "${widget.index + 1}",
          style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: screenW * 0.04),
        ),
        title: Text(
          widget.note.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: screenW * 0.05,
          ),
        ),
        subtitle: Text(widget.note.date),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                onPressed: () async {
                  Map<String, dynamic> data = await showDialog(
                      context: context, builder: (ctx) => AddNoteAlertDialog());
                  noteController.editNote(widget.note.id, data['name'],
                      data['description'], data['date']);
                },
                icon: const Icon(
                  Icons.edit,
                  color: Colors.blue,
                )),
            IconButton(
                onPressed: widget.onDelete,
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
          ],
        ),
      ),
    );
  }
}
