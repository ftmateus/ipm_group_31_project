import 'package:flutter/material.dart';
import 'package:jacked_up/ProfilePage.dart';

class ProfileButton extends StatelessWidget
{
  const ProfileButton({
    super.key,
    required this.index,
    required this.onPress,
  });

  final int index;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      // decoration: BoxDecoration(
      //     image: DecorationImage(
      //       fit : BoxFit.fill,
      //       image: AssetImage("assets/images/profile_btn_background.jpg")
      //     )
      // ),
      child: Material(
          color: Theme.of(context).colorScheme.primaryContainer.withAlpha(200),
          borderRadius: BorderRadius.circular(30),
          type: MaterialType.button,
          child: InkWell(
            borderRadius: BorderRadius.circular(30),
            splashColor: Colors.amberAccent.withAlpha(80),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage())
              );
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 48,
                        backgroundImage: AssetImage("assets/images/fctense_profile_picture.png"),
                      ), // const Icon(Icons.person, size: 80),
                      const Text(
                        "Welcome FCTense",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: const [
                              Text("Weight"),
                              Text("47kg")
                            ],
                          ),
                          Column(
                            children: const [
                              Text("Height"),
                              Text("1,62m")
                            ],
                          ),
                        ],
                      )
                    ],
                  )
              ),
            ),
          )
      ),
    );
  }

}