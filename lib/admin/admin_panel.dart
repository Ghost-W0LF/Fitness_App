import 'package:flutter/material.dart';

class ExerciseEditingPage extends StatefulWidget {
  final String imagePath;
  final String description;
  final String exerciseName;
  final Map<String, dynamic> sets;
  final double height;

  const ExerciseEditingPage({
    required this.imagePath,
    required this.description,
    required this.exerciseName,
    required this.sets,
    required this.height,
  });

  @override
  _ExerciseEditingPageState createState() => _ExerciseEditingPageState();
}

class _ExerciseEditingPageState extends State<ExerciseEditingPage> {
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _descriptionController = TextEditingController(text: widget.description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit ${widget.exerciseName}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Exercise Description:",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _descriptionController,
              minLines: 3,
              maxLines: null,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter new description",
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save the updated description and pop the page
                String newDescription = _descriptionController.text;
                // Perform updating logic (you need to implement this)
                // For demonstration purposes, you can print the new description
                print("Updated Description: $newDescription");
                Navigator.pop(context);
              },
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
