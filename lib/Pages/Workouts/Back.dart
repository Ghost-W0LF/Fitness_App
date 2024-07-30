import 'package:flutter/material.dart';

class BackScreen extends StatelessWidget {
  final List<Map<String, dynamic>> exercises = [
    {
      'imagePath': 'assets/Chinups.gif',
      'description':
          'Chin-ups are a bodyweight exercise targeting the upper body, primarily focusing on the back muscles such as the latissimus dorsi, biceps, and rear deltoids. The optimal way to perform chin-ups involves gripping an overhead bar with palms facing towards you (underhand grip), pulling your body upward until your chin clears the bar, and then lowering yourself back down in a controlled manner. Engage your core and avoid swinging to maximize the effectiveness of this compound exercise.',
      'name': 'Chin-Ups',
      'sets': {
        'sets': 3,
        'reps': [12, 10, 8]
      },
      'height': 350.0,
    },
    {
      'imagePath': 'assets/Bent-Over Rows.gif',
      'description':
          'Bent-over rows are a compound exercise primarily targeting the upper back muscles, including the latissimus dorsi, rhomboids, and traps, while also engaging the biceps and rear deltoids. To perform bent-over rows optimally, bend at the hips with a flat back, hold a barbell or dumbbells, and pull the weight towards your lower chest by retracting your shoulder blades. Lower the weight back down in a controlled manner, maintaining proper form throughout to maximize effectiveness and reduce the risk of injury.',
      'name': 'Bent-Over Rows',
      'sets': {
        'sets': 3,
        'reps': [12, 10, 8]
      },
      'height': 350.0,
    },
    {
      'imagePath': 'assets/Lat Pulldowns.gif',
      'description':
          'Lat pulldowns are a strength-building exercise primarily targeting the latissimus dorsi muscles, alongside engaging the biceps, upper back, and shoulders. Performing this exercise involves sitting at a lat pulldown machine, gripping the bar wider than shoulder-width apart, and pulling the bar down towards the chest while maintaining a straight posture and controlled movement. Emphasize the contraction of the back muscles as you lower the bar and slowly release it back up to the starting position for optimal effectiveness.',
      'name': 'Lat Pulldowns',
      'sets': {
        'sets': 3,
        'reps': [12, 10, 8]
      },
      'height': 350.0,
    },
    {
      'imagePath': 'assets/T-Bar Rows.gif',
      'description':
          'T-Bar Rows are a compound back exercise primarily targeting the middle and upper back muscles, including the lats, rhomboids, and rear deltoids. To perform T-Bar Rows optimally, place the chest against a padded support, grip the handles with an overhand grip, and pull the weight towards your abdomen by retracting the shoulder blades. Lower the weight back down under control, maintaining a stable core and avoiding excessive momentum for maximum effectiveness and safety.',
      'name': 'T-Bar Rows',
      'sets': {
        'sets': 3,
        'reps': [12, 10, 8]
      },
      'height': 380.0,
    },
    {
      'imagePath': 'assets/Deadlifts.gif',
      'description':
          'Deadlifts are a compound exercise primarily targeting multiple muscle groups, including the lower back, glutes, hamstrings, quadriceps, and forearms. The optimal way to perform a deadlift involves standing with feet shoulder-width apart, gripping the barbell with hands slightly wider than shoulder-width, keeping your back straight, and lifting the bar by extending your hips and knees simultaneously. Ensure the bar stays close to your body throughout the movement, and lower it back down under control to complete the repetition, engaging your core for stability.',
      'name': 'Deadlifts',
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
        title: Text("Back Exercises"),
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
