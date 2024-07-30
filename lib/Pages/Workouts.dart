import 'package:flutter/material.dart';

import 'package:my_flutter_app/Pages/Workouts/Chest.dart';
import 'package:my_flutter_app/Pages/Workouts/Shoulduer.dart';

import 'Workouts/Arms.dart';
import 'Workouts/Back.dart';
import 'Workouts/Core.dart';
import 'Workouts/Leg.dart';

//State full Widget is created here as the function of button is created and
//the path is passed here

const Color red = Color.fromARGB(255, 167, 15, 4);

//class Starts here
class workoutScreen extends StatelessWidget {
  const workoutScreen({super.key});

  @override
  build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: red,
          title: const Text("Workout"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.keyboard_return))
          ],
        ),
        //
        //
        //Body starts from here
        body: const WorkoutRoutine(),
      ),
    );
  }
}

//
//
//Stateflu widget is created
class WorkoutRoutine extends StatefulWidget {
  const WorkoutRoutine({super.key});

  @override
  State<WorkoutRoutine> createState() => WorkoutRoutineState();
}

//
//
class WorkoutRoutineState extends State<WorkoutRoutine> {
  @override
  Widget build(BuildContext context) {
    //
//Function of Button
    ElevatedButton btn(VoidCallback onpress, String text) {
      return ElevatedButton(
        
        onPressed: onpress,
        style: ElevatedButton.styleFrom(
          foregroundColor: const Color.fromARGB(255, 167, 15, 4), minimumSize: const Size(10, 45), backgroundColor: const Color.fromRGBO(255, 254, 254, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadowColor: const Color.fromARGB(255, 255, 255, 255),
          elevation: 5,
          side: const BorderSide(
            width: 2,
            color: Color.fromARGB(255, 255, 253, 253),
          ),
          animationDuration: const Duration(seconds: 1),
        ),
        child: Column(
          children: [
            Text(text),
          ],
        ), // Use the provided image
      );
    }

    return Scaffold(
        backgroundColor: const Color.fromARGB(225, 0, 0, 0),

        //
        //Body Starts from here
        body: Stack(
          children: [
            //IMAGE
            //
            Center(
              child: Container(
                child: Image.asset(
                  "assets/Body.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //
            //UPPER TEXT SEEN
            //
            const Positioned(
              top: 40,
              left: 29,
              child: SizedBox(
                height: 40,
                width: 300,
                child: Text(
                  "Choose the targeted Area ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            //BUTTONS ARE HERE
            //Arms
            Positioned(
                top: 213,
                left: 30,
                child: Container(
                  child: btn(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => const ArmsScreen()));
                  }, "ARMS"),
                )),
            //CHEST
            Positioned(
                top: 210,
                left: 290,
                child: Container(
                  child: btn(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>  ChestScreen()));
                  }, "CHEST"),
                )),
            //BACK
            Positioned(
                top: 287,
                left: 30,
                child: Container(
                  child: btn(() {
                    // Add your login logic here
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>  BackScreen()));
                  }, "BACK"),
                )),
            //Core
            Positioned(
                top: 345,
                left: 25,
                child: Container(
                  child: btn(() {
                    // Add your login logic here
                     Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => CoreScreen()));
                  }, "CORE"),
                )),

            //Sholdure
            Positioned(
                top: 280,
                left: 270,
                child: Container(
                  child: btn(() {
                    // Add your login logic here
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>ShoulduerScreen()));
                  }, "SHOLDUER"),
                )),
            //LEGS
            Positioned(
                top: 350,
                left: 284,
                child: Container(
                  child: btn(() {
                    // Add your login logic here
                     Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>  LegScreen()));
                  }, "LEGS"),
                )),
            //
            //Buttom text
            const Positioned(
              top: 700,
              left: 10,
              child: SizedBox(
                height: 40,
                width: 300,
                child: Text(
                  "Choose the body part you wish to train.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
