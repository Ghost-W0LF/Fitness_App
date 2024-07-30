import 'package:flutter/material.dart';
import 'package:my_flutter_app/Pages/Workouts/Triceps.dart';
import 'package:my_flutter_app/Pages/Workouts/bicep.dart';

const Color red = Color.fromARGB(255, 167, 15, 4);
//Function of button
TextButton btn(VoidCallback onPressed, Image image) {
  return TextButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      foregroundColor: const Color.fromARGB(255, 167, 15, 4),
      maximumSize: const Size(300, 300),
      backgroundColor: Color.fromARGB(255, 101, 84, 84),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    //
    child: Column(
      children: [
        image,
      ],
    ),
  );
}

class ArmsScreen extends StatelessWidget {
  const ArmsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: red,
          title: const Text("Arms"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.keyboard_return))
          ],
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              
              child: Column(
                children: [
                  btn(
                    () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  BicepExercise()));
                    },
                    Image.asset(
                      "assets/Bicep.jpeg",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text("Bicep",style: TextStyle(
                    color: Colors.white,
                  ),),
                  SizedBox(height: 20),
                  btn(
                    () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  TricepScreen()));
                    },
                    Image.asset(
                      "assets/Tri.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
