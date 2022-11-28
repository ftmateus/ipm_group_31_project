
enum Muscle{
  chest(label: 'Chest'),
  triceps(label: 'Triceps'),
  legs(label: 'Legs'),
  abdominal(label: 'Abdominal'),
  back(label: 'Back'),
  biceps(label: 'Biceps'),
  calves(label: 'Calves');

  const Muscle({
    required this.label,
  });

  final String label;
}

class Exercise {
  final String name;
  final List<Muscle> targetMuscles;
  final int caloriesBurnedByRep;
  final int durationSecondsByRep;
  final List<String> imagePaths;
  bool isFav;

  Exercise(this.name, this.targetMuscles, this.durationSecondsByRep,
      this.caloriesBurnedByRep, this.imagePaths, this.isFav);

}

Map<String, List<Exercise>> allExercises = {
  'chest':chestExercises,
  'triceps':tricepsExercises,
  'legs':legsExercises,
  'abdominal':abdominalExercises,
  'back':backExercises,
  'biceps':bicepsExercises,
  'calves':calvesExercises
};

List<Exercise> chestExercises = [
  Exercise('Push Ups' , [Muscle.chest], 10, 5, ['assets/images/pushups.png', 'assets/images/pushupslist.png'], false),
  Exercise('Barbell Bench Press' , [Muscle.chest], 10, 5, ['assets/images/barbellbenchpress.png', 'assets/images/barbellbenchpresslist.png'], false),
  Exercise('Cable Crossover' , [Muscle.chest], 10, 5, ['assets/images/cablecrossover.png', 'assets/images/cablecrossoverlist.png'], false),
];

List<Exercise> tricepsExercises = [
  Exercise('Triceps Pressdown' , [Muscle.triceps], 10, 5, ['assets/images/lyingtricepsextension.png', 'assets/images/lyingtricepsextensionlist.png'], false),
  Exercise('KickBack' , [Muscle.triceps], 10, 5, ['assets/images/kickback.png', 'assets/images/kickbacklist.png'], false),
  Exercise('Lying Triceps Extension' , [Muscle.triceps], 10, 5, ['assets/images/tricepspressdown.png', 'assets/images/tricepspressdownlist.png'], false),

];

List<Exercise> legsExercises = [
  Exercise('Leg Extensions' , [Muscle.legs], 10, 5, ['assets/images/legextension.png', 'assets/images/legextensionlist.png'], false),
  Exercise('Squat' , [Muscle.legs], 10, 5, ['assets/images/squat.png', 'assets/images/squatlist.png'], false),
  Exercise('Dumbbell Step Up' , [Muscle.legs], 10, 5, ['assets/images/dumbbellstepup.png', 'assets/images/dumbbellstepuplist.png'], false),
];

List<Exercise> abdominalExercises = [
  Exercise('Plank' , [Muscle.abdominal], 10, 5, ['assets/images/plank.png', 'assets/images/planklist.png'], false),
  Exercise('Crunch Machine' , [Muscle.abdominal], 10, 5, ['assets/images/crunchmachine.png', 'assets/images/crunchmachinelist.png'], false),
  Exercise('Crunch' , [Muscle.abdominal], 10, 5, ['assets/images/crunch.png', 'assets/images/crunchlist.png'], false),
];

List<Exercise> backExercises = [
  Exercise('Pull Up' , [Muscle.back], 10, 5, ['assets/images/pullup.png', 'assets/images/pulluplist.png'], false),
  Exercise('Seated Cable Row' , [Muscle.back], 10, 5, ['assets/images/seatedcablerow.png', 'assets/images/seatedcablerowlist.png'], false),
  Exercise('Wide Grip Pulldown' , [Muscle.back], 10, 5, ['assets/images/widegrippulldown.png', 'assets/images/widegrippulldownlist.png'], false),
];

List<Exercise> bicepsExercises = [
  Exercise('Hammer Curl' , [Muscle.biceps], 10, 5, ['assets/images/hammercurl.png', 'assets/images/hammercurllist.png'], false),
  Exercise('Rope Cable Curl' , [Muscle.biceps], 10, 5, ['assets/images/ropecablecurl.png', 'assets/images/ropecablecurllist.png'], false),
  Exercise('Barbel Curl' , [Muscle.biceps], 10, 5, ['assets/images/barbellcurl.png', 'assets/images/barbellcurllist.png'], false),
];

List<Exercise> calvesExercises = [
  Exercise('Seated Calf Raise' , [Muscle.calves], 10, 5, ['assets/images/seatedcalfraise.png', 'assets/images/seatedcalfraiselist.png'], false),
  Exercise('Standing Calf Raise' , [Muscle.calves], 10, 5, ['assets/images/standingcalfraise.png', 'assets/images/standingcalfraiselist.png'], false),
];