import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/Pages/Bmi.dart';
import 'package:my_flutter_app/Pages/Calculator_selector.dart';
import 'package:my_flutter_app/Pages/calories.dart';
import 'package:my_flutter_app/firebase/login.dart';
import '../Diet and Equipments/Equipments.dart';
import 'Workouts.dart';

const Color gold = Color.fromARGB(255, 255, 185, 15);
const Color red = Color.fromARGB(255, 167, 15, 4);

// ignore: camel_case_types
class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //App BAR
        //
        appBar: AppBar(
          backgroundColor: red,
          title: const Text("Home ", style: TextStyle(color: Colors.white)),

          //Leading

          //action
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.signOut();
                  // Navigate back to the login screen after signing out
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => login()),
                  );
                } catch (e) {
                  print('Error signing out: $e');
                  // Handle sign-out errors if needed
                }
              },
            )
          ],
        ),
        //Drawer starts here
        drawer: Drawer(
          child: ListView(
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text("Abhinav"),
                accountEmail: Text("abhinab1221@gmail.com",
                    style: TextStyle(
                      color: Colors.black,
                    )),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 144, 91, 88),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/photo.jpeg'),
                    radius: 90,
                  ),
                ),
                decoration: BoxDecoration(
                  color: gold,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Login"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => login()));
                },
              ),
              ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text("Settings"),
                  onTap: () {
                    Navigator.pushNamed(context, '/second');
                  }),
              ListTile(
                  leading: const Icon(Icons.account_circle),
                  title: const Text("Account"),
                  onTap: () {}),
              ListTile(
                leading: const Icon(Icons.calculate_outlined),
                title: const Text("BMI Calculator"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => bmi()));
                },
              ),
            ],
          ),
        ),

        //BodyStarts here
        //Column for stacking the containers

        body: const Grid(),
      ),
    );
  }
}

class Grid extends StatefulWidget {
  const Grid({super.key});

  @override
  State<Grid> createState() => GridState();
}

//Function of button
TextButton btn(VoidCallback onPressed, Image image) {
  return TextButton(
    onPressed: onPressed,
    //
    child: Column(
      children: [
        image,
        /*
                            Image.asset(
                              "assets/Costuom.jpeg",
                              fit: BoxFit.fill,
                            ),*/
      ],
    ),
  );
}

class GridState extends State<Grid> {
  @override
  Widget build(BuildContext context) {
    //
    //
    ///Body  starts from here of state full
    return Scaffold(
      //Color of Background
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Inside upper 1/3 is set here
          Container(
            margin: const EdgeInsets.all(1),
            height: 300,
            width: 500,
            decoration: BoxDecoration(
              border:
                  Border.all(color: const Color.fromARGB(121, 255, 255, 255)),
            ),
            child: Image.asset(
              "assets/Costuom2.jpeg",
              fit: BoxFit.fill,
            ),
          ),
          //Textgoal
          const Text(
            "Chose your goal",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),

          //Upper Ends here
          //Lower Section Starts here
          //Gridview  views
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(5),
              primary: false,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              crossAxisCount: 2,
              children: [
                //LOWER container that contains all the buttons
                //
                //

                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(43, 255, 255, 255))),
                  //
                  //First Button
                  //Workout
                  child: btn(
                    () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const workoutScreen()));
                    },
                    Image.asset(
                      "assets/Costuom.jpeg",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                //
                //Second container Diet Plan
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(43, 255, 255, 255))),
                  child: btn(
                    () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CalculatorSelector()));
                    },
                    Image.asset(
                      "assets/diet.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                //Third container ie Equipments
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(43, 255, 255, 255))),
                  child: btn(
                    () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  EquipmentsScreen()));
                    },
                    Image.asset(
                      "assets/eqp.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                //fourth
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(43, 255, 255, 255))),
                  child: btn(
                    () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CaloriesPage()));
                    },
                    Image.asset(
                      "assets/Food.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
