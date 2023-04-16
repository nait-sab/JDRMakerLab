import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';

class MenuTitre extends StatelessWidget {
  final String texte;

  MenuTitre({
    required this.texte,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Container(
        width: double.infinity,
        height: 30,
        padding: EdgeInsets.only(left: 20),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            texte,
            style: TextStyle(
              color: Colors.white,
              fontSize: App.fontSize().normal(),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
