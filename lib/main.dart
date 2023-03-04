import 'dart:ui';
import 'package:maths_master69/Providers/calculator_mini_screen.dart';
import 'package:provider/provider.dart';
import 'package:string_splitter/string_splitter.dart';

import 'app.dart';

/*organization 101:
first of all , you want two main dart files in every app you create , the main.dart and app.dart
  - main.dart should only contain the runApp method (with necessary providers , etc) 
  -main.dart should run  the widget in app.dart and that's it
      -widget in app.dart should be a stateless widget and its build method should return the material app and 
      in it , it should return the home /initial screen of your app

Secondly , you need to split your project into multiple files
  -Screens/pages file
  -Providers file

  *** inside the screens file you should create a seperate file for each screen in your app I.E home screen , settings screen , 
  etc.. and in each of those apps split it into 2 parts
    - the class of the whole widget screen itself
    - a file containing all the smaller widgets that you created to use in the whole widget screen itself

    ex: if im making a calculator app and this app has a homescreen, structure would be like
      Screens:
        home:
          calculator_front.dart
        Widgets:
          calcualtor_button.dart
          calculator_mini_screen.dart
  
  ***inside the providers file put each provider class you create and that should be it
        

 */

import 'package:flutter/material.dart';

void main() {
  final l = StringSplitter.split("first note.second/third",
      splitters: [' ', '.', '/']);
  print(l);
  /*  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: ((context) => CalculatorScreenProvider())),
    ],
    child: const MyApp(),
  )); */
}
