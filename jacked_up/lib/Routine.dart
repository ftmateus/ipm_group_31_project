
import 'package:jacked_up/TrainingPlan.dart';

class Routine {
  final String name;
  Map<String, TrainingPlan?> plansByDay;

  Routine(this.name, this.plansByDay);

}

List<Routine> allRoutines = [
  Routine('Test1', {
    'SUN': null,
    'MON': defaultTrainingPlans[0],
    'TUE': null,
    'WED': null,
    'THURS': defaultTrainingPlans[0],
    'FRI': null,
    'SAT': null,
  }),
  Routine('Test2', {
    'SUN': defaultTrainingPlans[0],
    'MON': null,
    'TUE': null,
    'WED': defaultTrainingPlans[0],
    'THURS': null,
    'FRI': null,
    'SAT': null,
  }),

];