import 'package:flutter/material.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/services.dart';
import 'package:jacked_up/ExerciseTutorialsScreen.dart';
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
              border: Border.all(width: 2, color: Colors.white60),
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

class TrainingPlanCreationScreen extends StatefulWidget {
  TrainingPlanCreationScreen({super.key, required this.title});

  final String title;

  @override
  State<TrainingPlanCreationScreen> createState() =>
      _TrainingPlanCreationScreenState();
}

class _TrainingPlanCreationScreenState
    extends State<TrainingPlanCreationScreen> {
  late TrainingPlan plan;

  @override
  void initState() {
    super.initState();
    plan = TrainingPlan(widget.title, [], 0, 0);
  }

  createPlanButton() {
    return InkWell(
      onTap: () => Navigator.pop(context, plan),
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
        title: Center(child: Text(widget.title, style: TextStyle(fontSize: 22),)),
        actions: [
          createPlanButton()
        ],
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
                          border: Border.all(width: 2, color: Colors.white60),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(12),
                        padding: const EdgeInsets.only(top:15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.access_time_sharp),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("  Duration:", style: TextStyle(fontWeight: FontWeight.bold)),
                                Text("  ${plan.totDuration} min"),
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
                          border: Border.all(width: 2, color: Colors.white60),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(12),
                        padding: const EdgeInsets.only(top:15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.local_fire_department_outlined),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(" Calories burned:", style: TextStyle(fontWeight: FontWeight.bold)),
                                Text(" ${plan.totCaloriesBurned} kcal"),
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
                          side: BorderSide(width: 2, color: Colors.white60),
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(15, 15)))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 14.0, 0, 8.0),
                        child: Text("List of exercises:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      ListView.separated(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: plan.exercises.length,
                        itemBuilder: (context, index) {
                          var exerciseExecution = plan.exercises[index];
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
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const ExerciseTutorialsScreen(
                title: 'Choose Exercise',
              ),
            settings: const RouteSettings(arguments: false)
          ),
        ).then((exerciseExecution) {
          setState(() {
            plan.addExercise(exerciseExecution);
          });
        }),
        child: const Icon(Icons.add),
      ),
    );
  }

}
