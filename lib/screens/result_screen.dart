import 'package:flutter/material.dart';
import '../widgets/reusable_card_widget.dart';
import '../widgets/buttom_button_widget.dart';

const kCardColor = Color(0xFF1D1E33);
const kTextColor = Color(0xFF8D8E98);

class ResultScreen extends StatelessWidget {
  final double bmiResult;

  const ResultScreen({super.key, required this.bmiResult});

  String get resultText {
    if (bmiResult >= 25) return 'Overweight';
    if (bmiResult > 18.5) return 'Normal';
    return 'Underweight';
  }

  String get interpretation {
    if (bmiResult >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (bmiResult > 18.5) {
      return 'You Have a Normal Body Weight, Good Job.';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }

  Color get resultColor {
    if (bmiResult >= 25) return Colors.red;
    if (bmiResult > 18.5) return const Color(0xFF24D876);
    return Colors.orange;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Your Result',
              style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: TextStyle(
                        color: resultColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    bmiResult.toStringAsFixed(1),
                    style: const TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18.0, color: kTextColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'Re - Calculate',
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
