import 'package:flutter/material.dart';

class AddNoteAlertDialog extends StatelessWidget {
  AddNoteAlertDialog({super.key});
  final _globalKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final description = TextEditingController();
  final date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Add note',
        style: TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      actions: [
        Form(
            key: _globalKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter note name';
                    }
                    return null;
                  },
                  controller: name,
                  decoration: const InputDecoration(
                      hintText: 'Enter note name',
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter note description';
                    }
                    return null;
                  },
                  controller: description,
                  decoration: const InputDecoration(
                      hintText: 'Enter note description',
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  readOnly: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter date';
                    }
                    return null;
                  },
                  controller: date,
                  decoration: InputDecoration(
                      prefixIcon: IconButton(
                        onPressed: () async {
                          DateTime? _selectDate = await showDatePicker(
                              initialDate: DateTime.now(),
                              context: context,
                              firstDate: DateTime(2024),
                              lastDate: DateTime(2030));
                          if (_selectDate != null) {
                            date.text = _selectDate.toString().split(" ")[0];
                          }
                        },
                        icon: const Icon(
                          Icons.calendar_month,
                          color: Colors.blue,
                        ),
                      ),
                      hintText: 'yyyy-mm-nn',
                      border: const OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 50,
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
                              color: Colors.red,
                              fontWeight: FontWeight.w700,
                              fontSize: 17),
                        )),
                    InkWell(
                      onTap: () {
                        if (_globalKey.currentState!.validate()) {
                          Navigator.pop(context, {
                            'name': name.text,
                            'description': description.text,
                            'date': date.text
                          });
                        }
                      },
                      child: Container(
                        width: 120,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(30)),
                        child: const Center(
                          child: Text(
                            'Save',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ),
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
