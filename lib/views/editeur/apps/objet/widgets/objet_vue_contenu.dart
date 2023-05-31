import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/models/objet_model.dart';

class ObjetVueContenu extends StatelessWidget {
  final ObjetModel objet;

  ObjetVueContenu({
    required this.objet,
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
              objet.nom,
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
    if (objet.description.isEmpty) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          "Description",
          style: TextStyle(
            color: App.couleurs().important(),
            fontSize: App.fontSize().normal(),
          ),
        ),
        SizedBox(height: 5),
        Text(
          objet.description,
          style: TextStyle(
            color: App.couleurs().texte(),
            fontSize: App.fontSize().normal(),
          ),
        ),
      ],
    );
  }
}