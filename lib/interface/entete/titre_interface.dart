import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/projet_controller.dart';
import 'package:jdr_maker/controllers/utilisateur_controller.dart';
import 'package:jdr_maker/templates/boutons/bouton.dart';

class TitreInterface extends StatelessWidget {
  final ProjetController projetController;
  final VoidCallback action;

  TitreInterface({
    required this.projetController,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    if (UtilisateurController.getUtilisateur(context) != null) {
      return renduDynamique();
    }

    return renduDefaut();
  }

  Widget renduDynamique() {
    return Bouton(
      onTap: action,
      child: SizedBox(
        width: 250,
        height: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  _getTitre(),
                  style: TextStyle(
                    color: App.couleurs().important(),
                    fontSize: App.fontSize().normal(),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Icon(
              Icons.expand_more_rounded,
              color: App.couleurs().important(),
              size: App.fontSize().titre(),
            ),
          ],
        ),
      ),
    );
  }

  Widget renduDefaut() {
    return SizedBox(
      width: 250,
      height: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                _getTitre(),
                style: TextStyle(
                  color: App.couleurs().important(),
                  fontSize: App.fontSize().chargement(),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getTitre() {
    if (projetController.projet != null) {
      return projetController.projet!.nom;
    }

    return "Dé Part";
  }
}
