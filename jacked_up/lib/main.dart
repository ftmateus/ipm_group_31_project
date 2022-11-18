import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  final ScrollController _homeController = ScrollController();

  Widget _listViewBody() {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.orange,
          child: const Center(
            child : Text("Book Services",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
              ),
            )
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.orange,
          child: const Center(
              child : Text("Routines",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                ),
              )
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.orange,
          child: const Center(
              child : Text("Training plans",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
              ),)
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.orange,
          child: const Center(
              child : Text("Exercises",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
              ),)
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listViewBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'Gym key',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow),
            label: 'Today\'s plan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Message PM',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (int index) {
          switch (index) {
            case 0:
              showModal(context);
            // only scroll to top when current index is selected.

              break;
            case 1:
              if (_selectedIndex == index) {
                _homeController.animateTo(
                  0.0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                );
              }
              break;
            case 2:
              if (_selectedIndex == index) {
                _homeController.animateTo(
                  0.0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                );
              }
              break;
          }
          setState(
                () {
              _selectedIndex = index;
            },
          );
        },
      ),
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
