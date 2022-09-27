import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key? key, required this.pageToVisit, required this.buttonText})
      : super(key: key);
  final String pageToVisit;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => Navigator.of(context).pushNamed(pageToVisit),
        child: Text(buttonText));
  }
}
