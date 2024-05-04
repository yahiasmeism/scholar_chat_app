import 'package:flutter/material.dart';

class InputMessage extends StatelessWidget {
  const InputMessage({
    super.key,
    required this.onSubmited,
  });
  final Function(String value) onSubmited;
  @override
  Widget build(BuildContext context) {
    var formController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: formController,
        style: const TextStyle(
          fontSize: 18,
        ),
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              if (formController.text.isNotEmpty) {
                onSubmited(formController.text);
                formController.clear();
              }
            },
            icon: const Icon(Icons.send),
          ),
          contentPadding: const EdgeInsets.all(16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
