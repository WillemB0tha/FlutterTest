import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  final String caption; 
  final Function()? onClick;
  final Color buttonColor;
  final Color textColor;

  const PrimaryButton({ Key? key, required this.caption, required this.onClick, required this.buttonColor, required this.textColor }) : super(key: key);

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: widget.buttonColor,
        minimumSize: const Size.fromHeight(50),
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(3.5),
        ),
      ),
      onPressed: widget.onClick,
      child: Text(
        widget.caption,
        style: TextStyle(
          fontSize: 16,
          color: Color.fromRGBO(255, 255, 255, 1),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}