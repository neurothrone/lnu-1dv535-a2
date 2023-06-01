import 'package:flutter/material.dart';

import 'add_todo_input.dart';
import 'todo_list.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({Key? key}) : super(key: key);

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  List<String> todos = [
    "Buy groceries",
    "Walk the dog",
    "Finish Flutter project",
    "Study for exam",
    "Clean the house",
    "Pay bills",
    "Go to the gym",
    "Read a book",
    "Prepare dinner",
    "Buy groceries",
    "Walk the dog",
    "Finish Flutter project",
    "Study for exam",
    "Clean the house",
    "Pay bills",
    "Go to the gym",
    "Read a book",
    "Prepare dinner",
  ];

  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo List"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        // child: TodoContent(),
        child: Column(
          children: [
            AddTodoInput(
              controller: _controller,
              onAddTodo: _addTodo,
            ),
            const SizedBox(height: 10.0),
            TodoList(
              todos: todos,
              onTapTodo: _removeTodo,
            ),
          ],
        ),
      ),
    );
  }

  void _addTodo() {
    final title = _controller.text;
    if (title.isEmpty) return;

    setState(() {
      todos.add(title);
      _controller.clear();
    });
  }

  void _removeTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }
}
