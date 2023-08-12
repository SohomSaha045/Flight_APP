import 'package:flight_app/utils/colors.dart';
import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hint;
  final TextInputType textInputType;
  final int font;

  const TextFieldInput(
      {super.key,
      required this.textEditingController,
      this.isPass = false,
      required this.hint,
      required this.textInputType,
      this.font = 14});

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
      style: TextStyle(color: primaryBlueText, fontSize: font.toDouble()),
      controller: textEditingController,
      decoration: InputDecoration(
        // labelText: "email",
        // fillColor: secondaryColor,/
        hintStyle: TextStyle(color: primaryBlueText),
        hintText: hint,

        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(8),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
