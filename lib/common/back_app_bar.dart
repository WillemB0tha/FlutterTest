import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BackAppBar extends StatefulWidget with PreferredSizeWidget {
  const BackAppBar({ Key? key }) : super(key: key);

  @override
  State<BackAppBar> createState() => _BackAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _BackAppBarState extends State<BackAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: SvgPicture.asset(
          "assets/icons/backIcon.svg",
        ),
      ),
      backgroundColor: Colors.grey[50],
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0.0,
      bottomOpacity: 0.0,
    );
  }
}