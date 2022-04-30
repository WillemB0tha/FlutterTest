import 'package:flutter/cupertino.dart';

class FormTitle extends StatefulWidget {
  final String text;
  const FormTitle({ Key? key, required this.text }) : super(key: key);

  @override
  State<FormTitle> createState() => _FormTitleState();
}

class _FormTitleState extends State<FormTitle> {
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
        SizedBox(height: 16),
      ],
    );
  }
}