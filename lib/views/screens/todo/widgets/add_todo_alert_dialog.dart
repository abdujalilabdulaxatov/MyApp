import 'package:flutter/material.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final _globalKey = GlobalKey<FormState>();
  final _todoNameController = TextEditingController();
  final _todoDataController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Add todo',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      actions: [
        Form(
            key: _globalKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _todoNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter todo name';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      hintText: 'Enter todo name',
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _todoDataController,
                  readOnly: true,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter correct information';
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () async {
                            DateTime? _time = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2030));
                            if (_time != null) {
                              _todoDataController.text =
                                  _time.toString().split(' ')[0];
                            }
                          },
                          icon: const Icon(Icons.calendar_month)),
                      hintText: 'yyyy-mm-dd',
                      labelText: "Sanani tanlang",
                      border: const OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Cansel',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                              fontWeight: FontWeight.w600),
                        )),
                    InkWell(
                      onTap: () {
                        if (_globalKey.currentState!.validate()) {
                          Navigator.pop(context, {
                            'name': _todoNameController.text,
                            'date': _todoDataController.text == ''
                                ? ''
                                : _todoDataController.text
                          });
                        }
                      },
                      child: Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                            child: Text(
                          'Save',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        )),
                      ),
                    )
                  ],
                )
              ],
            ))
      ],
    );
  }
}
