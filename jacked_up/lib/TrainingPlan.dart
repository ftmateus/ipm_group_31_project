import 'package:jacked_up/GroupExercise.dart';

class ExerciseExecution {
  final Exercise exercise;
  final int reps;
  final int sets;

  ExerciseExecution(this.exercise, this.reps, this.sets);
}

class TrainingPlan {
  final String name;
  List<ExerciseExecution> exercises;
  int totDurationSecs;
  int totCaloriesBurned;

  int get totDuration {
    return (totDurationSecs/60).round();
  }

  addExercise(ExerciseExecution exerciseExecution) {
    exercises.add(exerciseExecution);
    Exercise exercise = exerciseExecution.exercise;
    totDurationSecs += exercise.durationSecondsByRep *
        exerciseExecution.reps *
        exerciseExecution.sets;
    totCaloriesBurned += exercise.caloriesBurnedByRep *
        exerciseExecution.reps *
        exerciseExecution.sets;
  }

  TrainingPlan(
      this.name, this.exercises, this.totDurationSecs, this.totCaloriesBurned);
}

Map<String, List<TrainingPlan>> allTrainingPlans = {
  'custom': customTrainingPlans,
  'default': defaultTrainingPlans
};

List<TrainingPlan> customTrainingPlans = [
  //TrainingPlan("Custom Plan 1", [], 0, 0)
];

List<TrainingPlan> defaultTrainingPlans = [
  TrainingPlan(
    "Upper Body",
    [
      ExerciseExecution(chestExercises[0], 12, 3),
      ExerciseExecution(tricepsExercises[1], 12, 3),
      ExerciseExecution(abdominalExercises[2], 12, 3)
    ],
    chestExercises[0].durationSecondsByRep * 12 * 3 +
        tricepsExercises[1].durationSecondsByRep * 12 * 3 +
        abdominalExercises[2].durationSecondsByRep * 12 * 3,
    chestExercises[0].caloriesBurnedByRep * 12 * 3 +
        tricepsExercises[1].caloriesBurnedByRep * 12 * 3 +
        abdominalExercises[2].caloriesBurnedByRep * 12 * 3,
  )
];
