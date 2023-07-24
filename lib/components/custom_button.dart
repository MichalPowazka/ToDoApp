import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData iconData;

  const CustomButton(
      {required this.text, required this.onPressed, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData),
          const SizedBox(width: 8), // Dodatkowy odstęp między ikoną a tekstem
          Text(text),
        ],
      ),
    );
  }
}
