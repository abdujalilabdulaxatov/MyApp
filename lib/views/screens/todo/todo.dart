import 'package:flutter/material.dart';
import 'package:homework/controllers/Todo%20controller/todo_controller.dart';
import 'package:homework/views/screens/todo/widgets/add_todo_alert_dialog.dart';
import 'package:homework/views/screens/todo/widgets/todo_item.dart';

class Todo extends StatefulWidget {
  Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  final todoController = TodoController();

  @override
  void initState() {
    super.initState();

    getTodos();
  }

  void getTodos() async {
    await todoController.getTodo();
    setState(() {});
  }

  void editTodo(String id, String name, String date) {
    todoController.edit(id, name, date);
    getTodos();
  }

  void deleteTodo(String id) async {
    await todoController.delete(id);
    getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            height: 615,
            child: ListView.builder(
                itemCount: todoController.lst.length,
                itemBuilder: (BuildContext context, int index) {
                  return TodoItem(
                    todo: todoController.lst[index],
                    index: index,
                    onDelete: () {
                      deleteTodo(todoController.lst[index].id);
                    },
                    onEdit: () async {
                      Map<String, dynamic> data = await showDialog(
                          context: context, builder: (ctx) => AddTodo());
                      getTodos();

                      editTodo(todoController.lst[index].id, data['name'],
                          data['date']);
                    },
                  );
                }),
          ),
          InkWell(
            onTap: () async {
              Map<String, dynamic> data = await showDialog(
                context: context,
                builder: (ctx) => const AddTodo(),
              );
              if (data['name'] != null) {
                if (data['date'] != '') {
                  await todoController.add(data['name'], data['date'], false);
                } else {
                  await todoController.add(data['name'],
                      DateTime.now().toString().split(' ')[0], false);
                }
                getTodos();
              }
            },
            child: Container(
              width: 250,
              height: 50,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 7, 195, 35),
                  borderRadius: BorderRadius.circular(30)),
              child: const Icon(
                Icons.add,
                size: 40,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
