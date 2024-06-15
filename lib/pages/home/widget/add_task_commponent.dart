import 'package:flutter/cupertino.dart';

import '../../widget/custom_text_field.dart';

class AddTaskCommponent extends StatelessWidget {
  AddTaskCommponent({super.key, required this.controller, required this.text});

  final TextEditingController controller;

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: controller,
          hint: text,
          onValidate: (text) {
            if (text == null || text.trim().isEmpty) {
              return "please enter your Name";
            }
            return null;
          },
          keyboardType: TextInputType.text,
        ),
      ],
    );
  }
}
