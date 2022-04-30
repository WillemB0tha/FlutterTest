import 'package:flutter/material.dart';

class Seperator extends StatefulWidget {
  const Seperator({ Key? key }) : super(key: key);

  @override
  State<Seperator> createState() => _SeperatorState();
}

class _SeperatorState extends State<Seperator> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        SizedBox(
          height: 24,
        ),
      ],
    );
  }
}