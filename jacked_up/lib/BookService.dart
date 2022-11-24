import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  final titles = {
    "HIIT": "assets/images/HIIT.png",
    "Zumba": "assets/images/zumba-class.jpg",
    "Cycling": "assets/images/cycling.jpg",
    "Pilates": "assets/images/pilates.png",
    "Body Pump": "assets/images/body_pump.jpg",
    "Yoga": "assets/images/yoga.jpg",
    // "Campo C": "",
    // "Campo D": "",
  };

  final reservations = <Pair<DateTime, String>>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Center(
          child: Text('Book Services'),
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
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
          Widget>[
        const Padding(
            padding: EdgeInsets.only(left: 20, top: 20, bottom: 5),
            child: Text('Available Services:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white))),
        Expanded(
            child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children:
                    titles.entries.map((service) => MenuOption(title: service.key, image: service.value, onPress: () async {
                      final date = await _showReservationPicker(
                          context, service.key);
                      if (date == null) return;
                      setState(() =>
                          reservations.add(Pair(date, service.key)));
                    })).toList()

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
                  //         onTap: () async {
                  //           final date = await _showReservationPicker(
                  //               context, titles[index]);
                  //           if (date == null) return;
                  //           setState(() =>
                  //               reservations.add(Pair(date, titles[index])));
                  //         },
                  //         title: Text(titles[index]),
                  //         leading:
                  //             const Icon(Icons.arrow_circle_right, size: 25)));
                ))
      ]),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showReservations,
        label: const Text('Reservations'),
        tooltip: 'Your Bookings',
        icon: const Icon(Icons.description),
        backgroundColor: const Color.fromRGBO(85, 122, 250, 1).withAlpha(200),
      ),
    );
  }

  void _showReservations() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Center(child: Text('Reservations')),
        content: setupAlertDialogContainer(),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Widget setupAlertDialogContainer() {
    return Container(
      height: 200.0, // Change as per your requirement
      width: 300.0, // Change as per your requirement
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: reservations.length,
        itemBuilder: (BuildContext context, int i) {
          return ListTile(
              title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('${reservations[i].b} ',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(
                  '${reservations[i].a.day}/${reservations[i].a.month}/${reservations[i].a.year}'),
              Text(DateFormat.Hm().format(reservations[i].a))
            ],
          ));
        },
      ),
    );
  }
}

Future<DateTime?> _showReservationPicker(
    BuildContext context, String bookName) async {
  DateTime dateTime = DateTime.now();
  List<DateTime> availHours = <DateTime>[
    DateTime(1999, 1, 1, 9, 30),
    DateTime(1999, 1, 1, 10, 45),
    DateTime(1999, 1, 1, 18, 15),
    DateTime(1999, 1, 1, 19, 00),
    DateTime(1999, 1, 1, 19, 45)
  ];

  DateTime selectedHour = availHours.first;

  return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(bookName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20)),
                  const SizedBox(height: 10),
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      textStyle: const TextStyle(fontSize: 20),
                      side: const BorderSide(
                        color: Colors.black45,
                      ),
                    ),
                    onPressed: () async {
                      DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: dateTime,
                          firstDate: DateTime(2021),
                          lastDate: DateTime(2023));

                      if (newDate == null) return;
                      dateTime = newDate;
                      setState(() => dateTime = newDate);
                    },
                    label: Text(
                        '${dateTime.day}/${dateTime.month}/${dateTime.year}'),
                    icon: const Icon(Icons.calendar_month),
                  ),
                  const SizedBox(height: 20),
                  Row(children: <Widget>[
                    const Icon(Icons.schedule),
                    const SizedBox(width: 10),
                    DropdownButton<DateTime>(
                      value: selectedHour,
                      elevation: 16,
                      onChanged: (DateTime? value) {
                        setState(() {
                          selectedHour = value!;
                        });
                      },
                      items: availHours
                          .map<DropdownMenuItem<DateTime>>((DateTime value) {
                        return DropdownMenuItem<DateTime>(
                          value: value,
                          child: Text(DateFormat.Hm().format(value)),
                        );
                      }).toList(),
                    )
                  ])
                ]),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, null),
                child: const Text('Cancel'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                ),
              ),
              TextButton(
                  onPressed: () {
                    dateTime = DateTime(dateTime.year, dateTime.month,
                        dateTime.day, selectedHour.hour, selectedHour.minute);

                    final snackBar = SnackBar(
                      content:  Row(children: <Widget>[
                        const Icon (Icons.done, color: Colors.white),
                        const SizedBox(width: 10),
                        Text('Booked a service for $bookName !')]),
                      duration: const Duration(milliseconds: 1500),
                      behavior: SnackBarBehavior.floating,
                      elevation: 6,
                      width: 280.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                        backgroundColor: Colors.lightGreen,
                    );

                    Navigator.of(context).pop(dateTime);
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.orange,
                    textStyle: const TextStyle(fontWeight: FontWeight.bold)
                  ),
                  child: const Text('Book'))
            ],
          );
        });
      });
}
