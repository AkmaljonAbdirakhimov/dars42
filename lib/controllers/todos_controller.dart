import 'dart:math';

import 'package:dars42/models/todo.dart';
import 'package:flutter/material.dart';

class TodosController {
  List<Todo> todos = [
    Todo(
      title: "Maktabga borish",
      date: DateTime.now(),
      color: Colors.red,
    ),
  ];

  void addTodo(String title, DateTime date) {
    int red = Random().nextInt(255);
    int green = Random().nextInt(255);
    int blue = Random().nextInt(255);

    todos.add(
      Todo(
        title: title,
        date: date,
        color: Color.fromRGBO(red, green, blue, 1),
      ),
    );
  }
}
