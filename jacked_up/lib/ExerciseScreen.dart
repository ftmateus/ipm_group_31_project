import 'package:flutter/material.dart';
import 'package:jacked_up/GroupExercise.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({Key? key, required this.exercise}) : super(key: key);

  final Exercise exercise;

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("View Exercise"),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: Column(
          children: [
            Expanded(
              flex:25,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.exercise.imagePaths[0])),
                      border: Border.all(width: 3, color: Colors.white60),
                      borderRadius: BorderRadius.circular(10), //<-- SEE HERE
                    ),
                  )),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 24, top: 30),
                        child: Text("Exercise name: ",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
                        child: Text(
                          widget.exercise.name,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List<Widget>.of([
                                const Text(
                                  'Target muscles: ',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ]) +
                              List<Widget>.generate(
                                  widget.exercise.targetMuscles.length,
                                  (index) {
                                return index ==
                                        widget.exercise.targetMuscles.length - 1
                                    ? Text(
                                        widget.exercise.targetMuscles[index]
                                            .label,
                                        style: const TextStyle(fontSize: 12.0),
                                      )
                                    : Row(
                                        children: [
                                          Text(
                                              widget.exercise
                                                  .targetMuscles[index].label,
                                              style: const TextStyle(
                                                  fontSize: 12.0)),
                                          const Text(
                                            ',',
                                            style: TextStyle(fontSize: 12.0),
                                          )
                                        ],
                                      );
                              }),
                        ),
                      )
                    ],
                  ))
                ],
              ),
            ),
            Expanded(
                flex: 55,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(padding: EdgeInsets.only(top:10)),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Preparation:",
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
                      child: Text(lorem(paragraphs: 1, words: 20)),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Execution:",
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
                      child: Text(lorem(paragraphs: 1, words: 47)),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Tips:",
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
                      child: Text(lorem(paragraphs: 1, words: 17)),
                    ),
                  ],
                ))
          ],
        ));
  }
}
