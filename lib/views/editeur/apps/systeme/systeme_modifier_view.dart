import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/controllers/projet_controller.dart';
import 'package:jdr_maker/controllers/systeme_controller.dart';
import 'package:jdr_maker/firebase/firebase_service_firestore.dart';
import 'package:jdr_maker/interface/app_interface.dart';
import 'package:jdr_maker/models/projet_model.dart';
import 'package:jdr_maker/models/systeme_model.dart';
import 'package:jdr_maker/templates/chargement.dart';
import 'package:jdr_maker/tools/generateur_tool.dart';
import 'package:jdr_maker/views/editeur/apps/systeme/widget/systeme_modifier_formulaire.dart';

class SystemeModifierView extends StatefulWidget {
  @override
  State<SystemeModifierView> createState() => _SystemeModifierViewState();
}

class _SystemeModifierViewState extends State<SystemeModifierView> {
  late bool chargement;

  @override
  void initState() {
    super.initState();
    chargement = false;
  }

  Future modifier(String nom, String description) async {
    rafraichir();
    String date = GenerateurTool.genererDateActuelle();
    ProjetModel projet = ProjetController.getProjet(context)!;
    SystemeModel systeme = SystemeController.getSysteme(context)!;
    systeme.nom = nom;
    systeme.contenu = description;
    systeme.dateModification = date;
    projet.derniereModification = date;

    await FirebaseServiceFirestore.modifierDocument(
      SystemeModel.nomCollection,
      systeme.id,
      systeme.toMap(),
    );

    await FirebaseServiceFirestore.modifierDocument(
      ProjetModel.nomCollection,
      projet.id,
      projet.toMap(),
    );

    await actualiser();
    rafraichir();
    changerRoute("/editeur/systeme/vue");
  }

  Future actualiser() async => await ProjetController.actualiser(context);
  void changerRoute(String route) => NavigationController.changerView(context, route);
  void rafraichir() => setState(() => chargement = !chargement);

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

    return SystemeModifierFormulaire(
      systeme: SystemeController.getSysteme(context)!,
      modifier: modifier,
    );
  }
}
