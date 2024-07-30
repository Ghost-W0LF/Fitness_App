// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/admin/admin_login.dart';

import 'package:my_flutter_app/firebase/Signup.dart';
import 'package:my_flutter_app/Pages/home.dart';

class login extends StatelessWidget {
  //const login({super.key, required bool showLoginPage});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Other MaterialApp properties...

      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 36, 36, 36),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor:  Color.fromRGBO(134, 16, 7, 1),
          title: const Text(
            "LOGIN",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
        ),
        body: const AnimatedLogin(),
      ),
    );
  }
}

class AnimatedLogin extends StatefulWidget {
  const AnimatedLogin({Key? key}) : super(key: key);

  @override
  State<AnimatedLogin> createState() => _AnimatedLoginState();
}

ElevatedButton btn(VoidCallback onPressed) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      foregroundColor: const Color.fromARGB(255, 167, 15, 4),
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
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
      minimumSize: const Size(90, 40),
    ),
    child: const Text(
      "Signin",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
    ),
  );
}

class _AnimatedLoginState extends State<AnimatedLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> Signin(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Check if the user is successfully authenticated
      if (userCredential.user != null) {
        
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const home()),
        );
      }
    } catch (e) {
      // Handle sign-in failure (e.g., display an error message)
      print('Sign-in failed: $e');
      // Show a snackbar or error message here
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid credentials. Please try again.'),
        ),
      );
    }
  }

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Color clr = Colors.white;
  bool see = true;
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          // Image
          Container(
            child: Image.asset(
              'assets/EiD - Never Give Up - Apps on Galaxy Store.jpeg',
              fit: BoxFit.cover,
            ),
          ),

          // Login blur container
          Positioned(
            top: 375,
            left: 9,
            child: Container(
              height: 365,
              width: 410,
              decoration: const BoxDecoration(
                color: Color.fromARGB(96, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
          ),

          // Actual login form
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 436, left: 50),
                height: 300,
                width: 300,
                child: Column(
                  children: [
                    //UserNAme
                    TextFormField(
                      controller: _emailController,
                      toolbarOptions: const ToolbarOptions(
                        copy: true,
                        cut: true,
                        paste: true,
                        selectAll: true,
                      ),
                      obscureText: false,
                      style: const TextStyle(),
                      decoration:
                          deco("Name", "Enter your UName", Icons.person, null),
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    TextFormField(
                      //Password
                      toolbarOptions: const ToolbarOptions(
                        copy: true,
                        paste: true,
                        cut: true,
                        selectAll: true,
                      ),
                      controller: _passwordController,
                      obscureText: see,
                      decoration: deco(
                        "Password",
                        "password",
                        Icons.password,
                        Icons.remove_red_eye,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(5)),
                    //
                    //Submit buttom
                    const Padding(padding: EdgeInsets.all(5)),
                    // SUBMIT Button
                    btn(() {
                      // Add your login logic here
                      Signin(context);
                    }),
                  ],
                ),
              )
            ],
          ),

          // "WELCOME BACK" text
          const Padding(
            padding: EdgeInsets.only(top: 390, left: 30),
            child: Text(
              "WELCOME BACK",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // "Don't have an account??" text
          const Padding(
            padding: EdgeInsets.only(top: 671, left: 40),
            child: Text(
              "Don't have an account??",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

          // "SignUp!!" button
          Padding(
            padding: const EdgeInsets.only(top: 655, left: 218),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Signup()));
              },
              child: const Text(
                "SignUp!!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          //Admin button
          Padding(
            padding: const EdgeInsets.only(top: 655, left: 300),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => adminLogin()));
              },
              child: const Text(
                "ADMIN",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

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
      suffixIcon: eye != null
          ? IconButton(
              color: clr,
              icon: Icon(eye),
              onPressed: () {
                setState(() {
                  if (flag) {
                    clr = Colors.blue;
                    see = false;
                    flag = false;
                  } else {
                    clr = Colors.white;
                    see = true;
                    flag = true;
                  }
                });
              },
            )
          : null,
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromARGB(255, 255, 255, 255),
          width: 3,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );
        
  }
}
