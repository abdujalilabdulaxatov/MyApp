// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CourseItemVertical extends StatefulWidget {
  String name;
  String description;
  double price;
  CourseItemVertical({
    Key? key,
    required this.name,
    required this.description,
    required this.price,
  }) : super(key: key);

  @override
  State<CourseItemVertical> createState() => _CourseItemVerticalState();
}

class _CourseItemVerticalState extends State<CourseItemVertical> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.heart,
              color: Colors.red,
            )),
        title: Text(
          widget.name,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        subtitle: Text(
          "\$${widget.price.toString()}",
          style:
              const TextStyle(color: Colors.green, fontWeight: FontWeight.w600),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit,
                  color: Colors.blue,
                )),
            IconButton(
                onPressed: () {},
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
