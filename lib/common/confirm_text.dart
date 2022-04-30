import 'package:flutter/material.dart';

class ConfirmText extends StatefulWidget {
  final String text;
  
  const ConfirmText({ Key? key, required this.text }) : super(key: key);

  @override
  State<ConfirmText> createState() => _ConfirmTextState();
}

class _ConfirmTextState extends State<ConfirmText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.text,
          style: TextStyle(
            fontSize: 14,
            color: Color.fromRGBO(83, 83, 83, 1),
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 24),
      ],
    );
  }
}