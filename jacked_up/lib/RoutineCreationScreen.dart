import 'package:flutter/material.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/services.dart';
import 'package:jacked_up/ExerciseTutorialsScreen.dart';
import 'package:jacked_up/RoutinesScreen.dart';
import 'Routine.dart';
import 'TrainingPlan.dart';

class TrainingPlanTile extends StatefulWidget {
  const TrainingPlanTile({Key? key, required this.planByDay})
      : super(key: key);

  final MapEntry<String, TrainingPlan?> planByDay;

  @override
  State<StatefulWidget> createState() => _RoutineTileState();
}

class _RoutineTileState extends State<RoutineTile>{
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onLongPress: () {},
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: Row(
          children: [
            Text("data")
          ],
        )
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
          title: Center(child: Text(widget.title)),
        ),
        body: ListView.separated(
          itemCount: routine.plansByDay.length,
          itemBuilder: (context, index) {
            return TrainingPlanTile(planByDay: List.of(routine.plansByDay.entries)[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return Container(height: 7,);
          },
        ));
  }
}
