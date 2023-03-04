import 'package:flutter/material.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen(
      {Key? key,
      required this.equationToDisplay,
      required this.answerToDisplay,
      required BuildContext context})
      : super(key: key);

  final String equationToDisplay;
  final String answerToDisplay;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 150,
      margin: const EdgeInsets.all(3),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blueGrey[900],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SingleChildScrollView(
              controller: ScrollController(),
              scrollDirection: Axis.horizontal,
              child: Text(
                equationToDisplay,
                style: const TextStyle(
                  color: Color.fromARGB(255, 236, 234, 234),
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(answerToDisplay,
                style: const TextStyle(
                    color: Color.fromARGB(255, 236, 234, 234), fontSize: 18)),
          )
        ],
      ),
    );
  }
}
