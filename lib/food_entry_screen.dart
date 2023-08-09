// 
import 'package:flutter/material.dart';

class FoodEntryScreen extends StatefulWidget {
  final double requiredCalories;

  FoodEntryScreen({required this.requiredCalories});

  @override
  _FoodEntryScreenState createState() => _FoodEntryScreenState();
}

class FoodItem {
  final String name;
  final double calories;

  FoodItem({required this.name, required this.calories});
}

class _FoodEntryScreenState extends State<FoodEntryScreen> {
  double _enteredCalories = 0.0;
  double _remainingCalories = 0.0;
  List<FoodItem> _selectedFoodItems = [];

  final List<FoodItem> _foodItems = [
    FoodItem(name: 'Apple', calories: 52.0),
    FoodItem(name: 'Banana', calories: 96.0),
    FoodItem(name: 'Orange', calories: 62.0),
    FoodItem(name: 'Yogurt', calories: 150.0),
    FoodItem(name: 'Chicken Breast', calories: 165.0),
    // Add more food items here
  ];

  void _calculateRemainingCalories() {
    double totalCaloriesConsumed = _selectedFoodItems.map((food) => food.calories).fold(0, (a, b) => a + b);
    setState(() {
      _remainingCalories = widget.requiredCalories - totalCaloriesConsumed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Entry'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Select and enter your food intake for the day',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _foodItems.length,
                itemBuilder: (context, index) {
                  final foodItem = _foodItems[index];
                  return ListTile(
                    title: Text(foodItem.name),
                    subtitle: Text('${foodItem.calories} calories'),
                    trailing: Checkbox(
                      value: _selectedFoodItems.contains(foodItem),
                      onChanged: (value) {
                        setState(() {
                          if (value == true) {
                            _selectedFoodItems.add(foodItem);
                          } else {
                            _selectedFoodItems.remove(foodItem);
                          }
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Selected Food Items:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _selectedFoodItems.length,
                itemBuilder: (context, index) {
                  final selectedFoodItem = _selectedFoodItems[index];
                  return ListTile(
                    title: Text(selectedFoodItem.name),
                    subtitle: Text('${selectedFoodItem.calories} calories'),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Additional Calories'),
              onChanged: (value) {
                setState(() {
                  _enteredCalories = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                _calculateRemainingCalories();
              },
              child: Text('Calculate Remaining Calories'),
            ),
            SizedBox(height: 16),
            Text(
              'Remaining Calories: $_remainingCalories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
