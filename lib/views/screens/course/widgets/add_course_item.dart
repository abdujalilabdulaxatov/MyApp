import 'package:flutter/material.dart';

class AddCourseItem extends StatefulWidget {
  const AddCourseItem({super.key});

  @override
  State<AddCourseItem> createState() => _AddCourseItemState();
}

class _AddCourseItemState extends State<AddCourseItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
