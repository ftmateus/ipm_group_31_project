import 'package:flutter/material.dart';
import 'package:jacked_up/RegisterScreen.dart';
import 'SignInScreen.dart';

void main() => runApp(const Home());

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: ,
      initialRoute: SignInScreen.id,
      routes: {
        SignInScreen.id: (context) => SignInScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
      },
    );
  }
}

