import 'package:flutter/material.dart';
import 'package:my_flutter_app/Pages/home.dart';

import 'package:my_flutter_app/firebase/firebase_auth_services.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _Signup();
}

class _Signup extends State<Signup> {
//Use this form key to validate user's input
  final _formKey = GlobalKey<FormState>();
  final bool _isLogin = false;
//Use this to store user inputs
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  handleSubmit() async {
    //Validate user inputs using formkey
    if (_formKey.currentState!.validate()) {
      //Get inputs from the controllers
      final email = _emailController.value.text;
      final password = _passwordController.value.text;
      try {
        // Attempt to register the user
        await Auth().registerWithEmailAndPassword(email, password);

        // Navigate to the home page if registration is successful
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  home()), // Replace 'HomeScreen()' with your actual home screen widget
        );
      } catch (e) {
        // Handle registration failure, if needed
        print('Registration failed: $e');
      }
    }
  }

  //LoginForm deco
  InputDecoration deco(var lbl, var hnt, IconData? ic, IconData? eye) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromRGBO(134, 16, 7, 1),
        title: const Text(
          "SIGNUP",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ),
      body: SingleChildScrollView(
          child: Stack(
        children: [
          //Image
          Container(
            child: Image.asset(
              'assets/EiD - Never Give Up - Apps on Galaxy Store.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          // Login blur container
          Positioned(
            top: 365,
            left: 15,
            child: Container(
              height: 365,
              width: 370,
              decoration: const BoxDecoration(
                color: Color.fromARGB(96, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
          ),
          //Text only
          Positioned(
            top: 392,
            left: 50,
            child: Container(
              child: const Text(
                "SIGNIN",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          //Login Form
          Container(
            margin: const EdgeInsets.only(top: 436, left: 50),
            height: 300,
            width: 300,
            padding: const EdgeInsets.all(16.0),
            child: Form(
              //Add form to key to the Form Widget
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    //Assign controller
                    controller: _emailController,
                    style: TextStyle(color: Colors.white),
                    //Use this function to validate user input
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    decoration:
                        deco("Name", "Enter your UName", Icons.person, null),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    //Assign controller
                    controller: _passwordController,
                    obscureText: true,
                    //Use this function to validate user
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: deco(
                        "Password", "Enter your password", Icons.person, null),
                  ),
                  SizedBox(height: 16.0),
                  //Buttom

                  Container(
                    padding: EdgeInsets.only(left: 80),
                    child: ElevatedButton(
                      //Assigned onPressed to submit

                      onPressed: handleSubmit,
                      //Conditionally show the button label
                      child: Text(_isLogin ? 'Login' : 'Register'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
