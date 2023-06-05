import 'package:flutter/material.dart';

import '../core/constants.dart';
import '../widgets/rounded_input_button.dart';
import 'todo_list.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({Key? key}) : super(key: key);

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  List<String> _todos = [];

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
        actions: [
          IconButton(
            onPressed: _generateSampleList,
            icon: const Icon(Icons.playlist_add_rounded),
            tooltip: "Generate Sample List",
          ),
          IconButton(
            onPressed: _clearTodoList,
            icon: const Icon(Icons.clear),
            tooltip: "Clear List",
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(kPadding20),
        child: Column(
          children: [
            RoundedInputButton(
              controller: _controller,
              onPressed: _addTodo,
              buttonText: "Add",
              hintText: "ToDo",
              buttonBackgroundColor: Colors.deepPurple,
              focusedBorderColor: Colors.deepPurple,
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: kPadding10),
            TodoList(
              todos: _todos,
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
      _todos.add(title);
      _controller.clear();
    });
  }

  void _removeTodo(int index) {
    setState(() {
      _controller.text = _todos[index];
      _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length),
      );
      _todos.removeAt(index);
    });
  }

  void _generateSampleList() {
    setState(() {
      _todos = [for (var i = 0; i <= 20; i++) "Todo $i"];
    });
  }

  void _clearTodoList() {
    setState(() => _todos = []);
  }
}
