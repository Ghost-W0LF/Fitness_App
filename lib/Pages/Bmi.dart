import 'package:flutter/material.dart';
import 'package:my_flutter_app/Widgets/Button.dart';

const Color red = Color.fromARGB(255, 152, 14, 4);

class bmi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("BMI"),
          backgroundColor: red,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.keyboard_return))
          ],
        ),
        body: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

var htController = TextEditingController();
var wtController = TextEditingController();
var agController = TextEditingController();

String result = "";

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(padding: EdgeInsets.all(10)),
          const Text("BMI"),
          const SizedBox(height: 100, width: 200),
          const Padding(padding: EdgeInsets.all(10)),
          TextFormField(
            controller: htController,
            decoration: const InputDecoration(
              labelText: "Height",
              hintText: "Your Height in Feet",
              icon: Icon(Icons.height),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(10)),
          TextFormField(
            controller: wtController,
            decoration: const InputDecoration(
              labelText: "Weight",
              hintText: "Enter Your Weight in kg",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              icon: Icon(Icons.line_weight),
            ),
          ),
          const Padding(padding: EdgeInsets.all(10)),
          TextFormField(
            controller: agController,
            decoration: const InputDecoration(
              labelText: "AGE",
              hintText: "Your Age",
              icon: Icon(Icons.person_2),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(10)),
          Buttons(
            onpress: () {
              var wt = wtController.text.toString();
              var ht = htController.text.toString();
              var ag = agController.text.toString();

              if (wt != " " && ht != '' && ag != '') {
                var iwt = double.parse(wt);
                var iht = double.parse(ht);

                var mht = iht / 3.281;

                var bmi = iwt / ((mht * mht));

                setState(() {
                  result =
                      "Your BMI is: ${bmi.toStringAsFixed(3)}  ${classifyBMI(bmi)}";
                });
              } else {
                setState(() {
                  result = "Enter the details";
                });
              }
            },
            buttoncolor: Colors.white,
            title: "Calculate",
          ),
          const Padding(padding: EdgeInsets.all(10)),
          Text(result, style: const TextStyle(fontSize: 20)),
          Container(
              child: SingleChildScrollView(
                  child: Container(
            child: Image.asset(
              "assets/BODY MASS INTEX (BMI).jpeg",
              fit: BoxFit.fill,
            ),
          )))
        ],
      ),
    ));
  }

  String classifyBMI(double bmiValue) {
    if (bmiValue < 18.5) {
      return " (Underweight)";
    } else if (bmiValue >= 18.5 && bmiValue < 25) {
      return " (Normal)";
    } else if (bmiValue >= 25 && bmiValue < 30) {
      return " (Overweight)";
    } else {
      return " (Obese)";
    }
  }
}
