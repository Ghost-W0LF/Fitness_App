   import 'package:flutter/material.dart';

//Second screen
class setting extends StatelessWidget {
  const setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("setting/third Screen"),
      ),
      body: Column(children: [
        Container(child: const Text("third screen")),
        //Button
        Container(
          child: Center(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Go to second page"),
            ),
          ),
        ),
      ]),
    );
  }
}
