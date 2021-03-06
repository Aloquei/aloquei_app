import 'package:flutter/material.dart';

class PersonalInfoAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final Function onTap;

  PersonalInfoAppBar({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.all(15.0),
          child: InkWell(
            onTap: onTap,
            child: Text(
              "Salvar",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
