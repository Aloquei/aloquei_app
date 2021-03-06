import '../core/snack_bar.dart';

import '../core/bottom_bars/bottom_bar.dart';
import 'package:flutter/material.dart';

import '../core/forms/top_menu_gradient.dart';
import 'components/flow_builder_functions.dart';

class HostPagePrice extends StatelessWidget {
  const HostPagePrice({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double price;
    return Scaffold(
        bottomNavigationBar: BottomBar(
            text: 'Salve seu anúncio',
            color: Colors.pink,
            onPressedBack: () {
              Navigator.pop(context);
            },
            showNext: true,
            onpressedNext: () {
              sendData(
                valueMonth: price,
                context: context,
              );
              buildSuccesSnackBar(context, 'Incluido com sucesso');
              Navigator.of(context, rootNavigator: true).pop(context);
            }),
        body: Container(
            color: Colors.white,
            child: Column(
              children: [
                TopMenuGradient(
                  color1: 0xFFae1a88,
                  color2: 0xFF8b1fa6,
                  text1: 'Agora vem a parte',
                  text2: 'divertida: definir seu preço',
                ),
                Expanded(
                    child: ListView(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                        children: [
                      Container(
                          padding: EdgeInsets.only(
                              top: 25, bottom: 5, left: 90, right: 90),
                          child: TextField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            onChanged: (value) => (price = double.parse(value)),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w900),
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(40),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 0.5),
                              ),
                              hintText: 'R\$',
                            ),
                          )),
                      Container(
                        child: Center(
                            child: Text(
                          'por noite',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w800),
                        )),
                      )
                    ])),
              ],
            )));
  }
}
