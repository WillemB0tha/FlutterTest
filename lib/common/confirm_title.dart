import 'package:flutter/material.dart';

class ConfirmTitle extends StatefulWidget {
  final String text;

  const ConfirmTitle({ Key? key, required this.text}) : super(key: key);

  @override
  State<ConfirmTitle> createState() => _ConfirmTitleState();
}

class _ConfirmTitleState extends State<ConfirmTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.text,
          style: TextStyle(
            fontSize: 14,
            color: Color.fromRGBO(151, 151, 151, 1),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}