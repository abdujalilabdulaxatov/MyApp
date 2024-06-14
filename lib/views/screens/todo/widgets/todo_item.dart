import 'package:flutter/material.dart';
import 'package:homework/controllers/Todo%20controller/todo_controller.dart';
import 'package:homework/models/todo_models/todo_model.dart';

class TodoItem extends StatefulWidget {
  final TodoModel todo;
  final int index;
  final Function() onDelete;
  final Function() onEdit;

  TodoItem({
    super.key,
    required this.todo,
    required this.index,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  final todoController = TodoController();

  @override
  Widget build(BuildContext context) {
    double screenW = MediaQuery.of(context).size.width;

    return ListTile(
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "${widget.index + 1}",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: screenW * 0.04),
          ),
          IconButton(
              onPressed: () async {
                await todoController.isDoneEditTodo(
                  widget.todo.id,
                  widget.todo.isDone,
                );
                widget.todo.isDone = !widget.todo.isDone;
                setState(() {});
              },
              icon: Icon(
                widget.todo.isDone
                    ? Icons.check_circle_outline
                    : Icons.circle_outlined,
                color: widget.todo.isDone ? Colors.green : null,
              ))
        ],
      ),
      title: Text(
        widget.todo.name,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: screenW * 0.05,
            decorationColor: Colors.red,
            decorationThickness: 1.5,
            decoration: widget.todo.isDone ? TextDecoration.lineThrough : null),
      ),
      subtitle: Text(widget.todo.data),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: widget.onEdit,
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
    );
    ;
  }
}
