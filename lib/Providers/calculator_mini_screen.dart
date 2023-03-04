import 'package:flutter/cupertino.dart';

class CalculatorScreenProvider extends ChangeNotifier {
  String _equationToDisplay = "0.0";
  String _answerToDisplay = "0.0";

  String get equationToDisplay => _equationToDisplay;
  String get answerToDisplay => _answerToDisplay;

  void modifyEquationToDisplay(String newEquation) {
    _equationToDisplay = newEquation;
    notifyListeners();
  }

  void modifyAnswerToDisplay(String newAnswer) {
    _answerToDisplay = newAnswer;
    notifyListeners();
  }
}
