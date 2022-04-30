import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageAppBar extends StatefulWidget {
  final String title;
  final String path;
  const PageAppBar({ Key? key, required this.title, required this.path }) : super(key: key);

  @override
  State<PageAppBar> createState() => _PageAppBarState();
}

class _PageAppBarState extends State<PageAppBar> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(-0.75, -0.8),
      child: Row(children: [
        SvgPicture.asset(
          widget.path,
          height: 55,
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 24,
            color: Color.fromRGBO(10, 132, 255, 1),
            fontWeight: FontWeight.w700,
          ),
        ),
      ]),
    );
  }
}