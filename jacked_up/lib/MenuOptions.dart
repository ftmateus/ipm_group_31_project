import 'package:flutter/material.dart';

class MenuOptions extends StatelessWidget
{
  const MenuOptions({
    super.key,
    required this.index,
    required this.onPress,
  });

  final int index;
  final void Function() onPress;

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
            Material(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(30),
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  splashColor: Colors.amberAccent.withAlpha(80),
                  onTap: () {},
                  child: const Center(
                      child: Text(
                        "Book Services",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      )
                  ),
                )
            ),
            Material(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(30),
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  splashColor: Colors.amberAccent.withAlpha(80),
                  onTap: () {},
                  child: const Center(
                      child: Text(
                        "Routines",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      )
                  ),
                )
            ),
            Material(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(30),
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  splashColor: Colors.amberAccent.withAlpha(80),
                  onTap: () {},
                  child: const Center(
                      child: Text(
                        "Training plans",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      )
                  ),
                )
            ),
            Material(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(30),
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  splashColor: Colors.amberAccent.withAlpha(80),
                  onTap: () {},
                  child: const Center(
                      child: Text(
                        "Exercises",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      )
                  ),
                )
            ),
          ],
        )
    );
  }

}