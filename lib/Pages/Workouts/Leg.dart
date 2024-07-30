import 'package:flutter/material.dart';

class LegScreen extends StatelessWidget {
  final List<Map<String, dynamic>> exercises = [
    {
      'imagePath': 'assets/Squats.gif',
      'description':
          'Squats are a compound exercise targeting multiple muscle groups, including the quadriceps, hamstrings, glutes, and lower back. To perform squats effectively, stand with feet shoulder-width apart, lower your body by bending your knees and hips, ensuring your back remains straight. Lower until thighs are parallel to the ground, then push through your heels to return to the starting position, engaging your core for stability throughout the movement.',
      'name': 'Squats',
      'sets': {
        'sets': 3,
        'reps': [12, 10, 8]
      },
      'height': 350.0,
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
    {
      'imagePath': 'assets/Lunges.gif',
      'description':
          'Lunges are a versatile lower-body exercise targeting multiple muscles, including the quadriceps, hamstrings, glutes, and calves. To perform lunges, start by standing tall, step forward with one leg, lowering your hips until both knees are bent at a 90-degree angle, then push back up to the starting position using your front leg. Alternate legs for a balanced workout and maintain an upright torso throughout to optimize form and effectiveness.',
      'name': 'Lunges',
      'sets': {
        'sets': 3,
        'reps': [12, 10, 8]
      },
      'height': 350.0,
    },
    {
      'imagePath': 'assets/Leg Press.gif',
      'description':
          'The Leg Press primarily targets the quadriceps, hamstrings, glutes, and calves. To perform it, sit on a leg press machine with feet shoulder-width apart on the platform. Push the platform away by extending your knees until legs are almost fully extended, then return to the starting position by bending your knees. Maintain proper form, keeping your back flat against the seat, and avoid locking your knees at the top of the movement for optimal effectiveness and safety.',
      'name': 'Leg Press',
      'sets': {
        'sets': 3,
        'reps': [12, 10, 8]
      },
      'height': 380.0,
    },
    {
      'imagePath': 'assets/Romanian Deadlifts.gif',
      'description':
          'Romanian Deadlifts primarily target the hamstrings, glutes, lower back, and also engage the calves. To perform them correctly, start in a standing position holding a barbell or dumbbells in front of your thighs. Hinge at the hips while maintaining a slight knee bend, lower the weights toward the floor by pushing your hips back, keeping your back straight. Return to the starting position by driving your hips forward to complete the movement, focusing on the controlled descent and ascent for maximum effectiveness.',
      'name': 'Romanian Deadlifts',
      'sets': {
        'sets': 3,
        'reps': [12, 10, 8]
      },
      'height': 380.0,
    },
    {
      'imagePath': 'assets/Calf Raises.gif',
      'description':
          'Targets: Calves.\n\nHow to: \nSit on a leg press machine, place your feet on the platform shoulder-width apart, and push the platform away from you using your legs, then return to the starting position.',
      'name': 'Calf Raises',
      'sets': {
        'sets': 3,
        'reps': [12, 10, 8]
      },
      'height': 380.0,
    },
    {
      'imagePath': 'assets/Romanian Deadlifts.gif',
      'description':
          'Romanian Deadlifts primarily target the hamstrings, glutes, lower back, and also engage the calves. To perform them correctly, start in a standing position holding a barbell or dumbbells in front of your thighs. Hinge at the hips while maintaining a slight knee bend, lower the weights toward the floor by pushing your hips back, keeping your back straight. Return to the starting position by driving your hips forward to complete the movement, focusing on the controlled descent and ascent for maximum effectiveness.',
      'name': 'Romanian Deadlifts',
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
        title: Text("Leg Exercises"),
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
