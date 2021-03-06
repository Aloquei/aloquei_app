import '../core/bottom_bars/bottom_bar.dart';
import 'package:flutter/material.dart';
import '../core/forms/top_menu_gradient.dart';
import 'components/flow_builder_functions.dart';

import 'components/host_title_button.dart';

class HostPageTypeSize extends StatelessWidget {
  const HostPageTypeSize({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomBar(
          text: 'Next',
          color: Colors.grey[900],
          onPressedBack: () {
            Navigator.pop(context);
          },
          showNext: false,
        ),
        body: Column(
          children: [
            TopMenuGradient(
              color1: 0xFFae1a88,
              color2: 0xFF8b1fa6,
              text1: 'Que tipo de lugar você está',
              text2: 'oferecendo aos hóspedes?',
            ),
            Expanded(
                child: ListView(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                    children: [
                  HostTitleButton(
                    title: 'Um lugar inteiro',
                    onpressed: () => continuePressed(
                        typeRoom: "Um lugar inteiro", context: context),
                  ),
                  HostTitleButton(
                    title: 'Um quarto inteiro',
                    onpressed: () => continuePressed(
                        typeRoom: "Um quarto inteiro", context: context),
                  ),
                  HostTitleButton(
                    title: 'Um quarto compartilhado',
                    onpressed: () => continuePressed(
                        typeRoom: "Um quarto compartilhado", context: context),
                  ),
                ])),
          ],
        ));
  }
}
