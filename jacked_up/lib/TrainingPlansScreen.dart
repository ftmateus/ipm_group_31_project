import 'package:flutter/material.dart';
import 'package:jacked_up/TrainingPlan.dart';

import 'TrainingPlanCreationScreen.dart';
import 'TrainingPlanScreen.dart';

class TrainingPlanTile extends StatefulWidget {
  const TrainingPlanTile({Key? key, required this.trainingPlan})
      : super(key: key);

  final TrainingPlan trainingPlan;

  @override
  State<TrainingPlanTile> createState() => _TrainingPlanTileState();
}

class _TrainingPlanTileState extends State<TrainingPlanTile> {
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
                    widget.trainingPlan.name,
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

class TrainingPlansScreen extends StatefulWidget {
  const TrainingPlansScreen({Key? key}) : super(key: key);

  @override
  State<TrainingPlansScreen> createState() => _TrainingPlansScreenState();
}

class _TrainingPlansScreenState extends State<TrainingPlansScreen> {
  List<TrainingPlan> trainingPlans =
      allTrainingPlans.values.expand((plans) => plans).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        backgroundColor: Colors.blue,
      ),
      appBar: AppBar(
        title: Center(child: Text('Training Plans')),
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
                          hintText: 'Training plan name',
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
                      builder: (context) => TrainingPlanCreationScreen(
                            title:
                                'Custom Plan ${allTrainingPlans['custom']?.length}',
                          )),
                ).then((plan) {
                  setState(() {
                    if (plan != null) {
                      allTrainingPlans['custom']?.add(plan);
                      trainingPlans = allTrainingPlans.values
                          .expand((plans) => plans)
                          .toList();
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
                    child: const Center(child: Text("CREATE TRAINING PLAN")),
                  ),
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(17, 0, 17, 0),
              child: ListView.separated(
                itemCount: trainingPlans.length,
                itemBuilder: (context, index) {
                  final plan = trainingPlans[index];
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TrainingPlanScreen(
                                    title: plan.name,
                                    trainingPlan: plan,
                                  )),
                        );
                      },
                      child: TrainingPlanTile(trainingPlan: plan));
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

  List<TrainingPlan> getSuggestionsFrom(
      List<TrainingPlan> plansList, String query) {
    return plansList.where((plan) {
      final planName = plan.name.toLowerCase();
      final input = query.toLowerCase();

      return planName.contains(input);
    }).toList();
  }

  void _searchExercise(String query) {
    List<TrainingPlan> suggestions =
        allTrainingPlans.values.expand((plans) => plans).toList();
    if (query.isNotEmpty && trainingPlans.isEmpty) {
      suggestions = getSuggestionsFrom(
          allTrainingPlans.values.expand((plans) => plans).toList(), query);
    } else if (query.isNotEmpty) {
      suggestions = getSuggestionsFrom(trainingPlans, query);
    }
    setState(() => trainingPlans = suggestions);
  }
}
