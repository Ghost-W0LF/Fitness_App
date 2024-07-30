import 'package:flutter/material.dart';
import 'package:my_flutter_app/firebase/Signup.dart';
import 'package:my_flutter_app/firebase/login.dart';

class AuthPage extends StatefulWidget {
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  void toggelScreens (){
    setState((){
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return login();
    } else {
      return Signup( );
    }
  }
}
