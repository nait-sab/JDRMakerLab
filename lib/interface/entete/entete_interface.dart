import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/projet_controller.dart';
import 'package:jdr_maker/controllers/utilisateur_controller.dart';
import 'package:jdr_maker/interface/entete/profil_interface.dart';
import 'package:jdr_maker/interface/entete/recherche_interface.dart';
import 'package:jdr_maker/interface/entete/titre_interface.dart';
import 'package:jdr_maker/models/utilisateur_model.dart';
import 'package:jdr_maker/templates/boutons/boutons_desktop.dart';

class EnteteInterface extends StatefulWidget {
  final ProjetController projetController;
  final VoidCallback actionTitre;

  EnteteInterface({
    required this.projetController,
    required this.actionTitre,
  });

  @override
  State<EnteteInterface> createState() => _EnteteInterfaceState();
}

class _EnteteInterfaceState extends State<EnteteInterface> {
  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid ? renduAndroid() : renduDesktop();
  }

  Widget renduDesktop() {
    return Container(
      height: 75,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 3, color: App.couleurs().fondSecondaire()),
        ),
      ),
      child: MoveWindow(
        child: Row(
          children: [
            TitreInterface(
              projetController: widget.projetController,
              action: widget.actionTitre,
            ),
            Expanded(
              child: Row(
                children: _getEntete(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Afficher ou non le contenu de l'entête si l'utilisateur est connecté
  List<Widget> _getEntete() {
    List<Widget> liste = [];

    UtilisateurModel? utilisateur = UtilisateurController.getUtilisateur(context);

    if (utilisateur != null) {
      liste.add(RechercheInterface());
      liste.add(Spacer());
      liste.add(ProfilInterface(utilisateur: utilisateur));
    }

    if (liste.isEmpty) {
      liste.add(Spacer());
    }

    if (Platform.isWindows) {
      liste.add(BoutonsWindows());
    }

    return liste;
  }

  Widget renduAndroid() {
    return Container(
      height: 75,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 3, color: App.couleurs().fondSecondaire()),
        ),
      ),
      child: Row(
        children: [
          TitreInterface(
            projetController: widget.projetController,
            action: widget.actionTitre,
          ),
          Expanded(
            child: Row(
              children: _getEntete(),
            ),
          ),
        ],
      ),
    );
  }
}
