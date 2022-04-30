import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mobile_app/repositories/user_repositories/user_repository.dart';
import '../../navigation/navigation_cubit.dart';
import '../../navigation/pages/root_page.dart';
import '../auth.dart';

class LandingPageWidget extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const LandingPageWidget() : super();

  @override
  _LandingPageWidgetState createState() => _LandingPageWidgetState();
}

class _LandingPageWidgetState extends State<LandingPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = false;
  setCurrentState() {
    setState(() => isLoading ? true : false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFF0A84FF),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 44, 16, 60),
        child: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/LandingPageLogo.png',
                        width: 375,
                        height: 363,
                        fit: BoxFit.cover,
                      ),
                      const Text(
                        'Welcome to',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.75),
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 4,),
                      const Text(
                        'Pinnies Coin',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 17,),
                      const Text(
                        'The easiest and quickest way to transfer \ncoins  in Agile Bridge.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Expanded(child: Align(
                        alignment: Alignment.bottomCenter,
                        child: LandingPageButtonWidget()
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class LandingPageButtonWidget extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const LandingPageButtonWidget() : super();

  @override
  _LandingPagButtonWidgetState createState() => _LandingPagButtonWidgetState();
}
class _LandingPagButtonWidgetState extends State<LandingPageButtonWidget> {
  bool auth = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Color.fromARGB(255, 255, 255, 255),
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.5),
        ),
      ),
      onPressed: () async => {
        auth = await AuthMethod().loadData(),
        if (auth)
          {
            UserRepositoryProvider().postUserOnLogin(),                      
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider<NavigationCubit>(
                    create: (context) => NavigationCubit(),
                    child: MaterialApp(
                      theme: ThemeData(primarySwatch: Colors.blue),
                      home: RootPage(),
                    ),
                  ),
                ))
          }
        else
          {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Row(children: const [
                      Icon(
                        Icons.error,
                        color: Colors.pink,
                        size: 24.0,
                        semanticLabel:
                            'Text to announce in accessibility modes',
                      ),
                      Text('  Login Failed ')
                    ]),
                    content: const Text("Please Try Again"),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Ok'),
                        child: const Text('Ok'),
                      ),
                    ],
                  );
                })
          },
      },
      child: const Text(
        'Get Started',
        style: TextStyle(
          fontSize: 16,
          color: Color.fromRGBO(10, 132, 255, 1),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
          child: SpinKitCubeGrid(
        size: 140,
        color: Colors.white,
        duration: Duration(milliseconds: 1200),
      )),
    );
  }
}
