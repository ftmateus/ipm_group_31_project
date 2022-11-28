import 'package:flutter/material.dart';
import 'package:jacked_up/GroupExercisesScreen.dart';

enum ScreenID {
  home(id: '/ExerciseTutorials'),
  groupExercises(id: '/GroupExercices');

  const ScreenID({required this.id});

  final String id;
}

class ExerciseGroupButton extends StatelessWidget {
  ExerciseGroupButton(
      {super.key, required this.title});

  final String title;
  
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        title,
        style: const TextStyle(fontSize: 20),
      ),
      Expanded(
        child: Card(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GroupExercisesScreen(title: title),
                  settings: RouteSettings(arguments: ModalRoute.of(context)!.settings.arguments)
                ),
              );
            },
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'assets/images/${title.replaceAll(" ", "")}.png'),
                fit: BoxFit.cover),
                border: Border.all(width: 5),
                borderRadius: BorderRadius.circular(10), //<-- SEE HERE
              ),
            ),
          ),
        ),
      )
    ]);
  }
}

class ExerciseTutorialsScreen extends StatefulWidget {
  const ExerciseTutorialsScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ExerciseTutorialsScreen> createState() =>
      _ExerciseTutorialsScreenState();
}

class _ExerciseTutorialsScreenState extends State<ExerciseTutorialsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.all(7),
                          child: ExerciseGroupButton(
                              title: "Show All"))),
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.all(7),
                          child: ExerciseGroupButton(
                            title: "Chest"
                          )))
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.all(7),
                          child: ExerciseGroupButton(
                            title: "Triceps"
                          ))),
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.all(7),
                          child: ExerciseGroupButton(
                            title: "Legs"
                          )))
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.all(7),
                          child: ExerciseGroupButton(
                            title: "Abdominal"
                          ))),
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.all(7),
                          child: ExerciseGroupButton(
                            title: "Back"
                          )))
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.all(7),
                          child: ExerciseGroupButton(
                            title: "Biceps"
                          ))),
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.all(7),
                          child: ExerciseGroupButton(
                            title: "Calves"
                          )))
                ],
              ),
            ),
          ],
        )

        // GridView.builder(
        //     primary: false,
        //     padding: const EdgeInsets.all(35),
        //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //         crossAxisSpacing: 30,
        //         mainAxisSpacing: 20,
        //         crossAxisCount: 2,
        //         childAspectRatio: 1.35),
        //     itemCount: titles.length,
        //     itemBuilder: (BuildContext ctx, index) {
        //       return Column(
        //         children: [
        //           Text(
        //             titles[index],
        //             style: const TextStyle(fontSize: 20),
        //           ),
        //           Expanded(
        //             child: Card(
        //               elevation: 10,
        //               shape: RoundedRectangleBorder(
        //                 borderRadius: BorderRadius.circular(10)
        //               ),
        //               child: InkWell(
        //                 onTap: () => Navigator.pushNamed(context, TestScreen.id),
        //                 child: Container(
        //                   height: 700,
        //                   clipBehavior: Clip.antiAlias,
        //                   decoration: BoxDecoration(
        //                     image: DecorationImage(
        //                         image: AssetImage('assets/images/${titles[index].replaceAll(" ", "")}.png')
        //                     ),
        //                     border: Border.all(width: 7),
        //                     borderRadius:
        //                         BorderRadius.circular(10), //<-- SEE HERE
        //                   ),
        //                   padding: const EdgeInsets.all(1),
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ],
        //       );
        //     }),
        );
  }
}
