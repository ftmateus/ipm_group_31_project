import 'package:flutter/material.dart';
import 'package:jacked_up/RegisterScreenSecond.dart';

import 'SignInScreen.dart';

class RegisterScreen extends StatefulWidget {

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _secretCode = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  bool isChecked = false;

  secretCodeField(){
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Enter your secret code',
        labelText: 'Secret Code',
        icon: Icon(Icons.vpn_key),
      ),
      controller: _secretCode,
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter the secret code';
        }else if(value!='12345') {
          return 'Please enter a valid code';
        }
        return null;
      },
    );
  }

  emailField(){
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Enter your email',
        labelText: 'Email',
        icon: Icon(Icons.email),
      ),
      controller: _email,
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter an email';
        }
        return null;
      },
    );
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
        }
        return null;
      },
    );
  }

  passwordField() {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Enter your password',
        labelText: 'Password',
        icon: Icon(Icons.key),
      ),
      controller: _pass,
      obscureText: true,

      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a password';
        }
        return null;
      },
    );
  }

  confirmPasswordField() {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Confirm your password',
        labelText: 'Confirm Password',
        icon: Icon(Icons.key),
      ),
      controller: _confirmPass,
      obscureText: true,
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please confirm your password';
        }else if(value != _pass.text){
          return 'Passwords do not match!';
        }
        return null;
      },
    );
  }

  checkBoxButton(){
    return FormField<bool>(
      builder: (state) {
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                        state.didChange(value);
                      });
                    }),
                const Text('I accept the Terms and Conditions'),
              ],
            ),
            Text(
              state.errorText ?? '',
              style: TextStyle(
                color: Theme.of(context).errorColor,
                fontSize: 12
              ),
            )
          ],
        );
      },
      validator: (value) {
        if (!isChecked) {
          return 'You need to accept the Terms and Conditions';
        } else {
          return null;
        }
      },
    );
  }

  signUpButton() {
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
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                var user = UserInfo(_email.text, _username.text, _pass.text);
                Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) =>
                      RegisterScreenSecond(userInfo: user)), (route) => false);
              }
            },
            child: const Text('Sign Up'),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(title: const Text('Back'),
          titleSpacing: 0,
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,),
      body: Center(
    child: Column(
    mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const DecoratedBox(decoration: BoxDecoration(color: Colors.black)),
        const Expanded(
            child: Image(
                image: AssetImage('assets/images/jackedUp.png'),
                fit: BoxFit.cover,
                width: double.infinity,
            height: 100,)),
        Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                secretCodeField(),
                emailField(),
                userNameField(),
                passwordField(),
                confirmPasswordField(),
                const SizedBox(height: 5),
                checkBoxButton(),
                signUpButton(),
                const SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ],
    )));
  }
}
