import 'package:flutter/material.dart';
import 'package:jacked_up/MenuOptions.dart';
import 'package:jacked_up/ProfileButton.dart';

import 'GymKey.dart';
import 'MessagePM.dart';
import 'SignInScreen.dart';

// void main() => runApp(const MainMenu());

// class MainMenu extends StatelessWidget {
//   const MainMenu({super.key, required this.userInfo});
//
//   final UserInfo userInfo;
//
//   static const String _title = 'Flutter Code Sample';
//
//   @override
//   Widget build(BuildContext context) {
//     return const MyStatefulWidget();
//   }
// }

class MainMenu extends StatefulWidget {
  const MainMenu({super.key, required this.userInfo});

  final UserInfo userInfo;

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int _selectedIndex = 0;
  final ScrollController _homeController = ScrollController();

  Widget _listViewBody() {
    return SafeArea(
        child: Column(
      children: <Widget>[
        ProfileButton(index: 0, user: widget.userInfo, onPress: () => {}),
        MenuOptions()
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listViewBody(),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).colorScheme.primary.withAlpha(150),
        notchMargin: 0,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 75.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(onPressed: () {
                showModal(context);
              }, icon: const Icon(Icons.qr_code, size : 60)),
              const Spacer(),
              IconButton(onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MessagePM())
                );
              }, icon: const Icon(Icons.message, size : 60)),
              const Padding(padding: EdgeInsets.all(15))
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 80,
        height: 80,
        child: FloatingActionButton(
          onPressed: () => setState(() {}),
          tooltip: 'Increment Counter',
          child: const Icon(Icons.play_arrow, size: 50),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
    // bottomNavigationBar: BottomNavigationBar(
    //   currentIndex: _selectedIndex,
    //   iconSize: 42,
    //   items: const <BottomNavigationBarItem>[
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.qr_code),
    //       label: 'Gym key',
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.play_arrow),
    //       label: 'Today\'s plan',
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.message),
    //       label: 'Message PM',
    //     ),
    //   ],
    //
    //   onTap: (int index) {
    //     switch (index) {
    //       case 0:
    //         showModal(context);
    //         // only scroll to top when current index is selected.
    //
    //         break;
    //       case 1:
    //         if (_selectedIndex == index) {
    //           _homeController.animateTo(
    //             0.0,
    //             duration: const Duration(milliseconds: 500),
    //             curve: Curves.easeOut,
    //           );
    //         }
    //         break;
    //       case 2:
    //         if (_selectedIndex == index) {
    //           _homeController.animateTo(
    //             0.0,
    //             duration: const Duration(milliseconds: 500),
    //             curve: Curves.easeOut,
    //           );
    //         }
    //         Navigator.push(
    //             context,
    //             MaterialPageRoute(builder: (context) => const MessagePM())
    //         );
    //         break;
    //     }
    //     setState(
    //       () {
    //         _selectedIndex = index;
    //       },
    //     );
    //   },
    // ),
  }

  void showModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [GymKey(index: 0, onPress: () {})],
        ),
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
