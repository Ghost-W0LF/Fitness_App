import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String title;
  final VoidCallback onpress;
  final Color buttoncolor;

  const Buttons({super.key, 
    required this.title,
    required this.onpress,
    required this.buttoncolor,
  });

  @override
  Widget build(BuildContext Context) {
    return ElevatedButton(
      onPressed: onpress,
      style: ElevatedButton.styleFrom(
        foregroundColor: const Color.fromARGB(255, 167, 15, 4), minimumSize: const Size(85, 45), backgroundColor: buttoncolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadowColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 2,
        side: const BorderSide(
          width: 0.3,
          color: Colors.white,
        ),
        animationDuration: const Duration(seconds: 30),
      ),
      child: Column(
        children: [
          Text(title),
        ],
      ), // Use the provided image
    );
  }
}
class DropDown extends StatelessWidget {
  const DropDown({super.key});

  @override
   Widget build(BuildContext Context){
    return DropdownButton<String>(
      items: const [
              DropdownMenuItem(
                value: 'one',
                child: Text('One'),
              ),
              DropdownMenuItem(
                value: 'two',
                child: Text('Two'),
              ),
              DropdownMenuItem(
                value: 'three',
                child: Text('Three'),
              ),
            ],
            onChanged: (value) {
              // Handle the selected item here.
            },
    );
   }

}