import 'package:flutter/material.dart';

class HostSelectMenuPhotos extends StatelessWidget {
  final VoidCallback onpressed;

  const HostSelectMenuPhotos({Key key, this.onpressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            children: [
          Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(minimumSize: Size(0, 70)),
                  child: Row(children: [
                    Icon(Icons.upload, color: Colors.black),
                    SizedBox(width: 15),
                    Text(
                      'Enviar fotos',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    )
                  ]))),
          Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(minimumSize: Size(0, 70)),
                  child: Row(children: [
                    Icon(Icons.camera_alt, color: Colors.black),
                    SizedBox(width: 15),
                    Text(
                      'Tirar novas fotos',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    )
                  ]))),
        ]));
  }
}
