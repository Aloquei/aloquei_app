import 'package:flutter/material.dart';

class CircleShareButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Center(
          child: Ink(
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: const Icon(Icons.share),
              color: Colors.black,
              onPressed: () {},
            ),
          ),
        ));
  }
}
