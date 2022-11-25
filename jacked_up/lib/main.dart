import 'package:flutter/material.dart';
import 'SignInScreen.dart';

void main() => runApp(const Home());

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
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

