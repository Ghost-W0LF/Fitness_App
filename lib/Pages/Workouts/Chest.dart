import 'package:flutter/material.dart';

class ChestScreen extends StatelessWidget {
  final List<Map<String, dynamic>> exercises = [
    {
      'imagePath': 'assets/Flat press.gif',
      'description':
          "The flat bench press primarily targets the chest muscles (pectoralis major), front deltoids, and triceps. To perform it optimally, lie on a flat bench with your feet firmly planted on the ground, grip the barbell slightly wider than shoulder-width apart, and lower the barbell to your chest while keeping your elbows at around a 45-degree angle. Push the barbell back up to the starting position, ensuring controlled movements and engaging your chest muscles throughout the exercise.",
      'name': 'Flat Bench Press',
      'sets': {
        'sets': 3,
        'reps': [12, 10, 8]
      },
      'height': 300.0,
    },
    {
      'imagePath': 'assets/INCLINE BENCH PRESS.gif',
      'description':
          'The Incline Bench Press primarily targets the upper portion of the pectoral muscles (chest), along with engaging the front deltoids and triceps. To perform it optimally:\n\n1. Set the bench at a 30-45 degree angle, lying back with your feet firmly on the ground.\n2. Grip the barbell slightly wider than shoulder-width, lower it to the upper chest while maintaining control.\n3. Press the weight upward, extending your arms but avoiding locking elbows.\n 4. Lower the bar back down in a controlled manner. Focus on engaging the chest muscles throughout the movement for maximum effectiveness.',
      'name': 'INCLINE BENCH PRESS',
      'sets': {
        'sets': 3,
        'reps': [12, 10, 8]
      },
      'height': 350.0,
    },
    {
      'imagePath': 'assets/DECLINE BENCH PRESS.gif',
      'description':
          'The Decline Bench Press primarily targets the lower portion of the chest muscles (pectoralis major), along with the triceps and shoulders. To perform it optimally:\n\n1. Lie on a decline bench angled at about 15 to 30 degrees downward.\n2. Grip the barbell slightly wider than shoulder-width apart, lowering it to the lower chest.\n3. Push the weight upward in a controlled manner, focusing on engaging the chest muscles.\n 4. Avoid arching your back excessively and maintain proper form throughout the movement for optimal effectiveness and safety.',
      'name': 'DECLINE BENCH PRESS',
      'sets': {
        'sets': 3,
        'reps': [12, 10, 8]
      },
      'height': 350.0,
    },
    {
      'imagePath': 'assets/Cable Crossover.gif',
      'description':
          'Preacher curls primarily target the biceps brachii muscle group. This exercise is performed using a preacher curl bench, isolating the biceps by stabilizing the upper arms against the pad. The optimum way to execute preacher curls involves maintaining strict form, focusing on controlled movements while curling the weight upward and emphasizing the contraction of the biceps at the top of the movement for maximal effectiveness.',
      'name': 'Cable Crossover',
      'sets': {
        'sets': 3,
        'reps': [12, 10, 8]
      },
      'height': 380.0,
    },
    {
      'imagePath': 'assets/Dips.gif',
      'description':
          'Chest dips primarily target the chest, shoulders, and triceps. To perform them optimally, start by gripping parallel bars and lowering your body by bending your elbows until your upper arms are parallel to the ground. Keep your torso slightly forward and lean in while maintaining control. Push back up to the starting position, focusing on engaging your chest muscles throughout the movement for optimal effectiveness.',
      'name': 'Chest Dips:',
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
        title: Text("Chest Exercises"),
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
