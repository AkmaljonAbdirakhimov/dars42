import 'package:flutter/material.dart';

class Todo {
  String title;
  DateTime date;
  bool isDone;
  Color color;

  Todo({
    required this.title,
    required this.date,
    this.isDone = false,
    this.color = Colors.teal,
  });
}
