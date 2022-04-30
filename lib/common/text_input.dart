import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final String hint;
  final Function(String)? onchange;
  const TextInput({ Key? key, required this.hint, required this.onchange }) : super(key: key);

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: widget.hint,
      ),
      onChanged: widget.onchange,
    );
  }
}