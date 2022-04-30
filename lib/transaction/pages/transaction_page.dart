//This is just for the demo to keep everything uniform.
import 'package:flutter/material.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  _TransactionPageState createState() => _TransactionPageState();
}
class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 68, 255, 155),
      child: const Center(
        child: Text(
          'This is the Transaction Page',
          style: TextStyle(color: Color.fromARGB(255, 1, 0, 0), fontSize: 18),
        ),
      ),
    );
  }
}
