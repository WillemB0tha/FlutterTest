// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import '../../repositories/transaction_repositories/transaction_repository.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> { 
//   final transactionRepo = TransactionRepositoryProvider();
//   @override
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.fromLTRB(16, 66, 16, 32),
//       child: Column(
//         children: [
//           _appBar(),
//           const SizedBox(height: 24),
//           const SizedBox(height: 36),
//           const SizedBox(height: 36),
//         ],
//       ),
//     );
//   }

//   Widget _appBar() {
//     return Align(
//       alignment: Alignment(-0.75, -0.8),
//       child: Row(children: [
//         SvgPicture.asset(
//           "assets/icons/sendCoinsIcon.svg",
//           height: 55,
//         ),
//         const SizedBox(
//           width: 15,
//         ),
//         const Text(
//           'name',
//           style: TextStyle(
//             fontSize: 24,
//             color: Color.fromRGBO(10, 132, 255, 1),
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//       ]),
//     );
//   }

//   Widget _title(String title) {
//     return Column(
//       children: [
//         Text(
//           title,
//           style: const TextStyle(
//             fontSize: 14,
//             color: Color.fromRGBO(83, 83, 83, 1),
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         const SizedBox(height: 16),
//       ],
//     );
//   }
// }

//This is just for the demo to keep everything uniform.
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      child: const Center(
        child: Text(
          'This is the home screen.',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
