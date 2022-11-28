import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jacked_up/ExerciseScreen.dart';
import 'package:jacked_up/GroupExercise.dart';

import 'TrainingPlan.dart';

class ExerciseTile extends StatefulWidget {
  ExerciseTile({Key? key, required this.exercise})
      : super(key: key);

  final Exercise exercise;

  @override
  State<ExerciseTile> createState() => _ExerciseTileState();
}

class _ExerciseTileState extends State<ExerciseTile> {
  final TextEditingController _reps = TextEditingController();
  final TextEditingController _sets = TextEditingController();


  @override
  Widget build(BuildContext context) {
    bool viewOnly  = ModalRoute.of(context)!.settings.arguments != null;

    return Card(
      shape: RoundedRectangleBorder(
          side: BorderSide(width: 2.0, color: Colors.white60),
          borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      color: Colors.black38,
      child: Row(
        children: [
          Expanded(
            flex: 25,
            child: Container(
              clipBehavior: Clip.antiAlias,
              height: 100,
              width: MediaQuery.of(context).size.width * 0.25,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.white60),
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
                          fontSize: 18.0,
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
              flex: 15,
              child: Container(
                height: 90,
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 5, left: 10)),
                    InkWell(
                        onTap: () {
                          setState(() {
                            widget.exercise.isFav = !widget.exercise.isFav;
                          });
                        },
                        child: widget.exercise.isFav
                            ? const Icon(Icons.star, color: Colors.yellow)
                            : const Icon(Icons.star_outline)),
                    const Spacer(),
                    viewOnly
                        ? Container()
                        : IconButton(
                            onPressed: () => _showRepSetInput(widget.exercise),
                            icon: const Icon(Icons.add_circle, size: 35,))
                  ],
                ),
              ))
        ],
      ),
    );
  }

  inputField(String inputLabel, TextEditingController inputController, Icon inputIcon) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Number of ${inputLabel.toLowerCase()}' ,
        labelText: inputLabel,
        icon: inputIcon,
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      controller: inputController,
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a number of ${inputLabel.toLowerCase()}';
        }
        return null;
      },
    );
  }

  void _showRepSetInput(Exercise exercise) {
    showDialog<ExerciseExecution>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: setupAlertDialogContainer(),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              var exerciseExecution = ExerciseExecution(exercise, int.parse(_reps.text), int.parse(_sets.text));
              _reps.clear();
              _sets.clear();
              Navigator.of(context)..pop(exerciseExecution)..pop(exerciseExecution)..pop(exerciseExecution);
            } ,
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Widget setupAlertDialogContainer() {
    return Container(
      height: 120.0, // Change as per your requirement
      width: 300.0, // Change as per your requirement
      child: Column(
        children: [
          inputField('Reps', _reps, const Icon(Icons.monitor_weight)),
          inputField('Sets', _sets, const Icon(Icons.monitor_weight))
        ],
      ),
    );
  }


}

class GroupExercisesScreen extends StatefulWidget {
  GroupExercisesScreen(
      {Key? key, required this.title})
      : super(key: key);

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
        title: Text(widget.title),
        centerTitle: true,
        actions: [new Container()],
        backgroundColor: Theme.of(context).colorScheme.primary,
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
                      child: ExerciseTile(
                        exercise: exercise,
                      ));
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
    List<Exercise> suggestions = allExercises.values.expand((exercises) => exercises).toList();
    if (query.isNotEmpty && exercises.isEmpty) {
      suggestions =
          getSuggestionsFrom(allExercises[widget.title.toLowerCase()]!, query);
    } else if (query.isNotEmpty) {
      suggestions = getSuggestionsFrom(exercises, query);
    }
    setState(() => exercises = suggestions);
  }
}

