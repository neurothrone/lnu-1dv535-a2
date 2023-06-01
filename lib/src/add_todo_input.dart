import 'package:flutter/material.dart';

import 'constants.dart';

class AddTodoInput extends StatelessWidget {
  const AddTodoInput({
    super.key,
    required this.controller,
    required this.onAddTodo,
  });

  final TextEditingController controller;
  final VoidCallback onAddTodo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AddTodoTextField(
          onSubmitted: onAddTodo,
          controller: controller,
        ),
        AddTodoButton(
          onTap: onAddTodo,
          controller: controller,
        ),
      ],
    );
  }
}

class AddTodoTextField extends StatelessWidget {
  const AddTodoTextField({
    super.key,
    required this.onSubmitted,
    required this.controller,
  });

  final TextEditingController controller;
  final VoidCallback onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: kInputHeight,
        child: TextField(
          controller: controller,
          textAlign: TextAlign.start,
          style: const TextStyle(color: Colors.black),
          decoration: const InputDecoration(
            fillColor: Colors.white,
            filled: true,
            labelText: "ToDo title",
            labelStyle: TextStyle(color: Colors.deepPurple),
          ),
          onSubmitted: (_) => onSubmitted(),
        ),
      ),
    );
  }
}

class AddTodoButton extends StatefulWidget {
  const AddTodoButton({
    super.key,
    required this.onTap,
    required this.controller,
  });

  final VoidCallback onTap;
  final TextEditingController controller;

  @override
  State<AddTodoButton> createState() => _AddTodoButtonState();
}

class _AddTodoButtonState extends State<AddTodoButton> {
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();

    // Add a listener on controller to enable/disable button
    widget.controller.addListener(() {
      setState(() {
        isButtonEnabled = widget.controller.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: !isButtonEnabled ? Colors.black54 : Colors.deepPurple,
      shape: const RoundedRectangleBorder(
        borderRadius: kRightBorderRadius,
      ),
      child: InkWell(
        onTap: !isButtonEnabled
            ? null
            : () {
                widget.onTap();
                FocusScope.of(context).unfocus();
              },
        borderRadius: kRightBorderRadius,
        splashColor: Colors.deepPurple.shade700,
        child: Container(
          height: kInputHeight,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            borderRadius: kRightBorderRadius,
          ),
          child: Text(
            "Add ToDo",
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
