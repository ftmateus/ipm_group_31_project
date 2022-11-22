import 'package:flutter/material.dart';
import 'package:jacked_up/MenuOptions.dart';
import 'package:jacked_up/ProfileButton.dart';

import 'GymKey.dart';

void main() => runApp(const MainMenu());

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

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
    return Column(
      children: <Widget>[
        ProfileButton(index: 0, onPress: () => {}),
        MenuOptions(index: 0)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listViewBody(),
      backgroundColor: Colors.black87,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: Colors.black87,
        selectedItemColor: Color.fromRGBO(85, 122, 250, 1),
        iconSize: 42,
        unselectedItemColor: Colors.grey,
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
        content: GymKey(index: 0, onPress : () {}),
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
