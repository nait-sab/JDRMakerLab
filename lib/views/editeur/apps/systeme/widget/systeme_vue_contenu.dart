import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/models/systeme_model.dart';

class SystemeVueContenu extends StatelessWidget {
  final SystemeModel systeme;

  SystemeVueContenu({
    required this.systeme,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nom",
              style: TextStyle(
                color: App.couleurs().important(),
                fontSize: App.fontSize().normal(),
              ),
            ),
            SizedBox(height: 5),
            Text(
              systeme.nom,
              style: TextStyle(
                color: App.couleurs().texte(),
                fontSize: App.fontSize().normal(),
              ),
            ),
            blocDescription(),
          ],
        ),
      ),
    );
  }

  Widget blocDescription() {
    if (systeme.contenu.isEmpty) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          "Contenu",
          style: TextStyle(
            color: App.couleurs().important(),
            fontSize: App.fontSize().normal(),
          ),
        ),
        SizedBox(height: 5),
        Text(
          systeme.contenu,
          style: TextStyle(
            color: App.couleurs().texte(),
            fontSize: App.fontSize().normal(),
          ),
        ),
      ],
    );
  }
}
