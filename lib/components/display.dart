import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';





class Display extends StatelessWidget {
  final String text;

  Display(this.text);

  @override
  Widget build(BuildContext context) {
    return Expanded(
       flex: 1,
        child: Container(
          // ignore: prefer_const_constructors
          color: Color.fromRGBO(48 , 48, 48, 1),
          child: Column(
            // Colocando texto na parte de baixo da coluna
            mainAxisAlignment: MainAxisAlignment.end,
            // Deixar a coluna ocupando a tela inteira
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget> [
              // Dando espaco no valor do texto
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText(
                  text,
                  minFontSize: 20,
                  maxFontSize: 80,
                  maxLines: 1,
                  textAlign: TextAlign.end,
                  
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    decoration: TextDecoration.none,
                    fontSize: 80,
                    color: Colors.white,
                  ),
                  ),
              ),                          ],
          ),
    ));
  }
}
