import 'package:flutter/material.dart';

class BicepExercise extends StatelessWidget {
  final List<Map<String, dynamic>> exercises = [
    {
      'imagePath': 'assets/EzBarbell curls.jpeg',
      'description':
          "Targets:\n biceps brachii, Short head\n\nHow to:\nStand upright with your feet shoulder-width apart, grasping the EZ bar with an underhand grip (palms facing upward), hands placed at a comfortable distance apart on the angled grips of the bar.\nKeep your elbows close to your sides and your upper arms stationary.\nInhale and slowly lower the barbell back to the starting position in a controlled manner, resisting the urge to let the weight drop. Maintain tension on the biceps as you lower the bar.",
      'name': 'Ez Barbell Curls',
      'sets': {
        'sets': 3,
        'reps': [12, 10, 8]
      },
      'height': 300.0,
    },
    {
      'imagePath': 'assets/Dumbbell Curl.jpeg',
      'description':
          "Targets:\n Brachialis, brachioradialis, and outer biceps.\n\nHow to:\nHold dumbbells at your sides with palms facing your body (neutral grip), curl the weights upward, keeping elbows close to your torso, then lower the dumbbells back down.",
      'name': 'Dumbbell Curl',
      'sets': {
        'sets': 3,
        'reps': [12, 10, 8]
      },
      'height': 300.0,
    },
    {
      'imagePath': 'assets/Curls.gif',
      'description':
          "Targets:\n Overall biceps (brachialis, brachioradialis, and biceps brachii).\n\nHow to:\nStand with feet shoulder-width apart, hold a barbell with an underhand grip at arm's length, curl the weight upward, keeping upper arms stationary, and then lower the barbell back down.",
      'name': 'Barbell Curl',
      'sets': {
        'sets': 3,
        'reps': [12, 10, 8]
      },
      'height': 350.0,
    },
    {
      'imagePath': 'assets/preachers.gif',
      'description':
          "Targets:\n Biceps peak and overall biceps development.\n\nSit or stand at a preacher curl bench, curl an EZ bar or dumbbells upwards, ensuring your upper arms rest against the pad, then lower the weight in a controlled manner.",
      'name': 'Preacher curls ',
      'sets': {
        'sets': 3,
        'reps': [12, 10, 8]
      },
      'height': 380.0,
    },
    {
      'imagePath': 'assets/Concentration curls.gif',
      'description':
          "Targets:\n Outer biceps and peak contraction.\n\nSit on a bench, hold a dumbbell with one hand between your legs, and curl the weight upward while resting your elbow against your thigh. Lower the dumbbell back down with control.",
      'name': 'Concentration curls',
      'sets': {
        'sets': 3,
        'reps': [12, 10, 8]
      },
      'height': 380.0,
    },
    // Add more exercises with image paths, descriptions, and names as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bicep Exercises"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: exercises
              .map((exercise) => ExerciseContainer(
                    imagePath: exercise['imagePath']!,
                    description: exercise['description']!,
                    exerciseName: exercise['name']!,
                    sets: exercise['sets']!,
                    height: exercise['height']!,
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class ExerciseContainer extends StatelessWidget {
  final String imagePath;
  final String description;
  final String exerciseName;
  final Map<String, dynamic> sets;
  final double height;

  const ExerciseContainer({
    required this.imagePath,
    required this.description,
    required this.exerciseName,
    required this.sets,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              exerciseName,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: height,
                  fit: BoxFit.fill,
                ),
                SizedBox(height: 10.0),
                Text(
                  description,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Sets: ${sets['sets']} Reps: ${sets['reps'].join("-")}',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
