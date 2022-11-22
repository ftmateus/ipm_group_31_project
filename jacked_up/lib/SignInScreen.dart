import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'MainMenu.dart';
import 'RegisterScreen.dart';

enum Gender {
  male,
  female,
  nonBinary,
}

class UserInfo {
  final String email;
  final String username;
  final String password;
  final DateTime birthdate;
  final Gender gender;
  final int height;
  final int width;

  UserInfo(this.email, this.username, this.password, this.birthdate,
      this.gender, this.height, this.width);
}

class SignInScreen extends StatefulWidget {
  static String id = '/SignInScreen';

  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  userNameField() {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Enter your username',
        labelText: 'Username',
        icon: Icon(Icons.person),
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter an username';
        }
        return null;
      },
    );
  }

  passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        hintText: 'Enter your password',
        labelText: 'Password',
        icon: Icon(Icons.key),
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a password';
        }
        return null;
      },
    );
  }

  signInButton() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                ),
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              padding: const EdgeInsets.only(
                  left: 40, top: 16, bottom: 16, right: 40),
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Data is in processing.'))
                );
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MainMenu())
                );
              }
            },
            child: const Text('Sign In'),
          ),
        ],
      ),
    );
  }

  createAnAccontText() {
    return RichText(
      text: TextSpan(children: [
        const TextSpan(
          text: 'Don\'t have an account? ',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        TextSpan(
            text: 'Sign up',
            style: const TextStyle(
              color: Colors.blue,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, RegisterScreen.id);
              }),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.black,
        body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
              const Expanded(
                child: Image(
                image: AssetImage('assets/images/jackedUp.png'),
                fit: BoxFit.cover,
                width: double.infinity)),
              Form(
              key: _formKey,
                child: SizedBox(
                  width: 420,
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                  userNameField(),
                  passwordField(),
                    const SizedBox(height: 30),
                  signInButton(),
              ],
            ),
          ),
        ),
              const SizedBox(height: 15),
              createAnAccontText(),
              const SizedBox(height: 120),
      ],
    )));
  }
}
