import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'MainMenu.dart';
import 'RegisterScreen.dart';

enum Gender {
  male,
  female,
  other,
}

class UserInfo {
  final String email;
  final String username;
  final String password;
  final DateTime? birthdate;
  final Gender? gender;
  final int? height;
  final double? weight;

  UserInfo(this.email, this.username, this.password,
      [this.birthdate, this.gender, this.height, this.weight]);
}

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key, required this.userInfo});
  final UserInfo userInfo;

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _pass = TextEditingController();

  List<UserInfo> users = <UserInfo>[];

  bool userNameExists(String userName) {
    bool found = false;
    for (final user in users) {
      if (user.username == userName) {
        found = true;
      }
    }
    return found;
  }

  bool rightPassword(String pass, String userName) {
    bool found = false;
    for (final user in users) {
      if (user.username == userName) {
        if (user.password == pass) {
          found = true;
        }
      }
    }
    return found;
  }

  userNameField() {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Enter your username',
        labelText: 'Username',
        icon: Icon(Icons.person),
      ),
      controller: _username,
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter an username';
        } else if (!userNameExists(value)) {
          return 'User does not exist';
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
      controller: _pass,
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a password';
        } else if (!rightPassword(value, _username.text)) {
          return 'Wrong password!';
        }
        return null;
      },
    );
  }

  signInButton(void Function() onPressed) {
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
              minimumSize: const Size(130, 40),
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: onPressed,
            child: const Text('Sign In'),
          ),
        ],
      ),
    );
  }

  createAnAccontText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
            onPressed: () {},
            child: Text(
              'Don\'t have an account? ',
              style: TextStyle(fontSize: 18),
            )),
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegisterScreen()),
              );
            },
            child: Text("Sign Up", style: TextStyle(fontSize: 18)))
      ],
    );
    // );return RichText(
    //   text: TextSpan(
    //       children: [
    //     const TextSpan(
    //       text: 'Don\'t have an account? ',
    //       style: TextStyle(
    //         color: Colors.blue,
    //       ),
    //     ),
    //     TextSpan(
    //         text: 'Sign up',
    //         style: const TextStyle(
    //           color: Colors.blue,
    //         ),
    //         recognizer: TapGestureRecognizer()
    //           ..onTap = () {
    //             Navigator.push(
    //               context,
    //               MaterialPageRoute(
    //                   builder: (context) => const RegisterScreen()),
    //             );
    //           }),
    //   ]),
    // );
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                userNameField(),
                passwordField(),
                const SizedBox(height: 30),
                signInButton(
                  () {
                    setState(() {
                      users.add(widget.userInfo);
                    });

                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MainMenu(userInfo: users.first)));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 15),
        createAnAccontText(),
        const SizedBox(height: 20),
      ],
    )));
  }
}
