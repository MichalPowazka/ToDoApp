import 'package:flutter/material.dart';
import 'package:to_do_app/components/custom_button.dart';

class NewToDo extends StatelessWidget {
  final controller;
  VoidCallback onSave;

  NewToDo({super.key, required this.controller, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Task'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FractionallySizedBox(
              widthFactor: 0.8,
              child: TextField(
                controller: controller,
                maxLines: 6,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Add a new Task",
                ),
              ),
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: 'Save',
              iconData: Icons.save,
              onPressed: onSave,
            ),
          ],
        ),
      ),
    );
  }
}
