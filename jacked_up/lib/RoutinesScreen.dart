import 'package:flutter/material.dart';
import 'package:jacked_up/Routine.dart';
import 'package:jacked_up/TrainingPlan.dart';

import 'RoutineCreationScreen.dart';
import 'RoutineScreen.dart';
import 'TrainingPlanCreationScreen.dart';
import 'TrainingPlanScreen.dart';

class RoutineTile extends StatefulWidget {
  const RoutineTile({Key? key, required this.routine})
      : super(key: key);

  final Routine routine;

  @override
  State<RoutineTile> createState() => _RoutineTileState();
}

class _RoutineTileState extends State<RoutineTile> {
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
              ),
              child: Icon(Icons.ac_unit_rounded),
            ),
          ),
          Expanded(
            flex: 60,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List<Widget>.of([
                  Text(
                    widget.routine.name,
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ])),
          ),
        ],
      ),
    );
  }
}

class RoutinesScreen extends StatefulWidget {
  const RoutinesScreen({Key? key}) : super(key: key);

  @override
  State<RoutinesScreen> createState() => _RoutinesScreenState();
}

class _RoutinesScreenState extends State<RoutinesScreen> {
  List<Routine> routines = allRoutines;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        backgroundColor: Colors.blue,
      ),
      appBar: AppBar(
        title: Center(child: Text('Routines')),
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
                          hintText: 'Routine name',
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RoutineCreationScreen(
                        title:
                        'Custom Routine ${allRoutines.length}',
                      )),
                ).then((routine) {
                  setState(() {
                    if (routine != null) {
                      allRoutines.add(routine);
                      routines = allRoutines;
                    }
                  });
                }),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: 50,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 3,
                    color: Colors.green,
                    child: const Center(child: Text("CREATE ROUTINE")),
                  ),
                ),
              ),
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(17, 0, 17, 0),
                  child: ListView.separated(
                    itemCount: routines.length,
                    itemBuilder: (context, index) {
                      final routine = routines[index];
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RoutineScreen(
                                    title: routine.name,
                                    routine: routine,
                                  )),
                            );
                          },
                          child: RoutineTile(routine: routine));
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

  List<Routine> getSuggestionsFrom(
      List<Routine> routinesList, String query) {
    return routinesList.where((routine) {
      final planName = routine.name.toLowerCase();
      final input = query.toLowerCase();

      return planName.contains(input);
    }).toList();
  }

  void _searchExercise(String query) {
    List<Routine> suggestions = allRoutines;
    if (query.isNotEmpty && routines.isEmpty) {
      suggestions = getSuggestionsFrom(allRoutines, query);
    } else if (query.isNotEmpty) {
      suggestions = getSuggestionsFrom(routines, query);
    }
    setState(() => routines = suggestions);
  }
}
