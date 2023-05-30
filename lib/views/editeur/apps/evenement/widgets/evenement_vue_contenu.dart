import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/models/evenement_model.dart';

class EvenementVueContenu extends StatelessWidget {
  final EvenementModel evenement;

  EvenementVueContenu({
    required this.evenement,
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
              "Numéro ° ${evenement.numero}",
              style: TextStyle(
                color: App.couleurs().important(),
                fontSize: App.fontSize().normal(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Nom",
              style: TextStyle(
                color: App.couleurs().important(),
                fontSize: App.fontSize().normal(),
              ),
            ),
            SizedBox(height: 5),
            Text(
              evenement.nom,
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
    if (evenement.description.isEmpty) {
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
          evenement.description,
          style: TextStyle(
            color: App.couleurs().texte(),
            fontSize: App.fontSize().normal(),
          ),
        ),
      ],
    );
  }
}
