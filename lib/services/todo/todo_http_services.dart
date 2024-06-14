import 'dart:convert';

import 'package:homework/models/todo_models/todo_model.dart';
import 'package:http/http.dart' as http;

class TodoHttpServices {
  Future<void> addTodo(String name, String data, bool isDone) async {
    Uri url =
        Uri.parse("https://myapp-d7f06-default-rtdb.firebaseio.com/todos.json");

    var response = await http.post(url,
        body: jsonEncode({"name": name, "data": data, "isDone": isDone}));
    print(response.body);
  }

  Future<List<TodoModel>> getTodo() async {
    Uri url =
        Uri.parse("https://myapp-d7f06-default-rtdb.firebaseio.com/todos.json");

    var response = await http.get(url);
    var data = jsonDecode(response.body);
    List<TodoModel> lst = [];
    if (data != null) {
      data.forEach((key, value) {
        lst.add(
          TodoModel(
              id: key,
              name: value['name'],
              data: value['data'],
              isDone: value['isDone']),
        );
      });
    }

    return lst;
  }

  Future<void> editTodo(String id, String name, String data) async {
    Uri url = Uri.parse(
        "https://myapp-d7f06-default-rtdb.firebaseio.com/todos/$id.json");

    var response =
        http.patch(url, body: jsonEncode({"name": name, "data": data}));
  }

  Future<void> isDoneTodo(String id, bool isDone) async {
    Uri url = Uri.parse(
        "https://myapp-d7f06-default-rtdb.firebaseio.com/todos/$id.json");

    var response = http.patch(url, body: jsonEncode({"isDone": !isDone}));
  }

  Future<void> deleteTodo(String id) async {
    Uri url = Uri.parse(
        "https://myapp-d7f06-default-rtdb.firebaseio.com/todos/$id.json");

    await http.delete(url);
  }
}
