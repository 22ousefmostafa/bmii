import 'dart:math';
import 'package:flutter/material.dart';
import '../widgets/reusable_card_widget.dart';
import '../widgets/buttom_button_widget.dart';
import 'result_screen.dart';

const kCardColor = Color(0xFF1D1E33);
const kInactiveCardColor = Color(0xFF111328);
const kAccentColor = Color(0xFFEB1555);
const kTextColor = Color(0xFF8D8E98);

enum Gender { male, female }

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  Gender selectedGender = Gender.male;
  int height = 150;
  int weight = 60;
  int age = 26;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Row 1: Gender
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: selectedGender == Gender.male
                        ? kCardColor
                        : kInactiveCardColor,
                    onTap: () => setState(() => selectedGender = Gender.male),
                    child: const IconContent(icon: Icons.male, label: 'Male'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: selectedGender == Gender.female
                        ? kCardColor
                        : kInactiveCardColor,
                    onTap: () => setState(() => selectedGender = Gender.female),
                    child:
                        const IconContent(icon: Icons.female, label: 'Female'),
                  ),
                ),
              ],
            ),
          ),

          // Row 2: Height
          Expanded(
            child: ReusableCard(
              color: kCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Height',
                      style: TextStyle(color: kTextColor, fontSize: 18.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text('$height',
                          style: const TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      const Text('cm',
                          style: TextStyle(color: kTextColor, fontSize: 16.0)),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: kAccentColor,
                      inactiveTrackColor: Colors.grey.shade700,
                      thumbColor: kAccentColor,
                      overlayColor: kAccentColor.withOpacity(0.2),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 8.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Row 3: Weight & Age
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kCardColor,
                    child: CounterContent(
                      label: 'Weight',
                      value: weight,
                      onDecrement: () => setState(() => weight--),
                      onIncrement: () => setState(() => weight++),
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kCardColor,
                    child: CounterContent(
                      label: 'Age',
                      value: age,
                      onDecrement: () => setState(() => age--),
                      onIncrement: () => setState(() => age++),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bottom Button
          BottomButton(
            buttonTitle: 'Calculate',
            onTap: () {
              double bmi = weight / pow(height / 100, 2);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultScreen(bmiResult: bmi),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Helper Widget for Icon Content
class IconContent extends StatelessWidget {
  final IconData icon;
  final String label;

  const IconContent({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 70.0, color: Colors.white),
        const SizedBox(height: 10.0),
        Text(label, style: const TextStyle(color: kTextColor, fontSize: 18.0)),
      ],
    );
  }
}

// Helper Widget for Counter Content
class CounterContent extends StatelessWidget {
  final String label;
  final int value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CounterContent({
    super.key,
    required this.label,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label, style: const TextStyle(color: kTextColor, fontSize: 18.0)),
        Text('$value',
            style: const TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton.small(
              heroTag: '$label-dec',
              onPressed: onDecrement,
              backgroundColor: Colors.grey.shade700,
              child: const Icon(Icons.remove, color: Colors.white),
            ),
            const SizedBox(width: 10.0),
            FloatingActionButton.small(
              heroTag: '$label-inc',
              onPressed: onIncrement,
              backgroundColor: Colors.grey.shade700,
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
