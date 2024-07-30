import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminCalories extends StatefulWidget {
  @override
  _AdminCaloriesState createState() => _AdminCaloriesState();
}

class _AdminCaloriesState extends State<AdminCalories> {
  final TextEditingController foodController = TextEditingController();
  final TextEditingController calorieController = TextEditingController();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  InputDecoration deco(
    var lbl,
    var hnt,
    IconData? ic,
  ) {
    return InputDecoration(
      label: Text(
        lbl,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
      hintText: hnt,
      icon: IconTheme(
        data: const IconThemeData(color: Colors.white),
        child: Icon(ic),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromARGB(255, 255, 255, 255),
          width: 3,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );
  }

  void updateData() {
    String food = foodController.text.trim();
    int calories = int.tryParse(calorieController.text) ?? 0;

    if (food.isNotEmpty && calories > 0) {
      // Add the food and calorie information as a new document in the collection
      firestore.collection('Foods').add({
        'foodName': food,
        'calories': calories,
      }).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Data updated successfully!'),
          ),
        );
        // Clear the text fields after successful update
        foodController.clear();
        calorieController.clear();
      }).catchError((error) {
        print('Error: $error');
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter valid data!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Calories'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: foodController,
              style: TextStyle(color: Colors.white),
              decoration: deco("Food", "Enter Food", Icons.fastfood_outlined),
            ),
            SizedBox(height: 20),
            TextField(
              controller: calorieController,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
              decoration: deco("Calories", "Enter Calories", Icons.numbers),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: updateData,
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    foodController.dispose();
    calorieController.dispose();
    super.dispose();
  }
}
