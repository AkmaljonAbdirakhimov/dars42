import 'package:flutter/material.dart';

class AddTodoDialog extends StatefulWidget {
  const AddTodoDialog({super.key});

  @override
  State<AddTodoDialog> createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  final titleController = TextEditingController();
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Reja qo'shing"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Reja",
            ),
          ),
          Row(
            children: [
              Text(selectedDate != null
                  ? selectedDate.toString()
                  : "Sana belgilanmagan"),
              TextButton(
                onPressed: () async {
                  selectedDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(3000),
                  );
                  if (selectedDate != null) {
                    setState(() {});
                  }
                },
                child: const Text("Kunni tanlang"),
              ),
            ],
          )
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Bekor qilish"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, {
              "title": titleController.text,
              "date": selectedDate,
            });
          },
          child: const Text("Qo'shish"),
        ),
      ],
    );
  }
}
