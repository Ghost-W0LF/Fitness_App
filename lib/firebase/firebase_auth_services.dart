// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/material.dart';

class Auth {
    //Creating new instance of firebase auth
    final FirebaseAuth _auth = FirebaseAuth.instance;

    Future<void> registerWithEmailAndPassword(String email, String password) async {
        try {
            // This will create a new user in our firebase
            await _auth.createUserWithEmailAndPassword(
                email: email,
                password: password,
            );
        } on FirebaseAuthException catch (e) {
            if (e.code == 'weak-password') {
                print('The password provided is too weak.');
            } else if (e.code == 'email-already-in-use') {
                print('The account already exists for that email.');
            }
        } catch (e) {
            print(e);
        }
    }

    Future<void> signInWithEmailAndPassword(String email, String password,String username) async {
        try {
            // This will Log in the existing user in our firebase
            await _auth.signInWithEmailAndPassword(
                email: email,
                password: password,
               
            );
        } on FirebaseAuthException catch (e) {
            if (e.code == 'user-not-found') {
                print('No user found for that email.');
            } else if (e.code == 'wrong-password') {
                print('Wrong password provided for that user.');
            }
        } catch (e) {
            print(e);
        }
    }

  getUsers() {}

  deleteUser(user) {}
}
/*
class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // create user object based on email and password
  Future<void> registerWithEmailAndPassword(
      String email, String password) async {
   final user = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password
    );
 
  }

  //Login
  Future<void> signInWithEmailAndPassword(
      String email, String password) async {
    
      final user = await _auth.signInWithEmailAndPassword(
          email: email,
           password: password
           );
      
    
    
  }
}
*/