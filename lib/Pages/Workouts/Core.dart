import 'package:flutter/material.dart';

class CoreScreen extends StatelessWidget {
  final List<Map<String, dynamic>> exercises = [
    {
      'imagePath': 'assets/Plank.jpeg',
      'description':
          'Targets: All three heads of the triceps.\n\nHow to: \n\nGet into a push-up position, resting on your forearms. Keep your body in a straight line from head to heels, engaging your core muscles. Hold this position for a set amount of time.\n\n\n Reps: Hold for 30 seconds to 1 minute per set',
      'name': 'Plank',
      'sets': {
        'sets': 3,
        'reps': [3]
      },
      'height': 200.0,
    },
    {
      'imagePath': 'assets/Russian Twists.gif',
      'description':
          'Targets:  Obliques, rectus abdominis.\n\nHow to: \nSit on the floor, knees bent, and lean back slightly. Hold a weight or medicine ball with both hands. Twist your torso to one side, touching the weight to the floor beside you, then twist to the other side.\n\n\nReps: 12-15 twists (each side)',
      'name': 'Russian Twists',
      'sets': {
        'sets': 3,
        'reps': [12,15 ]
      },
      'height': 350.0,
    },
     {
      'imagePath': 'assets/Hanging Leg Raises.jpeg',
      'description':
          'Targets:  Lower abdominals.\n\nHow to: \nHang in a bar, legs straight. Lift your legs upward until they form a 90-degree angle with your torso, then slowly lower them back down without touching the floor.\n\n\n Reps: 10-12 raises',
      'name': 'Hanging Leg Raises',
      'sets': {
        'sets': 3,
        'reps': [10,12]
      },
      'height': 350.0,
    },
    {
      'imagePath': 'assets/Bicycle Crunches.gif',
      'description':
          'Targets: Rectus abdominis, obliques.\n\nHow to: \n Lie on your back, knees bent, hands behind your head. Alternately bring your left elbow towards your right knee while straightening your left leg, then switch to the other side in a pedaling motion.\n\n\n Reps: 15-20 reps (each side)',
      'name': 'Bicycle Crunches',
      'sets': {
        'sets': 3,
        'reps': [15,12]
      },
      'height': 350.0,
    },
    {
      'imagePath': 'assets/Mountain Climbers.gif',
      'description':
          'Targets: Core, including rectus abdominis, obliques, hip flexors.\n\nHow to: \n Get into a plank position and alternate bringing each knee toward your chest in a running motion, keeping your core engaged.\n\n\n Reps: 30-45 seconds',
      'name': 'Mountain Climbers',
      'sets': {
        'sets': 3,
        'reps': [3]
      },
      'height': 350.0,
    },
    
    // Add more exercises with image paths, descriptions, and names as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Core Exercises"), // Corrected title
      ),
      body: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          final exercise = exercises[index];
          return ExerciseContainer(
            imagePath: exercise['imagePath']!,
            description: exercise['description']!,
            exerciseName: exercise['name']!,
            sets: exercise['sets']!,
            height: exercise['height']!,
          );
        },
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
