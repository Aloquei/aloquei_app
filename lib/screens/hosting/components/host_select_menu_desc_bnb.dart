import 'package:aloquei_app/screens/hosting/components/host_title_subtitle_button.dart';
import 'package:flutter/material.dart';

class HostSelectMenuDescBnb extends StatelessWidget {
  final VoidCallback onpressed;

  const HostSelectMenuDescBnb({Key key, this.onpressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            children: [
          HostTitleSubtitleButton(
              title: 'Pousada',
              subtitle:
                  'Uma empresa de hospitalidade que oferece café da manhã aos hóspedes com um anfitrião no local.',
              onpressed: () {}),
          HostTitleSubtitleButton(
              title: 'Alojamento ecológico',
              subtitle:
                  'Uma empresa que oferece acomodações perto de ambientes naturais, como florestas ou montanhas.',
              onpressed: () {}),
          HostTitleSubtitleButton(
              title: 'Hotel-fazenda',
              subtitle:
                  'Uma acomodação rural onde os hóspedes podem interagir com animais ou fazer caminhadas e artesanato.',
              onpressed: () {}),
          HostTitleSubtitleButton(
              title: 'Minsu',
              subtitle:
                  'Uma empresa de hospitalidade que oferece quartos inteiros aos hóspedes em Taiwan.',
              onpressed: () {}),
          HostTitleSubtitleButton(
              title: 'Casa particular',
              subtitle:
                  'Um quarto inteiro em uma casa que parece uma pousada em Cuba.',
              onpressed: () {}),
          HostTitleSubtitleButton(
              title: 'Ryokan',
              subtitle:
                  'Uma pequena hospedaria que oferece aos hóspedes uma experiência cultural única no Japão.',
              onpressed: () {})
        ]));
  }
}