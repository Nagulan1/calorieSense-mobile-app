import 'user_input_screen.dart'; // Import the enums Gender and ActivityLevel

class BmrCalculator {
  double calculateBMR(double age, double weight, double height, Gender gender) {
    if (gender == Gender.male) {
      return 66 + (13.75 * weight) + (5.003 * height) - (6.755 * age);
    } else {
      return 655 + (9.563 * weight) + (1.850 * height) - (4.676 * age);
    }
  }

  double calculateTDEE(double bmr, ActivityLevel activityLevel) {
    double tdee;
    switch (activityLevel) {
      case ActivityLevel.sedentary:
        tdee = bmr * 1.2;
        break;
      case ActivityLevel.lightlyActive:
        tdee = bmr * 1.375;
        break;
      case ActivityLevel.moderatelyActive:
        tdee = bmr * 1.55;
        break;
      case ActivityLevel.veryActive:
        tdee = bmr * 1.725;
        break;
      case ActivityLevel.superActive:
        tdee = bmr * 1.9;
        break;
    }
    return tdee;
  }
}
