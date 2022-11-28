import 'package:flutter/material.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'TrainingPlan.dart';

class ExerciseExecutionTile extends StatelessWidget {
  const ExerciseExecutionTile({Key? key, required this.exerciseExecution})
      : super(key: key);

  final ExerciseExecution exerciseExecution;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {},
      borderRadius: BorderRadius.all(Radius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
        child: Row(children: [
          Container(
            clipBehavior: Clip.antiAlias,
            height: 100,
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
              border: Border.all(width: 2),
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                  image: AssetImage(
                    exerciseExecution.exercise.imagePaths[1],
                  ),
                  fit: BoxFit.contain),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(exerciseExecution.exercise.name),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0, 0),
                  child: Text("Reps: ${exerciseExecution.reps}"),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                  child: Text("Sets: ${exerciseExecution.sets}"),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class TrainingPlanScreen extends StatefulWidget {
  TrainingPlanScreen({super.key, required this.title, required this.trainingPlan});

  final String title;
  TrainingPlan trainingPlan;

  @override
  State<TrainingPlanScreen> createState() => _TrainingPlanScreenState();
}

class _TrainingPlanScreenState extends State<TrainingPlanScreen> {
  //TrainingPlan plan = defaultTrainingPlans[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              flex: 15,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.access_time_sharp),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Duration:"),
                                Text("${widget.trainingPlan.totDuration} min"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.local_fire_department_outlined),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Calories burned:"),
                                Text("${widget.trainingPlan.totCaloriesBurned} kcal"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          Expanded(
              flex: 85,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0.5),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const ShapeDecoration(
                      shape: NonUniformRoundedRectangleBorder(
                          hideBottomSide: true,
                          side: BorderSide(width: 2),
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(15, 15)))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(8.0, 8.0, 0, 8.0),
                        child: Text("List of exercises:"),
                      ),
                      ListView.separated(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: widget.trainingPlan.exercises.length,
                        itemBuilder: (context, index) {
                          var exerciseExecution = widget.trainingPlan.exercises[index];
                          return ExerciseExecutionTile(
                              exerciseExecution: exerciseExecution);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Padding(
                                padding: EdgeInsets.fromLTRB(70, 4.0, 0, 4.0),
                                child: Icon(Icons.arrow_downward_sharp),
                              )
                            ],
                          );
                        },
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {}),
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ),
    );
  }
}
