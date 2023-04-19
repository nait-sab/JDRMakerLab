import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/templates/boutons/bouton_icone.dart';

class MembresInterface extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: double.infinity,
      color: App.couleurs().fondSecondaire(),
      child: SingleChildScrollView(
        child: Column(
          children: _getListe(),
        ),
      ),
    );
  }

  List<Widget> _getListe() {
    List<Widget> liste = [];
    liste.add(SizedBox(height: 5));
    liste.add(BoutonIcone(
      icone: Icons.add_rounded,
      action: () {},
    ));
    return liste;
  }
}
