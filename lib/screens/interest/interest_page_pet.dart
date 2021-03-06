import 'package:flutter/material.dart';

import '../core/bottom_bars/bottom_bar.dart';
import '../core/forms/title_subtitle_button.dart';
import '../core/forms/top_menu_gradient.dart';
import 'components/flow_builder_functions.dart';

class InterestPagePet extends StatelessWidget {
  const InterestPagePet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomBar(
          text: 'Avançar',
          color: Colors.grey[900],
          onPressedBack: () {
            Navigator.pop(context);
          },
        ),
        body: Column(
          children: [
            TopMenuGradient(
              color1: 0xFFda1364,
              color2: 0xFF931da2,
              text1: 'Preferência ',
              text2: 'por pets no ambiente?',
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                children: [
                  TitleSubtitleButton(
                      title: 'Sim',
                      subtitle: 'Sim, gosto de animais',
                      onpressed: () {
                        continuePressed(likesPets: true, context: context);
                      }),
                  TitleSubtitleButton(
                      title: 'Não',
                      subtitle: 'Prefiro ambientes sem animais',
                      onpressed: () {
                        continuePressed(likesPets: false, context: context);
                      }),
                  /*TitleSubtitleButton(
                      title: 'Tanto faz',
                      subtitle: 'Não tenho preferência',
                      onpressed: () {}),*/
                ],
              ),
            ),
          ],
        ));
  }
}
