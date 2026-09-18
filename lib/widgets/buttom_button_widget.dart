import 'package:flutter/material.dart';

const kAccentColor = Color(0xFFEB1555);

class BottomButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onTap;

  const BottomButton({
    super.key,
    required this.buttonTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kAccentColor,
        margin: const EdgeInsets.all(12.0),
        height: 60,
        width: double.infinity,
        child: Center(
          child: Text(
            buttonTitle,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
