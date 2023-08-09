import 'package:flutter/material.dart';
import 'food_entry_screen.dart';

class ResultsScreen extends StatelessWidget {
  final double bmr;
  final double requiredCalories;

  ResultsScreen({
    required this.bmr,
    required this.requiredCalories,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your BMR: $bmr'),
            SizedBox(height: 20),
            Text('Required Calories per Day: $requiredCalories'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FoodEntryScreen(
                      requiredCalories: requiredCalories,
                    ),
                  ),
                );
              },
              child: Text('Enter Food Intake'),
            ),
          ],
        ),
      ),
    );
  }
}
