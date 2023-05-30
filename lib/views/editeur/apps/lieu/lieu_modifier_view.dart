import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/lieu_controller.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/controllers/projet_controller.dart';
import 'package:jdr_maker/firebase/firebase_service_firestore.dart';
import 'package:jdr_maker/interface/app_interface.dart';
import 'package:jdr_maker/models/lieu_model.dart';
import 'package:jdr_maker/models/projet_model.dart';
import 'package:jdr_maker/templates/chargement.dart';
import 'package:jdr_maker/tools/generateur_tool.dart';
import 'package:jdr_maker/views/editeur/apps/lieu/widget/lieu_modifier_formulaire.dart';

class LieuModifierView extends StatefulWidget {
  @override
  State<LieuModifierView> createState() => _LieuModifierViewState();
}

class _LieuModifierViewState extends State<LieuModifierView> {
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
    LieuModel lieu = LieuController.getLieu(context)!;
    lieu.nom = nom;
    lieu.description = description;
    lieu.dateModification = date;
    projet.derniereModification = date;

    await FirebaseServiceFirestore.modifierDocument(
      LieuModel.nomCollection,
      lieu.id,
      lieu.toMap(),
    );

    await FirebaseServiceFirestore.modifierDocument(
      ProjetModel.nomCollection,
      projet.id,
      projet.toMap(),
    );

    await actualiser();
    rafraichir();
    changerRoute("/editeur/lieu/vue");
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

    return LieuModifierFormulaire(
      lieu: LieuController.getLieu(context)!,
      modifier: modifier,
    );
  }
}
