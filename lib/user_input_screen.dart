import 'package:flutter/material.dart';
import 'bmr_calculator.dart'; // Import the BmrCalculator class
import 'results_screen.dart';

class UserInputScreen extends StatefulWidget {
  @override
  _UserInputScreenState createState() => _UserInputScreenState();
}

class _UserInputScreenState extends State<UserInputScreen> {
  Gender? _selectedGender;
  double? _age;
  double? _weight;
  double? _height;
  ActivityLevel? _selectedActivityLevel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('Gender'),
            Column(
              children: <Widget>[
                RadioListTile<Gender>(
                  title: Text('Male'),
                  value: Gender.male,
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                ),
                RadioListTile<Gender>(
                  title: Text('Female'),
                  value: Gender.female,
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                ),
              ],
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Age'),
              onChanged: (value) {
                setState(() {
                  _age = double.tryParse(value);
                });
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Weight (kg)'),
              onChanged: (value) {
                setState(() {
                  _weight = double.tryParse(value);
                });
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Height (cm)'),
              onChanged: (value) {
                setState(() {
                  _height = double.tryParse(value);
                });
              },
            ),
            Text('Activity Level'),
            Column(
              children: <Widget>[
                RadioListTile<ActivityLevel>(
                  title: Text('Sedentary'),
                  value: ActivityLevel.sedentary,
                  groupValue: _selectedActivityLevel,
                  onChanged: (value) {
                    setState(() {
                      _selectedActivityLevel = value;
                    });
                  },
                ),
                RadioListTile<ActivityLevel>(
                  title: Text('Lightly Active'),
                  value: ActivityLevel.lightlyActive,
                  groupValue: _selectedActivityLevel,
                  onChanged: (value) {
                    setState(() {
                      _selectedActivityLevel = value;
                    });
                  },
                ),
                RadioListTile<ActivityLevel>(
                  title: Text('Moderately Active'),
                  value: ActivityLevel.moderatelyActive,
                  groupValue: _selectedActivityLevel,
                  onChanged: (value) {
                    setState(() {
                      _selectedActivityLevel = value;
                    });
                  },
                ),
                RadioListTile<ActivityLevel>(
                  title: Text('Very Active'),
                  value: ActivityLevel.veryActive,
                  groupValue: _selectedActivityLevel,
                  onChanged: (value) {
                    setState(() {
                      _selectedActivityLevel = value;
                    });
                  },
                ),
                RadioListTile<ActivityLevel>(
                  title: Text('Super Active'),
                  value: ActivityLevel.superActive,
                  groupValue: _selectedActivityLevel,
                  onChanged: (value) {
                    setState(() {
                      _selectedActivityLevel = value;
                    });
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                // Validate and gather user input
                if (_age != null &&
                    _weight != null &&
                    _height != null &&
                    _selectedGender != null &&
                    _selectedActivityLevel != null) {
                  BmrCalculator bmrCalculator = BmrCalculator();
                  double bmr = bmrCalculator.calculateBMR(_age!, _weight!, _height!, _selectedGender!);
                  double tdee = bmrCalculator.calculateTDEE(bmr, _selectedActivityLevel!);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsScreen(
                        bmr: bmr,
                        requiredCalories: tdee,
                      ),
                    ),
                  );
                } else {
                  // Show an error message or validation message to the user
                }
              },
              child: Text('Calculate BMR'),
            ),
          ],
        ),
      ),
    );
  }
}

enum Gender {
  male,
  female,
}

enum ActivityLevel {
  sedentary,
  lightlyActive,
  moderatelyActive,
  veryActive,
  superActive,
}
