import 'package:flutter/material.dart';

class TricepScreen extends StatelessWidget {
  final List<Map<String, dynamic>> exercises = [
    {
      'imagePath': 'assets/Tricep Dips.gif',
      'description':
          'Targets: All three heads of the triceps.\n\nHow to: \nHold onto parallel bars with arms fully extended, then lower your body by bending your elbows until your upper arms are parallel to the ground. Push yourself back up to the starting position.',
      'name': 'Tricep Dips',
      'sets': {
        'sets': 3,
        'reps': [12, 10, 8]
      },
      'height': 350.0,
    },
    {
      'imagePath': 'assets/Dumbbell Tricep Kickback.gif',
      'description':
          'Targets: All three heads of the triceps.\n\nHow to: \nStand with feet shoulder-width apart, holding a dumbbell in each hand. Hinge forward at the hips to bring your torso close to parallel with the ground.Keep your back straight, knees slightly bent, and arms bent at a 90-degree angle, close to your sides. Palms should be facing each otherWhile keeping your upper arms stationary, extend your arms backward until they are fully extended, squeezing your triceps at the top of the movement.Slowly lower the dumbbells back to the starting position, maintaining control throughout the movement.',
      'name': 'Tricep Dips',
      'sets': {
        'sets': 3,
        'reps': [12, 10, 8]
      },
      'height': 350.0,
    },
     {
      'imagePath': 'assets/Tricep Rope Pushdowns.gif',
      'description':
          'Targets: All three heads of the triceps.\n\nHow to: \nAttach a rope to a cable machine, grab the ends with an overhand grip, and push the rope down while keeping your upper arms stationary. Fully extend your arms, then return to the starting position.',
      'name': 'Tricep Dips',
      'sets': {
        'sets': 3,
        'reps': [12, 10, 8]
      },
      'height': 350.0,
    },
    {
      'imagePath': 'assets/Overhead Tricep Extension.gif',
      'description':
          'Targets: All three heads of the triceps.\n\nHow to: \nHold a dumbbell or barbell overhead with both hands, elbows bent. Lower the weight behind your head by bending at the elbows, then extend your arms upward to return to the starting position.',
      'name': 'Overhead Tricep Extension',
      'sets': {
        'sets': 3,
        'reps': [12, 10, 8]
      },
      'height': 350.0,
    },
    {
      'imagePath': 'assets/Skull Crushers (Lying Tricep Extensions).gif',
      'description':
          'Targets: Long head of the triceps.\n\nHow to: \n Lie on a bench, hold a barbell or dumbbells above your chest with arms extended. Bend your elbows, lowering the weight towards your forehead, then extend your arms to raise the weight back up.',
      'name': 'Skull Crushers',
      'sets': {
        'sets': 3,
        'reps': [12, 10, 8]
      },
      'height': 350.0,
    },
    {
      'imagePath': 'assets/Close-Grip Bench Press.gif',
      'description':
          'Targets: All three heads of the triceps.\n\nHow to: \nLie on a flat bench, grip the barbell with hands closer than shoulder-width apart, and lower the bar to your chest. Push the bar back up to the starting position, keeping your elbows close to your body..',
      'name': 'Tricep Dips',
      'sets': {
        'sets': 3,
        'reps': [12, 10, 8]
      },
      'height': 350.0,
    },
    // Add more exercises with image paths, descriptions, and names as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tricep Exercises"), // Corrected title
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
