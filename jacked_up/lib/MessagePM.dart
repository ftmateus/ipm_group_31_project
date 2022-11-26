import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:intl/intl.dart';
import 'package:jacked_up/MainMenu.dart';

import 'MenuOptions.dart';

// void main() {
//   runApp(const BookService());
// }

class Pair<T1, T2> {
  final T1 a;
  final T2 b;

  Pair(this.a, this.b);
}

// class BookService extends StatelessWidget {
//   const BookService({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Book Services',
//         theme: ThemeData(
//             colorSchemeSeed: const Color(0xff3b01f8), useMaterial3: true),
//         home: const Services());
//   }
// }

final services = [
  Pair("HIIT", "assets/images/HIIT.png"),
  Pair("Zumba", "assets/images/zumba-class.jpg"),
  Pair("Cycling", "assets/images/cycling.jpg"),
  Pair("Pilates", "assets/images/pilates.png"),
  Pair("Body Pump", "assets/images/body_pump.jpg"),
  Pair("Yoga", "assets/images/yoga.jpg"),
  // "Campo C": "",
  // "Campo D": "",
];

class ServiceCard extends StatelessWidget
{
  const ServiceCard({
    super.key,
    required this.title,
    required this.image,
    required this.onPress
  });

  final String image;
  final String title;
  final void Function() onPress;



  @override
  Widget build(BuildContext context) {
    // return Card(
    //     shape: const RoundedRectangleBorder(
    //       side: BorderSide(
    //         color: Colors.black45,
    //       ),
    //       borderRadius: BorderRadius.all(Radius.circular(12)),
    //     ),
    //     color: Theme.of(context).colorScheme.surfaceVariant,
    //     child: ListTile(
    //         shape: const RoundedRectangleBorder(
    //           borderRadius: BorderRadius.all(Radius.circular(12)),
    //         ),
    //         contentPadding: const EdgeInsets.only(
    //             left: 20, top: 5, bottom: 5),
    //         onTap: onPress,
    //         title: Text(title),
    //         leading:
    //             const Icon(Icons.arrow_circle_right, size: 25)
    //     )
    // );
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.fill
          ),
          shape: BoxShape.rectangle
      ),
      width: 1,
      child: Material(
          color: Colors.black.withOpacity(0.4),
          borderRadius: BorderRadius.circular(30),
          child: InkWell(
            borderRadius: BorderRadius.circular(30),
            splashColor: Colors.amberAccent.withAlpha(80),
            onTap: onPress,
            child: Center(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                )
            ),
          )
      ),
    );
  }
}

class MessagePM extends StatefulWidget {
  const MessagePM({Key? key}) : super(key: key);

  @override
  State<MessagePM> createState() => _MessagePMState();
}

class _MessagePMState extends State<MessagePM> {

  final reservations = <Pair<DateTime, String>>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage("assets/images/pt_profile_picture.png"),
              ),
              Container(
                padding: EdgeInsets.only(left: 15),
                child: Text('João Santos'),
              )
            ],
          ),
        ),
        backgroundColor: const Color.fromRGBO(85, 122, 250, 1).withAlpha(200),
        centerTitle: true,
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BubbleBackground(
        // The colors of the gradient, which are different
        // depending on which user sent this message.
        colors: const [Color(0xFF6C7689), Color(0xFF3A364B)],
        // The content within the bubble.
        child: DefaultTextStyle.merge(
          style: const TextStyle(
            fontSize: 18.0,
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text("SSSS"),
          ),
        ),
      ),
    );
  }
}

@immutable
class BubbleBackground extends StatelessWidget {
  const BubbleBackground({
    super.key,
    required this.colors,
    this.child,
  });

  final List<Color> colors;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BubblePainter(
        bubbleContext: context,
        colors: colors,
        scrollable: ScrollableState()
      ),
      child: child,
    );
  }
}


class BubblePainter extends CustomPainter {
  BubblePainter({
    required ScrollableState scrollable,
    required BuildContext bubbleContext,
    required List<Color> colors,
  })  : _scrollable = scrollable,
        _bubbleContext = bubbleContext,
        _colors = colors;

  final ScrollableState _scrollable;
  final BuildContext _bubbleContext;
  final List<Color> _colors;

  @override
  bool shouldRepaint(BubblePainter oldDelegate) {
    return oldDelegate._scrollable != _scrollable ||
        oldDelegate._bubbleContext != _bubbleContext ||
        oldDelegate._colors != _colors;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final scrollableBox = _scrollable.context.findRenderObject() as RenderBox;
    final scrollableRect = Offset.zero & scrollableBox.size;
    final bubbleBox = _bubbleContext.findRenderObject() as RenderBox;

    final origin =
    bubbleBox.localToGlobal(Offset.zero, ancestor: scrollableBox);
    final paint = Paint()
      ..shader = ui.Gradient.linear(
        scrollableRect.topCenter,
        scrollableRect.bottomCenter,
        _colors,
        [0.0, 1.0],
        TileMode.clamp,
        Matrix4.translationValues(-origin.dx, -origin.dy, 0.0).storage,
      );
    canvas.drawRect(Offset.zero & size, paint);
  }
}
