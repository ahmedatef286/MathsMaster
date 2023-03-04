import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CalculatorIcon extends StatelessWidget {
  const CalculatorIcon(
      {super.key,
      required this.element,
      required this.onTap,
      required this.buttoncolor,
      required BuildContext context});
  final String element;
  final onTap;
  final Color buttoncolor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(buttoncolor),
      ),
      child: LayoutBuilder(builder: (context, Constraints) {
        return Text(
          element,
          textScaleFactor: Constraints.maxHeight /
              50, //this value was reached through trial and error
          style: TextStyle(color: Colors.white),
        );
      }),
    );
  }
}
