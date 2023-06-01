import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
    required this.todos,
    required this.onTapTodo,
  });

  final List<String> todos;
  final Function(int index) onTapTodo;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return ListTile(
            title: Text(todo),
            onTap: () => onTapTodo(index),
          );
        },
      ),
    );
  }
}
