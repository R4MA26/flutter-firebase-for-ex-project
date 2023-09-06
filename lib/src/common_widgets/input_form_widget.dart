import 'package:flutter/material.dart';

class InputFormWidget extends StatelessWidget {
  const InputFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        // controller: _textEditingController,
        decoration: InputDecoration(
          labelText: 'Enter some text',
        ),
      ),
    );
  }
}
