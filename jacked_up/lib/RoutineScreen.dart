import 'package:flutter/material.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'Routine.dart';
import 'TrainingPlan.dart';

class TrainingPlanTile extends StatelessWidget {
  const TrainingPlanTile({Key? key, required this.planByDay}) : super(key: key);

  final MapEntry<String, TrainingPlan?> planByDay;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 15,
            child: Center(
                child: Text(
              planByDay.key,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ))),
        Expanded(
          flex: 80,
          child: InkWell(
            onTap: () {},
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: Theme.of(context).colorScheme.primary),
                  borderRadius: const BorderRadius.all(Radius.circular(12))),
              child: Center(
                child: Text(
                  planByDay.value == null ? '' : planByDay.value!.name,
                  style: const TextStyle(fontSize: 25),
                ),
              ),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(right: 20))
      ],
    );
  }
}

class RoutineScreen extends StatefulWidget {
  RoutineScreen({super.key, required this.title, required this.routine});

  final String title;
  Routine routine;

  @override
  State<RoutineScreen> createState() => _RoutineScreenState();
}

class _RoutineScreenState extends State<RoutineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Theme.of(context).colorScheme.primary,
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: ListView.separated(
            itemCount: widget.routine.plansByDay.length,
            itemBuilder: (context, index) {
              return TrainingPlanTile(
                  planByDay: List.of(widget.routine.plansByDay.entries)[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                height: 30,
              );
            },
          ),
        ));
  }
}
