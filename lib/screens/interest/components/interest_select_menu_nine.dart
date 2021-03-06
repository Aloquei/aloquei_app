import '../../core/bottom_bars/bottom_bar.dart';

import '../../core/forms/top_menu_gradient.dart';
import '../../core/snack_bar.dart';
import 'flow_builder_functions.dart';
import 'package:flutter/material.dart';

class InterestSelectMenuDescription extends StatelessWidget {
  const InterestSelectMenuDescription({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text;
    return Scaffold(
        bottomNavigationBar: BottomBar(
          text: 'Avançar',
          color: Colors.grey[900],
          onPressedBack: () {
            Navigator.pop(context);
          },
          showNext: true,
          onpressedNext: () {
            sendData(observations: text, context: context);
            buildSuccesSnackBar(context, 'Incluido com sucesso');
            Navigator.of(context, rootNavigator: true).pop(context);
          },
        ),
        body: Column(children: [
          TopMenuGradient(
            color1: 0xFFda1364,
            color2: 0xFF931da2,
            text1: 'Características',
            text2: 'observações',
          ),
          Expanded(
              child: ListView(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  children: [
                Container(
                    margin: EdgeInsets.all(15),
                    height: 200,
                    child: TextField(
                      onChanged: (value) {
                        text = value;
                      },
                      maxLines: 7,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w800),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText:
                            'Escreva uma breve descrição do local de seu interesse',
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                            fontWeight: FontWeight.w800),
                      ),
                    ))
              ]))
        ]));
  }
}
