import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/Pages/home.dart';
import 'package:my_flutter_app/firebase/login.dart';

class mainPage extends StatefulWidget {
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _AuthPageState();
}

class _AuthPageState extends State<mainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return home();
            } else {
              return login();
            }
          }),
    );
  }
}
