import 'package:flutter/material.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/services.dart';
import 'package:jacked_up/ExerciseTutorialsScreen.dart';
import 'package:jacked_up/RoutinesScreen.dart';
import 'package:jacked_up/TrainingPlansScreen.dart';
import 'Routine.dart';
import 'TrainingPlan.dart';

class TrainingPlanTile extends StatefulWidget {
  TrainingPlanTile({Key? key, required this.planByDay, required this.routine})
      : super(key: key);

  MapEntry<String, TrainingPlan?> planByDay;
  Routine routine;

  @override
  State<StatefulWidget> createState() => _TrainingPlanTileState();
}

class _TrainingPlanTileState extends State<TrainingPlanTile>{
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 15,
            child: Center(child: Text(widget.planByDay.key))),
        Expanded(
          flex: 80,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.blue),
                borderRadius: BorderRadius.all(Radius.circular(12))
            ),
            child: Center(
              child: Text(widget.planByDay.value == null?'':widget.planByDay.value!.name),
            ),
          ),
        ),
        Expanded(
            flex: 17,
            child: IconButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TrainingPlansScreen(),
                    settings: RouteSettings(arguments: true)
                  )).then((plan) {
                    setState(() {
                      widget.routine.plansByDay.update(widget.planByDay.key, (value) => plan);
                      widget.planByDay = MapEntry<String, TrainingPlan>(widget.planByDay.key, plan);
                    });
              }),
              icon: Icon(Icons.add_circle),
            )),
      ],
    );
  }
}


class RoutineCreationScreen extends StatefulWidget {
  RoutineCreationScreen({super.key, required this.title});

  final String title;

  @override
  State<RoutineCreationScreen> createState() =>
      _RoutineCreationScreenState();
}

class _RoutineCreationScreenState
    extends State<RoutineCreationScreen> {
  late Routine routine;

  @override
  void initState() {
    super.initState();
    routine = Routine(widget.title, {
      'SUN': null,
      'MON': null,
      'TUE': null,
      'WED': null,
      'THURS': null,
      'FRI': null,
      'SAT': null,
    });
  }

  createPlanButton() {
    return InkWell(
      onTap: () => Navigator.pop(context, routine),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          width: 100,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xFF0D47A1),
                Color(0xFF1976D2),
                Color(0xFF42A5F5),
              ],
            ),
          ),
          child: const Center(
            child: Text(
                'CREATE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                )
            ),
          ),
        ),
      ),
    );
  }

  cancelButton() {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          width: 100,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xFF0D47A1),
                Color(0xFF1976D2),
                Color(0xFF42A5F5),
              ],
            ),
          ),
          child: const Center(
            child: Text(
                'CANCEL',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                )
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 100,
          leading: cancelButton(),
          title: Center(child: Text(widget.title, style: TextStyle(fontSize: 20),)),
          actions: [
            createPlanButton()
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: ListView.separated(
            itemCount: routine.plansByDay.length,
            itemBuilder: (context, index) {
              return TrainingPlanTile(planByDay: List.of(routine.plansByDay.entries)[index],
              routine: routine,);
            },
            separatorBuilder: (BuildContext context, int index) {
              return Container(height: 30,);
            },
          ),
        ));
  }
}
