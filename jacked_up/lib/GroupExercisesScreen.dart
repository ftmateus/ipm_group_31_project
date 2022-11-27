import 'package:flutter/material.dart';
import 'package:jacked_up/ExerciseScreen.dart';
import 'package:jacked_up/GroupExercise.dart';

class ExerciseTile extends StatefulWidget {
  const ExerciseTile({Key? key, required this.exercise}) : super(key: key);

  final Exercise exercise;

  @override
  State<ExerciseTile> createState() => _ExerciseTileState();
}

class _ExerciseTileState extends State<ExerciseTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          side: BorderSide(width: 2.0),
          borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      color: Colors.black38,
      child: Row(
        children: [
          Expanded(
            flex: 30,
            child: Container(
              clipBehavior: Clip.antiAlias,
              height: 100,
              width: MediaQuery.of(context).size.width * 0.25,
              decoration: BoxDecoration(
                border: Border.all(width: 2),
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                    image: AssetImage(
                      widget.exercise.imagePaths[1],
                    ),
                    fit: BoxFit.contain),
              ),
            ),
          ),
          Expanded(
            flex: 60,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List<Widget>.of([
                      Text(
                        widget.exercise.name,
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]) +
                    [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                                widget.exercise.targetMuscles.length, (index) {
                              return index ==
                                      widget.exercise.targetMuscles.length - 1
                                  ? Text(
                                      widget
                                          .exercise.targetMuscles[index].label,
                                      style: const TextStyle(fontSize: 12.0),
                                    )
                                  : Row(
                                      children: [
                                        Text(
                                            widget.exercise.targetMuscles[index]
                                                .label,
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
                    ]),
          ),
          Expanded(
              flex: 10,
              child: Container(
                height: 90,
                alignment: Alignment.topCenter,
                child: InkWell(
                    onTap: () {
                      setState(() {
                        widget.exercise.isFav = !widget.exercise.isFav;
                      });
                    },
                    child: widget.exercise.isFav
                        ? const Icon(Icons.star)
                        : const Icon(Icons.star_outline)),
              ))
        ],
      ),
    );
  }
}

class GroupExercisesScreen extends StatefulWidget {
  const GroupExercisesScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<GroupExercisesScreen> createState() => _GroupExercisesScreenState();
}

class _GroupExercisesScreenState extends State<GroupExercisesScreen> {
  late List<Exercise> exercises;

  @override
  void initState() {
    super.initState();

    exercises = widget.title == "Show All"
        ? allExercises.values.expand((exercises) => exercises).toList()
        : allExercises[widget.title.replaceAll(" ", "").toLowerCase()]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        backgroundColor: Colors.blue,
      ),
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
        actions: [new Container()],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(17, 17, 0, 17),
                    child: TextField(
                      //controller: ,
                      decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.search),
                          hintText: 'Exercise name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  const BorderSide(color: Colors.blue))),
                      onChanged: _searchExercise,
                    ),
                  ),
                ),
                Builder(builder: (context) {
                  return IconButton(
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                      icon: Icon(Icons.filter_list));
                }),
              ],
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(17, 0, 17, 0),
              child: ListView.separated(
                itemCount: exercises.length,
                itemBuilder: (context, index) {
                  final exercise = exercises[index];
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ExerciseScreen(
                                    exercise: exercise,
                                  )),
                        );
                      },
                      child: ExerciseTile(exercise: exercise));
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Container(height: 7);
                },
              ),
            ))
          ],
        ),
      ),
    );
  }

  List<Exercise> getSuggestionsFrom(
      List<Exercise> exercisesList, String query) {
    return exercisesList.where((exercise) {
      final exerciseName = exercise.name.toLowerCase();
      final input = query.toLowerCase();

      return exerciseName.contains(input);
    }).toList();
  }

  void _searchExercise(String query) {
    List<Exercise> suggestions = allExercises[widget.title.toLowerCase()]!;
    if (query.isNotEmpty && exercises.isEmpty) {
      suggestions =
          getSuggestionsFrom(allExercises[widget.title.toLowerCase()]!, query);
    } else if (query.isNotEmpty) {
      suggestions = getSuggestionsFrom(exercises, query);
    }
    setState(() => exercises = suggestions);
  }
}
