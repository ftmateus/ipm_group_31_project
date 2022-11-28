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
          side: const BorderSide(width: 2.0, color: Colors.white),
          borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      color: Colors.black38,
      child: Row(
        children: [
          Expanded(
            flex: 20,
            child: Container(
              clipBehavior: Clip.antiAlias,
              height: 80,
              width: MediaQuery.of(context).size.width * 0.25,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.fitness_center, size: 50,),
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
                      fontSize: 20.0,
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

  Offset _tapPosition = Offset.zero;
  void _getTapPosition(TapDownDetails details) {
    final RenderBox referenceBox = context.findRenderObject() as RenderBox;
    setState(() {
      _tapPosition = referenceBox.globalToLocal(details.globalPosition);
    });
  }

  // This function will be called when you long press on the blue box or the image
  void _showContextMenu(BuildContext context, TrainingPlan plan) async {
    final RenderObject? overlay =
    Overlay.of(context)?.context.findRenderObject();

    final result = await showMenu(
        context: context,

        // Show the context menu at the tap location
        position: RelativeRect.fromRect(
            Rect.fromLTWH(_tapPosition.dx, _tapPosition.dy, 30, 30),
            Rect.fromLTWH(0, 0, overlay!.paintBounds.size.width,
                overlay.paintBounds.size.height)),

        // set a list of choices for the context menu
        items: [
          const PopupMenuItem(
            value: 'view details',
            child: Text('View details'),
          ),
        ]);

    // Implement the logic for each choice here
    switch (result) {
      case 'view details':
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => TrainingPlanScreen(title: plan.name, trainingPlan: plan)
          )
        );
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    bool viewOnly = ModalRoute.of(context)?.settings.arguments != null;
    return Scaffold(
      endDrawer: Drawer(
        backgroundColor: Colors.blue,
      ),
      appBar: AppBar(
        title:Text('Training Plans'),
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
            viewOnly
                ? Container()
                : Padding(
                    padding: const EdgeInsets.only(bottom: 15),
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
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: 50,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          elevation: 3,
                          color: Colors.green,
                          child:
                              const Center(child: Text("CREATE TRAINING PLAN")),
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
                    onTapDown: (details) => _getTapPosition(details),
                      onTap: viewOnly
                          ? () => Navigator.of(context).pop(plan)
                          : () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TrainingPlanScreen(
                                          title: plan.name,
                                          trainingPlan: plan,
                                        )),
                              );
                            },
                      onLongPress: () => _showContextMenu(context, plan),
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
