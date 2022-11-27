import 'package:flutter/material.dart';
import 'ExerciseTutorialsScreen.dart';

void main() => runApp(const Home());

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        //theme: ,
        home: ExerciseTutorialsScreen());
  }
}
