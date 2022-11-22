import 'package:flutter/material.dart';


class GymKey extends StatelessWidget
{
  const GymKey({
    super.key,
    required this.index,
    required this.onPress,
  });

  final int index;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Center(
            child: Column(
              children: [
                const Text("Gym key", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40
                  ),
                ),
                const Icon(Icons.qr_code, size: 250),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text("Lotation: "),
                    Text("Opened"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text("Gym: "),
                    Text("Jacked Up FCT UNL"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text("Parking: "),
                    Text(""),
                  ],
                )
              ],
            ),
          )
        ],
      );
  }

}