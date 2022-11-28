import 'package:flutter/material.dart';

import 'SignInScreen.dart';


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
  const ProfilePage({super.key, required this.user});

  final UserInfo user;

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
                  Text(widget.user.username,
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
                  children: [
                    Text("Weight",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                      ),
                    ),
                    Text(widget.user.weight.toString() + " kg",
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
                  children: [
                    Text("Height",
                      style: TextStyle(
                          fontSize: 20,
                      ),
                    ),
                    Text(widget.user.height.toString() + " cm",
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
          width: MediaQuery.of(context).size.width * 0.9,
          height: 300,
          child: Material(
            borderRadius: BorderRadius.circular(30),
            color:  Theme.of(context).colorScheme.primary.withOpacity(0.7),
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.all(10)),
                Icon(Icons.accessibility_new_rounded, size: 50, color: Colors.white),
                const Text("MY BODY",
                  style: TextStyle(
                    color: Colors.lightGreenAccent,
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width : 150,
                      child: Text("BMI",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    Container(
                      width : 150,
                      child: Text("Body Fat %",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width : 150,
                      child: Text("17,69",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    Container(
                      width : 150,
                      child: Text("17.5%",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,

                        ),
                      ),
                    )
                  ],
                ),
                const Padding(padding: EdgeInsets.all(10)),
                Text("Ideal Weight",
                    style: TextStyle(fontSize: 30,
                    fontWeight: FontWeight.bold
                  )
                ),
                Text("49,2-66,2Kg", style: TextStyle(fontSize: 20))
              ],
            ),
          ),
        ),
        // Container(
        //   margin: const EdgeInsets.only(bottom: 25.0),
        //   child: null,
        // ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     TextButton(onPressed: () {},
        //         child: const Text("Change email",
        //           style: TextStyle(
        //             fontSize: 25
        //           ),
        //         )
        //     ),
        //     TextButton(onPressed: () {},
        //         child: const Text("Change password",
        //           style: TextStyle(
        //               fontSize: 25
        //           ),
        //         )
        //     )
        //   ],
        // ),
        Container(
          margin: const EdgeInsets.only(bottom: 25.0),
          child: null,
        ),
        TextButton(onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.settings, size: 30),
                const Text("Settings",
                  style: TextStyle(
                      fontSize: 30
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
      body: SingleChildScrollView(
          child : _listViewBody()
      ),
    );
  }
}
