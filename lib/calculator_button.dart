import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final double aspectRatio;
  final Color backgroundColor;
  final int flex;

    CalculatorButton({
    required this.text,
    required this.onPressed,
    this.aspectRatio = 1,
    this.backgroundColor = Colors.blueAccent,
    this.flex = 1
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.width;
    double borderRadius = height / 2;

    return Expanded(
      flex: flex,
      child: Container(
        margin: EdgeInsets.all(8),
        child: SizedBox(
          height: height,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
        ),
      ),
    );
  }
}