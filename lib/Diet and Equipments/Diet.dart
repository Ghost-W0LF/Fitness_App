import 'package:flutter/material.dart';

const Color red = Color.fromARGB(255, 152, 14, 4);

class CalorieCounter extends StatelessWidget {
  const CalorieCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Basal Metabolic Rate(BMR)"),
          backgroundColor: red,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.keyboard_return),
            )
          ],
        ),
        body: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// Controllers
var htController = TextEditingController();
var wtController = TextEditingController();
var agController = TextEditingController();

String dropdownValue = '0'; // Default value for dropdown

// DropDown menu
List<Map<String, dynamic>> options = [
  {"name": "Basic Metabolic Rate", "value": "0"},
  {"name": "Sedentary:Little or no exercise", "value": "1.2"},
  {"name": "light exercise/sports 1-3 days/week", "value": "1.375"},
  {"name": "moderate exercise/sports 3-5 days/week", "value": "1.550"},
  {"name": "hard exercise/sports 6-7 days a week", "value": "1.725"},
  {
    "name": "Very Active:intense exercise 6-7 time/weeks","value": "1.9"
  },
];
//List for gender
String genderValue = "0";
List<Map<String, dynamic>> goption = [
  {"name": "Chose your Gender", "value": "0"},
  {"name": "Male", "value": "5"},
  {"name": "Femal", "value": "165"}
];
String result = "";

class _MyHomePageState extends State<MyHomePage> {
  // Calculate Result Function
  void calResult() {
    var wt = wtController.text;
    var ht = htController.text;
    var ag = agController.text;

    if (wt.isNotEmpty && ht.isNotEmpty && ag.isNotEmpty) {
      // BMI
      var iwt = double.parse(wt);
      var iht = double.parse(ht);
      var iag = double.parse(ag);
      var idv = double.parse(dropdownValue);
      var igv = double.parse(genderValue);
      var mht = iht * 30.48;
            if(igv==5){
              

             var BMR = 66.47 + (13.75 * iwt) + (5.003 * mht) - (6.755 * iag);
             var fBMR = BMR * idv;
              setState(() {
              result = "Your BMR is: ${fBMR.toStringAsFixed(3)} [kcal / 24hrs] ";
             });
             } 
          if(igv == 165){
              

            var BMR =655.1 + (9.563 * iwt) + (1.85 * mht) - (4.676 * iag)
;
            var fBMR = BMR * idv;

            setState(() {
              result = "Your BMR is: ${fBMR.toStringAsFixed(3)} [kcal / 24hrs] ";
            });
              }

     
    }
     else {
      setState(() {
        result = "Enter the details";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(padding: EdgeInsets.all(10)),
          const Text("Calorie Calculator"),
          const SizedBox(height: 20),
          TextFormField(
            controller: htController,
            keyboardType: TextInputType.number,
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
            keyboardType: TextInputType.number,
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
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: "Age",
              hintText: "Your Age",
              icon: Icon(Icons.person),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ),
          //Dropdown Gender
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: SizedBox(
              width: double.infinity,
              child: DropdownButton(
                value: genderValue,
                onChanged: (String? value) {
                  setState(() {
                    genderValue = value ?? '0';
                  });
                },
                items: goption.map<DropdownMenuItem<String>>((goption) {
                  return DropdownMenuItem<String>(
                    value: goption['value'].toString(),
                    child: Text(goption['name'] as String),
                  );
                }).toList(),
              ),
            ),
          ),
          //DropDown Activity
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: SizedBox(
              width: double.infinity,
              child: DropdownButton(
                value: dropdownValue,
                onChanged: (String? value) {
                  setState(() {
                    dropdownValue = value ?? '0'; // Default to 1.1 if null
                  });
                },
                items: options.map<DropdownMenuItem<String>>((option) {
                  return DropdownMenuItem<String>(
                    value: option['value'].toString(),
                    child: Text(option['name'] as String),
                  );
                }).toList(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: calResult,
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 255, 255, 255), backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
                shadowColor: const Color.fromARGB(255, 0, 0, 0),
                elevation: 10,
                side: const BorderSide(
                  width: 0.5,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              child: const Text("Calculate"),
            ),
          ),
          Text(result, style: const TextStyle(fontSize: 20)),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}






