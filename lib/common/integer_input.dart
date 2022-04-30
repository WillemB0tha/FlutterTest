import 'package:flutter/material.dart';

class IntegerInput extends StatefulWidget {
  final String hint;
  final Function(String)? onchange;

  const IntegerInput({ Key? key, required this.hint, required this.onchange }) : super(key: key);

  @override
  State<IntegerInput> createState() => _IntegerInputState();
}

class _IntegerInputState extends State<IntegerInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(decimal: false),
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: widget.hint,
      ),
      onChanged: widget.onchange,
    );
  }
}