import 'package:flutter/material.dart';

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});
//
//   static const String _title = 'Flutter Code Sample';
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: _title,
//       home: MyStatefulWidget(),
//     );
//   }
// }

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  Widget _listViewBody() {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(bottom: 75.0),
          child: Center(
              child: Column(
                children: [
                  const Icon(Icons.person, size: 120),
                  const Text("FCTense",
                    style: TextStyle(
                        fontSize: 42
                    ),
                  ),
                  TextButton(
                    onPressed: () => {},
                    child: const Text('Edit photo',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                ],
              )
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Column(
                  children: const [
                    Text("Weight",
                      style: TextStyle(
                          fontSize: 25
                      ),
                    ),
                    Text("47kg",
                      style: TextStyle(
                          fontSize: 25
                      ),
                    )
                  ],
                ),
                const Icon(Icons.edit, size: 40, color: Colors.blue)
              ],
            )
            ,
            Row(
              children: [
                Column(
                  children: const [
                    Text("Height",
                      style: TextStyle(
                          fontSize: 25
                      ),
                    ),
                    Text("1,62m",
                      style: TextStyle(
                          fontSize: 25
                      ),
                    )
                  ],
                ),
                Icon(Icons.edit, size: 40, color: Colors.blue)
              ],
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 75.0),
          child: Column(

          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(onPressed: () {},
                child: const Text("Change email",
                  style: TextStyle(
                    fontSize: 25
                  ),
                )
            ),
            TextButton(onPressed: () {},
                child: const Text("Change password",
                  style: TextStyle(
                      fontSize: 25
                  ),
                )
            )
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: _listViewBody(),
    );
  }

  void showModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const Text('Example Dialog'),
        actions: <TextButton>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          )
        ],
      ),
    );
  }
}
