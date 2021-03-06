import '../core/bottom_bars/bottom_bar.dart';
import 'package:flutter/material.dart';

import '../core/forms/top_menu_image.dart';
import 'components/host_select_menu_photos.dart';

class HostPagePhotos extends StatelessWidget {
  const HostPagePhotos({Key key}) : super(key: key);

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
        body: Container(
            color: Colors.white,
            child: Column(
              children: [
                TopMenuImage(
                  image1: "assets/cellphonePhoto.jpg",
                  text1: 'A seguir, vamos adicionar',
                  text2: 'algumas fotos do seu espaço',
                ),
                HostSelectMenuPhotos(
                  onpressed: () {},
                ),
              ],
            )));
  }
}
