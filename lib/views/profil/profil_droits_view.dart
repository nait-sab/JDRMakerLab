import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/membre_controller.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/firebase/firebase_service_firestore.dart';
import 'package:jdr_maker/interface/app_interface.dart';
import 'package:jdr_maker/models/membre_model.dart';
import 'package:jdr_maker/models/utilisateur_model.dart';
import 'package:jdr_maker/templates/chargement.dart';
import 'package:jdr_maker/views/profil/widgets/profil_droits_formulaire.dart';

class ProfilDroitsView extends StatefulWidget {
  @override
  State<ProfilDroitsView> createState() => _ProfilDroitsViewState();
}

class _ProfilDroitsViewState extends State<ProfilDroitsView> {
  late MembreModel membreModel;
  late UtilisateurModel membre;
  late bool chargement;

  @override
  void initState() {
    super.initState();
    membreModel = MembreController.getMembreModel(context)!;
    membre = MembreController.getMembre(context)!;
    chargement = false;
  }

  Future modifierDroits(
    bool evenementCreation,
    bool evenementModifier,
    bool evenementSupprimer,
  ) async {
    rafraichir();
    membreModel.evenementCreation = evenementCreation;
    membreModel.evenementEdition = evenementModifier;
    membreModel.evenementSupprimer = evenementSupprimer;

    await FirebaseServiceFirestore.modifierDocument(
      MembreModel.nomCollection,
      membreModel.id,
      membreModel.toMap(),
    );

    rafraichir();
    changerRoute("/explorer");
  }

  void rafraichir() => setState(() => chargement = !chargement);
  void changerRoute(String route) => NavigationController.changerView(context, route);

  @override
  Widget build(BuildContext context) {
    return AppInterface(
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: App.couleurs().fondSecondaire(),
        ),
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        child: contenu(),
      ),
    );
  }

  Widget contenu() {
    if (chargement) {
      return Center(child: Chargement());
    }

    return ProfilDroitsFormulaire(
      modifier: modifierDroits,
      membreModel: membreModel,
      membre: membre,
    );
  }
}
