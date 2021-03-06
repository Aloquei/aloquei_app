import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String text;

  Description(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Observações',
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 18, fontFamily: 'Arial'),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          this.text,
          style: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 18, fontFamily: 'Arial'),
        ),
      ]),
    );
  }
}
