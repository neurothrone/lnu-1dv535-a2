import 'package:flutter/material.dart';

import 'todo_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo List"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: const TodoContent(),
      ),
    );
  }
}
