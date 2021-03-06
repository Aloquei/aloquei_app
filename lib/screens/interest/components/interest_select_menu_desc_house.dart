import 'package:flutter/material.dart';

import '../../core/bottom_bars/bottom_bar.dart';
import '../../core/forms/title_subtitle_button.dart';
import '../../core/forms/top_menu_gradient.dart';
import 'flow_builder_functions.dart';

class InterestSelectMenuDescHouse extends StatelessWidget {
  const InterestSelectMenuDescHouse({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomBar(
          text: 'Avançar',
          color: Colors.grey[900],
        ),
        body: Column(children: [
          TopMenuGradient(
            color1: 0xFFda1364,
            color2: 0xFF931da2,
            text1: 'Já possui',
            text2: 'uma casa?',
          ),
          Expanded(
            child: ListView(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                children: [
                  TitleSubtitleButton(
                    title: 'Sim',
                    subtitle: 'Já tenho moradia cadastrada.',
                    onpressed: () =>
                        continuePressed(hasHouse: true, context: context),
                  ),
                  TitleSubtitleButton(
                      title: 'Não',
                      subtitle: 'Não tenho moradia cadastrada.',
                      onpressed: () =>
                          continuePressed(hasHouse: false, context: context)),
                ]),
          ),
        ]));
  }
}
