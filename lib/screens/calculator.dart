import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/display.dart';
import '../components/keyboard.dart';
import '../provider/calculo_provider.dart';

class Calculator extends StatefulWidget {

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final Memory memory = Memory();
   
    _onPressed(String command) {
    setState(() {
      memory.applyCommand(command);
      
    });
  
}


  @override
  Widget build(BuildContext context) {

    // Evitar quebra de layout ao virar o device
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
    return MaterialApp(
      home: Column(
        children: <Widget>[
          Display(memory.value),
          // ignore: prefer_const_constructors
          Keyboard(_onPressed),
        ],
      ),
    );
  }

}