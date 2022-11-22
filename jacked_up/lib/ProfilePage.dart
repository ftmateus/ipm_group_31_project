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
          margin: const EdgeInsets.only(bottom: 40.0),
          child: Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 72,
                    backgroundImage: AssetImage("images/fctense_profile_picture.png"),
                  ),
                  const Text("FCTense",
                    style: TextStyle(
                        fontSize: 42,
                        color: Colors.white
                    ),
                  ),
                  TextButton(
                    onPressed: () => {},
                    child: const Text('Edit photo',
                      style: TextStyle(
                          fontSize: 20,
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
                          fontSize: 25,
                          color: Colors.white
                      ),
                    ),
                    Text("47kg",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white
                      ),
                    )
                  ],
                ),
                const Icon(Icons.edit, size: 32, color: Colors.blue)
              ],
            )
            ,
            Row(
              children: [
                Column(
                  children: const [
                    Text("Height",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white
                      ),
                    ),
                    Text("1,62m",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white
                      ),
                    )
                  ],
                ),
                Icon(Icons.edit, size: 32, color: Colors.blue)
              ],
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 25.0),
          child: null,
        ),
        Container(
          width: 400,
          height: 200,
          child: Material(
            color: Colors.blue.shade200,
            borderRadius: BorderRadius.circular(30),
            child: Column(
              children: [
                const Text("My Body",
                  style: TextStyle(
                    fontSize: 32
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width : 200,
                      child: Center(
                        child: Text("BMI",
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width : 200,
                      child: Center(
                        child: Text("Body fat percentage",
                          style: TextStyle(
                              fontSize: 20,

                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 25.0),
          child: null,
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
        foregroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.black87,
      body: _listViewBody(),
    );
  }
}
