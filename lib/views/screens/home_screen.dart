import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homework/views/screens/course/course_screen.dart';
import 'package:homework/views/screens/note/note_screen.dart';
import 'package:homework/views/screens/todo/dashboard.dart';
import 'package:homework/views/screens/todo/todo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> pages = [
    TabBarView(children: [Todo(), Dashboard()]),
    NoteScreen(),
    CourseScreen(),
  ];
  int index = 1;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              backgroundColor: Colors.amber,
              title: const Text(
                'My App',
                style:
                    TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
              ),
              bottom: index == 0
                  ? const TabBar(tabs: [
                      Tab(
                        child: Text(
                          'Todo',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Dashboard',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ),
                    ])
                  : null),
          body: pages[index],
          bottomNavigationBar: Container(
            width: double.infinity,
            height: 100,
            color: Colors.amber,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          index = 0;
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.calendar_today_sharp,
                          color: index == 0 ? Colors.blue : Colors.black,
                          size: 30,
                        )),
                    Text(
                      'Todo',
                      style: TextStyle(
                        color: index == 0 ? Colors.blue : Colors.black,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          index = 1;
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.note,
                          color: index == 1 ? Colors.blue : Colors.black,
                          size: 30,
                        )),
                    Text(
                      'Note',
                      style: TextStyle(
                        color: index == 1 ? Colors.blue : Colors.black,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          index = 2;
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.book_rounded,
                          color: index == 2 ? Colors.blue : Colors.black,
                          size: 30,
                        )),
                    Text(
                      'Course',
                      style: TextStyle(
                        color: index == 2 ? Colors.blue : Colors.black,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          index = 3;
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.contact_emergency,
                          color: index == 3 ? Colors.blue : Colors.black,
                          size: 30,
                        )),
                    Text(
                      'Contact',
                      style: TextStyle(
                        color: index == 3 ? Colors.blue : Colors.black,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          index = 4;
                        },
                        icon: const Icon(
                          CupertinoIcons.person_alt_circle_fill,
                          color: Colors.black,
                          size: 30,
                        )),
                    const Text(
                      'Profile',
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
