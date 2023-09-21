import 'package:flutter/material.dart';
import 'package:todo_list_app/utilites/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  const DialogBox({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple[200],
      content: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add New Task',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(onPressed: onSave, text: 'Save'),
                const Spacer(),
                MyButton(onPressed: onCancel, text: 'Cancel'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
