import 'package:flutter/material.dart';

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
      child: Material(
          color: Colors.blue.shade400,
          borderRadius: BorderRadius.circular(30),
          type: MaterialType.button,
          child: InkWell(
            borderRadius: BorderRadius.circular(30),
            splashColor: Colors.amberAccent.withAlpha(80),
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Center(
                  child: Column(
                    children: [
                      const Icon(Icons.person, size: 80),
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
                              Text("162m")
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