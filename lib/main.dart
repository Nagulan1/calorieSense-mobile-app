// 



import 'package:flutter/material.dart';
import 'user_input_screen.dart';
import 'login_screen.dart'; // Import the LoginScreen class
import 'signup_screen.dart'; // Import the SignupScreen class

void main() => runApp(CalorieCounterApp());

class CalorieCounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calorie Counter',
      theme: ThemeData(
        primaryColor: Colors.purple,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.purple,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LandingPage(),
        '/login': (context) => LoginScreen(), // Add login route
        '/signup': (context) => SignupScreen(), // Add signup route
      },
    );
  }
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calorie Counter'),
      ),
      body: Container(
        color: Colors.white, // Set background color to white
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/sample_image.jpg',
                width: 150,
                height: 250,
              ),
              SizedBox(height: 10),
              Text(
                'Welcome to Calorie Counter',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Track your daily calorie intake and stay healthy!',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('Login'),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.pushNamed(context, '/login'); // Navigate to login screen
              //   },
              //   style: ElevatedButton.styleFrom(
              //     primary: Colors.purple,
              //     padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              //     textStyle: TextStyle(fontSize: 18),
              //   ),
              //   child: Text('Login'),
              ),
               SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup'); // Navigate to signup screen
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
