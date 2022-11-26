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
                    backgroundImage: AssetImage("assets/images/fctense_profile_picture.png"),
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
                          fontSize: 20,
                          color: Colors.white
                      ),
                    ),
                    Text("47kg",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                      ),
                    )
                  ],
                ),
                IconButton(
                  color: Theme.of(context).colorScheme.primary,
                  icon: Icon(Icons.edit, size: 32),
                  onPressed: () {},
                )
              ],
            )
            ,
            Row(
              children: [
                Column(
                  children: const [
                    Text("Height",
                      style: TextStyle(
                          fontSize: 20,
                      ),
                    ),
                    Text("1,62m",
                      style: TextStyle(
                          fontSize: 20,
                      ),
                    )
                  ],
                ),
                IconButton(
                    color: Theme.of(context).colorScheme.primary,
                    icon: Icon(Icons.edit, size: 32),
                    onPressed: () {},
                )
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
            borderRadius: BorderRadius.circular(30),
            color:  Theme.of(context).colorScheme.primary,
            child: Column(
              children: [
                const Text("My Body",
                  style: TextStyle(
                    fontSize: 50
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width : 200,
                      child: Text("BMI",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25,
                          ),
                        ),
                    ),
                    Container(
                      width : 200,
                      child: Text("Body fat %",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25,

                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width : 200,
                      child: Text("17,69\nThinness",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      width : 200,
                      child: Text("17.5%",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,

                        ),
                      ),
                    )
                  ],
                ),
                Text("Ideal Weight", style: TextStyle(fontSize: 30)),
                Text("49,2-66,2Kg", style: TextStyle(fontSize: 20))
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
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 25.0),
          child: null,
        ),
        TextButton(onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.settings),
                const Text("More Settings",
                  style: TextStyle(
                      fontSize: 40
                  ),
                )
              ],
            )
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation : 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        shadowColor: Colors.transparent,

        centerTitle: true,
        leading: BackButton(
          color : Theme.of(context).colorScheme.onPrimary,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: _listViewBody(),
    );
  }
}
