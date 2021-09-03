import 'package:flutter/material.dart';

import '../core/forms/top_menu_image.dart';
import 'components/host_bottombar.dart';
import 'components/host_select_menu_nine.dart';
import 'host_page_price.dart';

class HostPageDescription extends StatelessWidget {
  const HostPageDescription({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: HostBottomBar(
          text: 'Avançar',
          color: Colors.grey[900],
          onPressedBack: () {
            Navigator.pop(context);
          },
          onpressedNext: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HostPagePrice()),
            );
          },
        ),
        body: Container(
            color: Colors.white,
            child: Column(
              children: [
                TopMenuImage(
                  image1: "assets/insideHouse.jpg",
                  text1: 'Agora vamos ser mais',
                  text2: 'específicos',
                ),
                HostSelectMenuDescription(
                  onpressed: () {},
                ),
              ],
            )));
  }
}
