import 'package:flutter/material.dart';
import 'package:homework/controllers/Todo%20controller/todo_controller.dart';

class Dashboard extends StatefulWidget {
  Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final todoController = TodoController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: FutureBuilder(
                future: todoController.todoChecks(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return const Center(
                      child: Text('Malumotlar mavjud emas !'),
                    );
                  } else {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const Text(
                              'Bajarilgan',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.green),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 170,
                              height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: const LinearGradient(
                                      colors: [Colors.green, Colors.blue])),
                              child: Center(
                                  child: Text(
                                snapshot.data!['true']!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              'Bajarilmagan',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.red),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 170,
                              height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: const LinearGradient(
                                      colors: [Colors.red, Colors.blue])),
                              child: Center(
                                  child: Text(
                                snapshot.data!['false']!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          ],
                        )
                      ],
                    );
                  }
                }),
          )
        ],
      ),
    );
  }
}
