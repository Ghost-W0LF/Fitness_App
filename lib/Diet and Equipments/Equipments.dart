import 'package:flutter/material.dart';

class EquipmentsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> exercises = [
    {
      'imagePath': 'assets/Barbells.jpeg',
      'description':
          'Used for:\nWeightlifting, strength training.\n\nHow to use: \nLoad weight plates on both ends, grip the bar with hands slightly wider than shoulder-width, and perform various exercises like squats, deadlifts, bench press, etc.',
      'name': 'Barbells',
      
      'height': 350.0,
    }, {
      'imagePath': 'assets/Bench Press.jpeg',
      'description':
          'Used for:\nUpper body strength training\n\nHow to use: \nLie on the bench, unrack the barbell, lower it to your chest, and press it back up, engaging chest, shoulders, and triceps.',
      'name': 'Bench Press',
      
      'height': 350.0,
    }, {
      'imagePath': 'assets/Cable Machine.jpeg',
      'description':
          'Used for:\nResistance training, targeting various muscle groups.\n\nHow to use: \nAdjust the weight, attach desired handles, and perform exercises like cable rows, cable curls, tricep pushdowns, etc., by pulling or pushing the cable handles.',
      'name': 'Cable Machine',
      
      'height': 450.0,
    }, {
      'imagePath': 'assets/Dumbbells.jpeg',
      'description':
          'Used for:\nStrength training, unilateral exercises.\n\nHow to use: \nHold dumbbells in each hand and perform exercises such as bicep curls, shoulder presses, lunges, etc., engaging stabilizing muscles.',
      'name': 'Dumbbells',
      
      'height': 350.0,
    }, {
      'imagePath': 'assets/Elliptical Trainer.jpeg',
      'description':
          'Used for:\nCardiovascular workout, lower body exercise.\n\nHow to use: \n Stand on the pedals, hold the handles, and move your legs in an elliptical motion, simulating walking or running with reduced impact on joints.',
      'name': 'Elliptical Trainer',
      
      'height': 350.0,
    },
    {
      'imagePath': 'assets/Lat Pulldown Machine.jpeg',
      'description':
          'Used for:\n Strengthening back and arm muscles.\n\nHow to use: \n Sit, adjust the knee pads, grip the bar with a wide or narrow grip, and pull the bar down towards your chest, engaging your lats and arms.',
      'name': 'Lat Pulldown Machine',
      
      'height': 350.0,
    },
    {
      'imagePath': 'assets/Leg Press Machine.jpeg',
      'description':
          'Used for:\nLower body strength training.\n\nHow to use: \n Sit on the machine, place your feet on the platform, and push the weight by extending your legs, targeting quadriceps, hamstrings, and glutes.',
      'name': 'Leg Press Machine',
      
      'height': 350.0,
    },
    {
      'imagePath': 'assets/Rowing Machine.jpeg',
      'description':
          'Used for:\nCardiovascular workout, Full-body exercise.\n\nHow to use: \n Sit on the seat, grasp the handles, and simulate rowing motions, engaging legs, core, back, and arms.',
      'name': 'Rowing Machine',
      
      'height': 350.0,
    },
    {
      'imagePath': 'assets/Smith Machine.jpeg',
      'description':
          'Used for:\nWeightlifting, guided barbell exercises.\n\nHow to use: \n Set the desired height for the bar, load weights, and perform exercises like squats, bench press, lunges, etc., with the added safety of a guided bar.',
      'name': 'Smith Machine',
      
      'height': 350.0,
    },
    
    {
      'imagePath': "assets/Vertical Knee Raise Station (Captain's Chair).jpeg",
      'description':
          'Used for:\nAbdominal and core exercises.\n\nHow to use: \n Hold the handles, lift your knees toward your chest, or perform leg raises, engaging the abdominal muscles.',
      'name': 'Vertical Knee Raise Station',
      
      'height': 350.0,
    },

    //Add more exercises with image paths, descriptions, and names as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(150, 20, 11, 1),
        title: Text("Equipments"), // Corrected title
      ),
      body: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          final exercise = exercises[index];
          return ExerciseContainer(
            imagePath: exercise['imagePath']!,
            description: exercise['description']!,
            exerciseName: exercise['name']!,
            
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

  final double height;

  const ExerciseContainer({
    required this.imagePath,
    required this.description,
    required this.exerciseName,

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
               
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
