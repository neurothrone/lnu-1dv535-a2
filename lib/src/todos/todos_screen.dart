import 'package:flutter/material.dart';

import '../core/constants.dart';
import 'add_todo_input.dart';
import 'todo_list.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({Key? key}) : super(key: key);

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  List<String> todos = [];

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
        actions: [],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(kPadding20),
        child: Column(
          children: [
            AddTodoInput(
              controller: _controller,
              onAddTodo: _addTodo,
            ),
            const SizedBox(height: kPadding10),
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
      _controller.text = todos[index];
      _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length),
      );
      todos.removeAt(index);
    });
  }
}
