import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';
import 'package:maths_master69/Providers/calculator_mini_screen.dart';
import 'package:provider/provider.dart';
import 'Widgets/home_widgets_exp.dart';

class CalculatorFront extends StatelessWidget {
  const CalculatorFront({super.key});

  @override
  Widget build(BuildContext context) {
    String tempEquationToDisplay =
        Provider.of<CalculatorScreenProvider>(context).equationToDisplay;
    String tempAnswerToDisplay =
        Provider.of<CalculatorScreenProvider>(context).answerToDisplay;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Center(
          child: Text(
            'Maths Master 69',
          ),
        ),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            flex: 3,
            //fit: FlexFit.loose,
            child: CalculatorScreen(
                context: context,
                equationToDisplay: tempEquationToDisplay,
                answerToDisplay: tempAnswerToDisplay),
          ),
          /* Flexible(
            child: FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 0.1,
            ),
          ), */

          //in a column/row use flexible and give each child a flex value , when the entire column renders weach child will be given space based on that flex value
          Flexible(
            flex: 7,
            //also if you need to create specific measurements for height and width based on parent , use layoutBuilder
            child: LayoutBuilder(builder: (context, constraints) {
              return GridView.count(
                childAspectRatio: //width/height
                    (constraints.maxWidth / 4) / (constraints.maxHeight / 5),
                crossAxisCount: 4,
                crossAxisSpacing: constraints.maxWidth * 0.02, //20 out of 1080
                padding: EdgeInsets.all(
                    constraints.maxWidth * 0.02), //20 out of 1080
                mainAxisSpacing: constraints.maxWidth * 0.01, //20 out of 1080
                children: [
                  createIcon(context, tempEquationToDisplay, '7', false, true),
                  createIcon(context, tempEquationToDisplay, '8', false, true),
                  createIcon(context, tempEquationToDisplay, '9', false, true),
                  createIcon(context, tempEquationToDisplay, '/', false, false),
                  createIcon(context, tempEquationToDisplay, '4', false, true),
                  createIcon(context, tempEquationToDisplay, '5', false, true),
                  createIcon(context, tempEquationToDisplay, '6', false, true),
                  createIcon(context, tempEquationToDisplay, 'x', false, false),
                  createIcon(context, tempEquationToDisplay, '1', false, true),
                  createIcon(context, tempEquationToDisplay, '2', false, true),
                  createIcon(context, tempEquationToDisplay, '3', false, true),
                  createIcon(context, tempEquationToDisplay, '-', false, false),
                  createIcon(context, tempEquationToDisplay, '.', false, true),
                  createIcon(context, tempEquationToDisplay, '0', false, true),
                  //delete key
                  createIcon(context, tempEquationToDisplay, 'del', true, false,
                      func: () {
                    if (tempEquationToDisplay.isNotEmpty) {
                      tempEquationToDisplay = tempEquationToDisplay.substring(
                          0, tempEquationToDisplay.length - 1);
                    }
                    Provider.of<CalculatorScreenProvider>(context,
                            listen: false)
                        .modifyEquationToDisplay(tempEquationToDisplay);
                  }),
                  createIcon(context, tempEquationToDisplay, '+', false, false),
                  createIcon(context, tempEquationToDisplay, '(', false, true),
                  createIcon(context, tempEquationToDisplay, ')', false, true),
                  //clear key
                  createIcon(context, tempEquationToDisplay, 'Clr', true, false,
                      func: () {
                    tempEquationToDisplay = "";
                    Provider.of<CalculatorScreenProvider>(context,
                            listen: false)
                        .modifyEquationToDisplay(tempEquationToDisplay);
                  }),
                  //equal key
                  createIcon(context, tempEquationToDisplay, '=', true, false,
                      func: () {
                    try {
                      tempAnswerToDisplay =
                          "${tempEquationToDisplay.interpret()}";
                    } catch (error) {
                      tempAnswerToDisplay = "user error";
                    }

                    Provider.of<CalculatorScreenProvider>(context,
                            listen: false)
                        .modifyAnswerToDisplay(tempAnswerToDisplay);
                  }),
                ],
              );
            }),
          )
        ],
      ),
    );
  }

  CalculatorIcon createIcon(BuildContext context, String tempEquationToDisplay,
      String number, bool isSpecial, bool isNumber,
      {func}) {
    return CalculatorIcon(
        context: context,
        element: number,
        buttoncolor: isNumber
            ? Colors.black
            : isSpecial
                ? Color.fromARGB(255, 235, 132, 36)
                : Color.fromARGB(255, 86, 152, 11),
        onTap: !isSpecial
            ? () {
                tempEquationToDisplay += number;
                Provider.of<CalculatorScreenProvider>(context, listen: false)
                    .modifyEquationToDisplay(tempEquationToDisplay);
              }
            : func);
  }
}
