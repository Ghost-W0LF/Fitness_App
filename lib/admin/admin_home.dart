import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/admin/admin_Calories.dart';
import 'package:my_flutter_app/admin/user.dart';

import 'package:my_flutter_app/firebase/login.dart';

const Color gold = Color.fromARGB(255, 255, 185, 15);
const Color red = Color.fromARGB(255, 167, 15, 4);

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: red,
          title: const Text("Home", style: TextStyle(color: Colors.white)),
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
        body: Container(
          padding: EdgeInsets.only(top: 50),
          width: 500,
          height: 300,
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UsersScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 50),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                ),
                child: Text('Users'),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdminCalories()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 50),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                ),
                child: Text('Calories'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
