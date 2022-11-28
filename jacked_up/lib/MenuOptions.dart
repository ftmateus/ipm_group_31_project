import 'package:flutter/material.dart';
import 'package:jacked_up/ExerciseScreen.dart';
import 'package:jacked_up/ExerciseTutorialsScreen.dart';

import 'BookService.dart';

class MenuOption extends StatelessWidget
{
  const MenuOption({
    super.key,
    required this.title,
    required this.image,
    required this.onPress
  });


  final String image;
  final String title;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
            image: AssetImage(image),
          )
      ),
      child: Material(
          color: Colors.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(30),
          child: InkWell(
            borderRadius: BorderRadius.circular(30),
            splashColor: Colors.amberAccent.withAlpha(80),
            onTap: onPress,
            child: Center(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                )
            ),
          )
      ),
    );
  }
}

class MenuOptions extends StatelessWidget
{
  const MenuOptions({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            MenuOption(title: "Book Services",
                image: 'assets/images/book_service_main_menu_icon.png',
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Services()),
                  );
                }
            ),
            MenuOption(
                title: "Routines",
                image: 'assets/images/routine_main_menu_icon.jpg',
                onPress: () {}
            ),
            MenuOption(
                title: "Training plans",
                image: 'assets/images/training_plan_main_menu_icon.jpg',
                onPress: () {}
            ),
            MenuOption(
                title: "Exercises Tutorials",
                image: 'assets/images/exercises_main_menu_icon.jpg',
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ExerciseTutorialsScreen()),
                  );
                }
            ),
            // MenuOption(
            //     title: "Settings",
            //     image: 'assets/images/settings_main_menu_icon.png',
            //     onPress: () {}
            // ),
          ],
        )
    );
  }

}