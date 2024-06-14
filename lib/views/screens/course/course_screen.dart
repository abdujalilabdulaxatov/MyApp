import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homework/views/screens/course/widgets/add_course_item.dart';
import 'package:homework/views/screens/course/widgets/course_item_vertical.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: 350,
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.search),
                        hintText: 'Search',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.widgets_rounded))
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 597,
            child: ListView.builder(
                itemCount: 20,
                itemBuilder: (ctx, index) {
                  return CourseItemVertical(
                      name: 'name', description: 'description', price: 100);
                }),
          ),
          AddCourseItem()
        ],
      ),
    );
  }
}
