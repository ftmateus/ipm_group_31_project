import 'package:flutter/material.dart';
//import 'ExerciseTutorialsScreen.dart';
import 'SignInScreen.dart';

void main() => runApp(const Home());

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
   /* return const MaterialApp(
        debugShowCheckedModeBanner: false,
        //theme: ,
        home: ExerciseTutorialsScreen());*/
    UserInfo defaultUser = UserInfo('email', 'Joao', 'Barros');
    return  MaterialApp(
        //theme: ThemeData(
        //colorSchemeSeed: const Color(0xff3b01f8), useMaterial3: true),
        // theme: ,
        debugShowCheckedModeBanner: false,
        home:
          SignInScreen(userInfo: defaultUser)
    );
  }
}
