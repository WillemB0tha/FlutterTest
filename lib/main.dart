import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/authentication/pages/landing_page.dart';
import '../navigation/navigation_cubit.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationCubit>(
      create: (context) => NavigationCubit(),
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const LandingPageWidget(),
      ),
    );
  }
}
