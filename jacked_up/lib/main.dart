import 'package:flutter/material.dart';
//import 'ExerciseTutorialsScreen.dart';
import 'SignInScreen.dart';

void main() => runApp(const Home());

const ACCENT_COLOR = Color.fromRGBO(85, 122, 250, 1);

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
   /* return const MaterialApp(
        debugShowCheckedModeBanner: false,
        //theme: ,
        home: ExerciseTutorialsScreen());*/
    UserInfo defaultUser = UserInfo(
        'email',
        'admin',
        'admin',
        DateTime.now(),
        Gender.male,
        170,
        75
    );
    return  MaterialApp(
        darkTheme: ThemeData(
          scaffoldBackgroundColor: Colors.black54,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.grey.withOpacity(0.15)
          ),
          bottomAppBarColor:  Colors.black87,
          primaryColor: Colors.white,
          colorScheme: ColorScheme.dark(
            primary: ACCENT_COLOR,
            onPrimary: Colors.white,
            primaryContainer: ACCENT_COLOR.withAlpha(500),
            onPrimaryContainer: ACCENT_COLOR,
            secondary: Colors.orange,
            onSecondary: Colors.black54,
            secondaryContainer: Colors.orange.withAlpha(10),
            onSecondaryContainer: Colors.orange.withOpacity(0.5),
            background: Colors.black
          ),
          // Define the default font family.

          // Define the default `TextTheme`. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: const TextTheme(
            // headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            // headline2: TextStyle(fontSize: 62.0, fontWeight: FontWeight.normal),
            // headline3: TextStyle(fontSize: 48.0, fontWeight: FontWeight.normal),
            headline6: TextStyle(fontSize: 28.0, fontStyle: FontStyle.normal),
            // bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
        ),

        theme: ThemeData(
            useMaterial3: true,
            colorScheme: const ColorScheme(
              brightness: Brightness.dark,
              primary: Colors.red,
              onPrimary: Colors.white,
              secondary: Colors.green,
              onSecondary: Colors.white,
              primaryContainer: Colors.pink,
              error: Colors.black,
              onError: Colors.white,
              background: Colors.blue,
              onBackground: Colors.white,
              surface: Colors.pink,
              onSurface: Colors.white,
            ),
        ),

        themeMode: ThemeMode.dark,

        debugShowCheckedModeBanner: false,
        home:
          SignInScreen(userInfo: defaultUser)

    );
  }
}
