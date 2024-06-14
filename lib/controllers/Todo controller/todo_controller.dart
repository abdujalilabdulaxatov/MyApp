import 'package:homework/models/todo_models/todo_model.dart';
import 'package:homework/services/todo/todo_http_services.dart';

class TodoController {
  final todoHttpServices = TodoHttpServices();

  List<TodoModel> lst = [];

  Future<void> add(String name, String data, bool isDone) async {
    todoHttpServices.addTodo(
      name,
      data,
      isDone,
    );
  }

  Future<void> delete(String id) async {
    await todoHttpServices.deleteTodo(id);
  }

  Future<void> getTodo() async {
    lst = await todoHttpServices.getTodo();
  }

  Future<void> edit(String id, String name, String date) async {
    todoHttpServices.editTodo(id, name, date);
    getTodo();
  }

  Future<void> isDoneEditTodo(String id, bool isDone) async {
    await todoHttpServices.isDoneTodo(id, isDone);
  }

  Future<Map<String, String>> todoChecks() async {
    int exerciseTrue = 0;
    int exerciseFalse = 0;
    await getTodo();
    for (var element in lst) {
      if (element.isDone) {
        exerciseTrue++;
      } else {
        exerciseFalse++;
      }
    }
    print(exerciseFalse);

    return {'true': exerciseTrue.toString(), 'false': exerciseFalse.toString()};
  }
}
