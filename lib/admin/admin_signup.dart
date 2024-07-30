import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/admin/admin_home.dart';

import 'package:my_flutter_app/firebase/firebase_auth_services.dart';

class adminSignup extends StatefulWidget {
  @override
  State<adminSignup> createState() => _Signup();
}

class _Signup extends State<adminSignup> {
//Use this form key to validate user's input
  final _formKey = GlobalKey<FormState>();
  final bool _isLogin = false;
//Use this to store user inputs
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.value.text;
      final password = _passwordController.value.text;
      final username =
          _usernameController.value.text; // Get the entered username

      try {
        // Attempt to register the user
        await Auth().registerWithEmailAndPassword(email, password);

        // Post user details to Firestore if registration is successful
        await saveUserDetailsToFirestore(
            username, email); // Save username and email to Firestore

        // Navigate to the home page if registration is successful
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AdminHome()),
        );
      } catch (e) {
        print('Registration failed: $e');
      }
    }
  }

  // Function to save user details to Firestore
  Future<void> saveUserDetailsToFirestore(String username, String email) async {
    try {
      await FirebaseFirestore.instance.collection('Admin').doc(email).set({
        'username': username,
        'email': email,
      });
    } catch (e) {
      print('Error saving user details to Firestore: $e');
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
        backgroundColor: Color.fromRGBO(134, 16, 7, 1),
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
            top: 300,
            left: 15,
            child: Container(
              height: 400,
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
            top: 320,
            left: 50,
            child: Container(
              child: const Text(
                "ADMIN SIGNUP",
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
            margin: const EdgeInsets.only(top: 380, left: 50),
            height: 600,
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
                        deco("Email", "Enter your Email", Icons.person, null),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _usernameController,
                    style: TextStyle(color: Colors.white),
                    decoration: deco("Full Name", "Enter Your Full Name",
                        Icons.person, null),
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
