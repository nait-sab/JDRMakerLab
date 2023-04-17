import 'dart:io';

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
    if (Platform.isAndroid) {
      return renduAndroid();
    }

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
                    color: Colors.white,
                    fontSize: App.fontSize().normal(),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Icon(
              Icons.expand_more_rounded,
              color: Colors.white,
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
                  color: Colors.white,
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

  Widget renduAndroid() {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: App.couleurs().fondSecondaire(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: Bouton(
          onTap: () {},
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      _getTitre(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: App.fontSize().normal(),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Icon(
                  Icons.expand_more_rounded,
                  color: Colors.white,
                  size: App.fontSize().titre(),
                ),
              ],
            ),
          ),
        ),
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
