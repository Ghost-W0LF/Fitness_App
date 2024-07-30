import 'package:flutter/material.dart';

class ShoulduerScreen extends StatelessWidget {
  final List<Map<String, dynamic>> exercises = [
    {
      'imagePath': 'assets/Overhead Shoulder Press.gif',
      'description':
          'The Overhead Shoulder Press primarily targets the deltoid muscles, specifically the front, middle, and rear heads, along with engaging the triceps. To perform this exercise optimally, start by standing or sitting with a barbell or dumbbells at shoulder level. Push the weight upward until your arms are fully extended overhead, then lower it back down to shoulder height while maintaining control and stability through your core.',
      'name': 'Overhead Shoulder Press',
      'sets': {
        'sets': 3,
        'reps': [12, 10, 8]
      },
      'height': 350.0,
    },
    {
      'imagePath': 'assets/Lateral Raises.gif',
      'description':
          'Lateral raises primarily target the lateral deltoids, which are the side shoulder muscles. To perform them optimally, start standing with dumbbells at your sides, slightly bend your elbows, and lift the weights directly out to the sides until they reach shoulder height. Maintain a slight bend in your elbows throughout, engage your core for stability, and control the weights as you lower them back down to complete each repetition.',
      'name': 'Lateral Raises',
      'sets': {
        'sets': 3,
        'reps': [12, 10, 8]
      },
      'height': 350.0,
    },
    {
      'imagePath': 'assets/Front Raises.gif',
      'description':
          'Front raises primarily target the front deltoids (anterior shoulder muscles). To perform this exercise optimally, stand with dumbbells in front of your thighs, palms facing down. With a slight bend in your elbows, lift the weights directly in front of you until they reach shoulder height. Maintain control throughout the movement, avoiding swinging or using momentum, and slowly lower the weights back down to complete the repetition.',
      'name': 'Front Raises',
      'sets': {
        'sets': 3,
        'reps': [12, 10, 8]
      },
      'height': 350.0,
    },
    {
      'imagePath': 'assets/Bent-Over Reverse Flyes.gif',
      'description':
          'Bent-over reverse flyes primarily target the rear deltoids and upper back muscles. To perform this exercise, bend forward at the hips while holding dumbbells, maintain a slight bend in your elbows, then raise the weights out to the sides until your arms are parallel to the ground. Focus on squeezing your shoulder blades together at the top of the movement and lower the weights back down slowly to complete each repetition, ensuring controlled movements throughout.',
      'name': 'Bent-Over Reverse Flyes',
      'sets': {
        'sets': 3,
        'reps': [12, 10, 8]
      },
      'height': 380.0,
    },
    {
      'imagePath': 'assets/Arnold Press.gif',
      'description':
          'The Arnold Press is a shoulder exercise that primarily targets the deltoid muscles while also engaging the triceps and upper chest. To perform it, start by holding dumbbells at shoulder height with palms facing your body. Press the weights overhead while rotating your palms outward, ensuring a smooth and controlled motion. Lower the dumbbells back down to shoulder height, reversing the movement, for a comprehensive shoulder workout.',
      'name': 'Arnold Press',
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
        title: Text("shoulders Exercises"),
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
