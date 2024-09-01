import 'package:flutter/material.dart';

// usar callback para ser notificado sobre click no botao e alterar display

class Keyboard extends StatelessWidget {
  final void Function(String) cb;

  Keyboard(this.cb);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Column(
        children: <Widget>[
          ButtonRow([
            Button.big(text: 'AC', twobutton: true, color: Button.DARK, cb: cb),
            // Button(text: 'C'),
            Button(text: '%',color: Button.DARK, cb: cb),
            Button.operation(text: '/', cb: cb),
          ]),
          SizedBox(height: 1),
          ButtonRow([
            Button(text: '7', cb: cb),
            Button(text: '8', cb: cb),
            Button(text: '9', cb: cb),
            Button.operation(text: 'X', cb: cb),
          ]),
          SizedBox(height: 1),
          
          ButtonRow([
            Button(text: '4', cb: cb),
            Button(text: '5', cb: cb),
            Button(text: '6', cb: cb),
            Button.operation(text: '-', cb: cb),
          ]),
          SizedBox(height: 1),
          ButtonRow([
            Button(text: '1', cb: cb),
            Button(text: '2', cb: cb),
            Button(text: '3', cb: cb),
            Button.operation(text: '+', cb: cb),
          ]),
          SizedBox(height: 1),
          ButtonRow([
            Button.big(text: '0', twobutton: true, cb: cb),
            Button(text: ',', cb: cb),            
            // Button(text: 'C', cb: cb),
            Button.operation(text: '=', cb: cb),
          ])
        ],
      ),
    );
  }
}

class Button extends StatelessWidget {
  static const DARK = Color.fromRGBO(82, 82, 82, 1);
  static const OPERATION = Color.fromRGBO(33, 71, 241, 1);
  static const DEFAULT = Color.fromRGBO(112, 112, 112, 1);

  final String text;
  final bool twobutton;
  final Color color;
  final void Function(String) cb;

  Button({
    required this.text,
    this.twobutton = false,
    this.color = DEFAULT,
    required this.cb,
  });

   Button.big({
     required this.text,
     this.twobutton = false,
     this.color = DEFAULT,
     required this.cb,
  });

  Button.operation({
    required this.text,
    this.twobutton = false,
    this.color = OPERATION,
    required this.cb,
  });

  Button.dark({
    required this.text,
    this.twobutton = false,
    this.color = DARK,
    required this.cb,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: twobutton ? 2 : 1,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          shape: RoundedRectangleBorder(
            // borderRadius: BorderRadius.circular(18.0),
            borderRadius: BorderRadius.zero,
            side: BorderSide(color: DEFAULT)
            
        ),
          backgroundColor: this.color),
          
                   
        child: Text(text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w200,
            )),
        onPressed: () => cb(text),
      ),
    );
  }
}

class ButtonRow extends StatelessWidget {
  final List<Button> buttons;

  ButtonRow(this.buttons);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // Utilizar metodo Redux do Dart
        children: buttons.fold(<Widget>[], (list, b) {
          list.isEmpty ? list.add(b) : list.addAll([SizedBox(width: 1), b]);
          return list;

        }),
        
      ),
    );
  }
}
