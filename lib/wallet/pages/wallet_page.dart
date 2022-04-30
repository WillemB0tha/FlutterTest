import 'package:flutter/material.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  _WalletPageState createState() => _WalletPageState();
}
class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 104, 25, 111),
      child: const Center(
        child: Text(
          'This is the wallet screen.',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}