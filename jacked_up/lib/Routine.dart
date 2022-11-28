
import 'package:jacked_up/TrainingPlan.dart';

class Routine {
  final String name;
  Map<String, TrainingPlan?> plansByDay;

  Routine(this.name, this.plansByDay);

}

List<Routine> allRoutines = [
  Routine('Quick Biceps', {
    'SUN': null,
    'MON': defaultTrainingPlans[0],
    'TUE': null,
    'WED': null,
    'THU': defaultTrainingPlans[0],
    'FRI': null,
    'SAT': null,
  }),

];