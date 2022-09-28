import 'package:flutter/material.dart';

import 'square.dart';

class TrisColumn extends StatelessWidget {
  const TrisColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [FirstColumn(), SecondColumn(), ThirdColumn()],
    );
  }
}

class FirstColumn extends StatelessWidget {
  const FirstColumn({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width * 0.3;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Square(width: width, sides: const [2, 3]),
        Square(width: width, sides: const [2, 3]),
        Square(width: width, sides: const [2]),
      ],
    );
  }
}

class SecondColumn extends StatelessWidget {
  const SecondColumn({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width * 0.3;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Square(width: width, sides: const [2, 3]),
        Square(width: width, sides: const [2, 3]),
        Square(width: width, sides: const [2]),
      ],
    );
  }
}

class ThirdColumn extends StatelessWidget {
  const ThirdColumn({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width * 0.3;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Square(width: width, sides: const [3]),
        Square(width: width, sides: const [3]),
        Square(width: width, sides: const []),
      ],
    );
  }
}
