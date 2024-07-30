import 'package:flutter/material.dart';
import 'package:my_flutter_app/Diet%20and%20Equipments/Diet.dart';
import 'package:my_flutter_app/Pages/Bmi.dart';

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

class CalculatorSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: red,
          title: const Text("Calorie Calculators"),
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
                              builder: (BuildContext context) => bmi()));
                    },
                    Image.asset(
                      "assets/BMindex.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: 20),
                  btn(
                    () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CalorieCounter()));
                    },
                    Image.asset(
                      "assets/BMR.png",
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
