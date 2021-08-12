import 'package:aloquei_app/screens/hosting/components/host_continue_button.dart';
import 'package:aloquei_app/screens/hosting/components/host_input_text.dart';
import 'package:aloquei_app/screens/hosting/host_page_guest_number.dart';
import 'package:flutter/material.dart';

class HostPageAddress extends StatelessWidget {
  const HostPageAddress({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Confirme seu endereço',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
          ),
          leading: Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: IconButton(
              icon: Icon(Icons.arrow_back, size: 30),
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: 30),
          child: Column(
            children: [
              HostInputText(text: 'País/Região'),
              HostInputText(text: 'Rua'),
              HostInputText(text: 'Apt, suíte, etc.(Opcional)'),
              HostInputText(text: 'Cidade'),
              HostInputText(text: 'Estado'),
              HostInputText(text: 'Código postal'),
              HostContinueButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HostPageGuestNum()),
                );
              })
            ],
          ),
        ));
  }
}