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
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return ListTile(
          onTap: () => onTapTodo(index),
          contentPadding: const EdgeInsets.all(0),
          title: Text(todo),
        );
      },
    );
  }
}
