import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';

class MembreBouton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: App.couleurs().important(),
      ),
    );
  }
}
