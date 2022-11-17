import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static String id = '/RegisterScreen';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('hello')),
    );
  }
}
