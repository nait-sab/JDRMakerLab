import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/projet_controller.dart';
import 'package:jdr_maker/controllers/utilisateur_controller.dart';
import 'package:jdr_maker/interface/entete/entete_interface.dart';
import 'package:jdr_maker/interface/entete/titre_interface.dart';
import 'package:jdr_maker/interface/membres/membres_interface.dart';
import 'package:jdr_maker/interface/menu/menu_interface.dart';
import 'package:jdr_maker/interface/selection_interface.dart';
import 'package:jdr_maker/models/projet_model.dart';
import 'package:provider/provider.dart';

/// Classe : Interface
///
/// Interface principale de l'app
class AppInterface extends StatefulWidget {
  final Widget child;

  AppInterface({
    required this.child,
  });

  @override
  State<AppInterface> createState() => _AppInterfaceState();
}

class _AppInterfaceState extends State<AppInterface> {
  // Controllers
  late ProjetController projetController;
  late UtilisateurController utilisateurController;

  /// Afficher ou non la sélection de projets
  late bool selectionVisible;

  // Chargement de l'interface
  late bool chargement;

  @override
  void initState() {
    super.initState();
    chargement = false;
    selectionVisible = false;
  }

  Future chargerProjet(ProjetModel projet) async {
    //RechercheController.changerRecherche(context, "");
    if (projetController.projet != projet) {
      switchChargement();
      changerSelection();
      await ProjetController.charger(context, projet);
      switchChargement();
    } else {
      changerSelection();
    }
  }

  void switchChargement() => setState(() => chargement = !chargement);
  void changerSelection() => setState(() => selectionVisible = !selectionVisible);
  // void retourAccueil() => setState(() => NavigationController.changerView(context, "/accueil"));

  @override
  Widget build(BuildContext context) {
    projetController = Provider.of<ProjetController>(context);
    utilisateurController = Provider.of<UtilisateurController>(context);

    return Scaffold(
      backgroundColor: App.couleurs().fondPrincipale(),
      body: Platform.isAndroid ? renduAndroid() : renduDesktop(),
    );
  }

  Widget renduDesktop() {
    return Column(
      children: [
        EnteteInterface(projetController: projetController, actionTitre: changerSelection),
        Expanded(
          child: Stack(
            children: [
              Row(
                children: [
                  _getMenuDesktop(),
                  Expanded(child: widget.child),
                  _getMembres(),
                ],
              ),
              _selection(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _getMenuDesktop() {
    if (UtilisateurController.getUtilisateur(context) != null) {
      return MenuInterface();
    }

    return Container();
  }

  Widget _getMembres() {
    if (ProjetController.getProjet(context) != null) {
      return MembresInterface();
    }

    return Container();
  }

  Widget _selection() {
    if (!selectionVisible) {
      return Container();
    }

    return SelectionInterface(
      projets: projetController.projets,
      action: chargerProjet,
    );
  }

  Widget renduAndroid() {
    return SafeArea(
      child: Column(
        children: [
          EnteteInterface(projetController: projetController, actionTitre: changerSelection),
          TitreInterface(projetController: projetController, action: changerSelection),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: widget.child,
            ),
          ),
          MenuInterface(),
        ],
      ),
    );
  }
}
