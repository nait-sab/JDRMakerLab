import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/controllers/personnage_controller.dart';
import 'package:jdr_maker/controllers/projet_controller.dart';
import 'package:jdr_maker/firebase/firebase_service_firestore.dart';
import 'package:jdr_maker/interface/app_interface.dart';
import 'package:jdr_maker/models/personnage_model.dart';
import 'package:jdr_maker/models/projet_model.dart';
import 'package:jdr_maker/templates/chargement.dart';
import 'package:jdr_maker/tools/generateur_tool.dart';
import 'package:jdr_maker/views/editeur/apps/personnage/widget/personnage_modifier_formulaire.dart';

class PersonnageModifierView extends StatefulWidget {
  @override
  State<PersonnageModifierView> createState() => _PersonnageModifierViewState();
}

class _PersonnageModifierViewState extends State<PersonnageModifierView> {
  late bool chargement;

  @override
  void initState() {
    super.initState();
    chargement = false;
  }

  Future modifier(
    String nom,
    String occupation,
    String age,
    String taille,
    String poids,
    String description,
    String histoire,
    String urlIcone,
    String urlImage,
  ) async {
    rafraichir();
    String date = GenerateurTool.genererDateActuelle();
    ProjetModel projet = ProjetController.getProjet(context)!;
    PersonnageModel personnage = PersonnageController.getPersonnage(context)!;
    personnage.nom = nom;
    personnage.occupation = occupation;
    personnage.age = age;
    personnage.taille = taille;
    personnage.poids = poids;
    personnage.description = description;
    personnage.histoire = histoire;
    personnage.urlIcone = urlIcone;
    personnage.urlImage = urlImage;
    personnage.dateModification = date;
    projet.derniereModification = date;

    await FirebaseServiceFirestore.modifierDocument(
      PersonnageModel.nomCollection,
      personnage.id,
      personnage.toMap(),
    );

    await FirebaseServiceFirestore.modifierDocument(
      ProjetModel.nomCollection,
      projet.id,
      projet.toMap(),
    );

    await actualiser();
    rafraichir();
    changerRoute("/editeur/personnage/vue");
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

    return PersonnageModifierFormulaire(
      personnage: PersonnageController.getPersonnage(context)!,
      modifier: modifier,
    );
  }
}
