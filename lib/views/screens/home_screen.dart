import 'package:dars42/controllers/todos_controller.dart';
import 'package:dars42/models/todo.dart';
import 'package:dars42/views/widgets/add_todo_dialog.dart';
import 'package:dars42/views/widgets/todo_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final todosController = TodosController();

  void add() async {
    Map<String, dynamic>? data = await showDialog(
      context: context,
      builder: (ctx) {
        return const AddTodoDialog();
      },
    );

    if (data != null) {
      todosController.addTodo(data['title'], data['date']);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rejalar"),
        actions: [
          IconButton(
            onPressed: add,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Text("SALOM"),
          Container(
            child: Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/2018_06_TropicalIslands_IMG_2078.jpg/1200px-2018_06_TropicalIslands_IMG_2078.jpg",
            ),
          ),
          // CircularProgressIndicator(),
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: todosController.todos.length,
          //     itemBuilder: (ctx, index) {
          //       Todo todo = todosController.todos[index];
          //       return TodoItem(todo: todo);
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
