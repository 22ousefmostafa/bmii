import 'package:flutter/material.dart';
import '../widgets/reusable_card_widget.dart';
import '../widgets/buttom_button_widget.dart';

class ResultScreen extends StatelessWidget {
  final double bmiResult;

  const ResultScreen({super.key, required this.bmiResult});

  @override
  Widget build(BuildContext context) {
    String resultText = 'Normal';
    Color resultColor = const Color(0xFF24D876);
    String interpretation = 'You have a normal body weight. Good job!';

    if (bmiResult >= 25) {
      resultText = 'Overweight';
      resultColor = Colors.red;
      interpretation =
          'You have a higher than normal body weight. Try to exercise more.';
    } else if (bmiResult < 18.5) {
      resultText = 'Underweight';
      resultColor = Colors.orange;
      interpretation =
          'You have a lower than normal body weight. You can eat a bit more.';
    }

    return Scaffold(
      appBar: AppBar(title: const Text('BMI Calculator'), centerTitle: true),
      body: Column(
        crossAlignment: CrossAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Your Result',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: const Color(0xFF1D1E33),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: TextStyle(
                      color: resultColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    bmiResult.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF8D8E98),
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'Re - Calculate',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
