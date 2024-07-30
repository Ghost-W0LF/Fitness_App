import 'package:flutter/material.dart';

const Color yellow = Color(0xFFFFFF00);

const Color blue = Color(0xFF0072C6);
const Color green = Color(0xFF00B050);
const Color black = Color.fromARGB(255, 0, 0, 0);
const Color gold = Color.fromARGB(255, 255, 185, 15);

class starts extends StatelessWidget {
  const starts({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: black,
          title: const Text("Start"),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text("Abhinav"),
                accountEmail: Text("abhinab1221@gmail.com",
                    style: TextStyle(
                      color: Colors.black,
                    )),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 144, 91, 88),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/photo.jpeg'),
                    radius: 90,
                  ),
                ),
                decoration: BoxDecoration(
                  color: gold,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Login"),
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
              // Other list tile items...
            ],
          ),
        ),
        body: Container(
          width: double.infinity,
          height: 812,
          decoration: const BoxDecoration(
            color: Color(0xFFFFFFFF),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Align(
                  child: SizedBox(
                    width: 375,
                    height: 812,
                    child: Image.asset('assets/gym.png', fit: BoxFit.fill)
                      
                     
                    
                  ),
                ),
              ),
              // Other positioned elements...
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const starts());
}

/*
leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/second');
          },
          child: Icon(Icons.home),
        ),
        Stack(
        children: [
          Image.asset('assets/gym.png', fit: BoxFit.fill),
          Container(
            padding: EdgeInsets.only(top: 550, left: 145),
            child: ElevatedButton(
              onPressed: () {
              Navigator.pushNamed(context, '/Signup');
            },
              child: Text("Sign up"),
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(0, 0, 0, 1),
                onPrimary: Color.fromARGB(255, 167, 15, 4),
                shadowColor: Color.fromARGB(255, 255, 255, 255),
                elevation: 2,
                side: BorderSide(
                  width: 0.3,
                  color: Colors.white,
                ),
                animationDuration: Duration(seconds: 3),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 600, left: 155),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text("Login"),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                primary: Color.fromRGBO(0, 0, 0, 1),
                onPrimary: Color.fromARGB(255, 167, 15, 4),
                shadowColor: Color.fromARGB(255, 255, 255, 255),
                elevation: 2,
                side: const BorderSide(
                  width: 0.3,
                  color: Colors.white,
                ),
                animationDuration: const Duration(seconds: 30),
              ),
            ),
          ),
          
        ],
      ),
*/
