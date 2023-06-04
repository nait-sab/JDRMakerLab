import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/controllers/projet_controller.dart';
import 'package:jdr_maker/controllers/utilisateur_controller.dart';
import 'package:jdr_maker/firebase/firebase_service_firestore.dart';
import 'package:jdr_maker/interface/app_interface.dart';
import 'package:jdr_maker/models/objet_model.dart';
import 'package:jdr_maker/models/projet_model.dart';
import 'package:jdr_maker/templates/chargement.dart';
import 'package:jdr_maker/tools/generateur_tool.dart';
import 'package:jdr_maker/views/editeur/apps/objet/widgets/objet_ajouter_formulaire.dart';

class ObjetAjouterView extends StatefulWidget {
  @override
  State<ObjetAjouterView> createState() => _ObjetAjouterViewState();
}

class _ObjetAjouterViewState extends State<ObjetAjouterView> {
  late bool chargement;

  @override
  void initState() {
    super.initState();
    chargement = false;
  }

  Future creer(String nom, String description, String urlImage) async {
    rafraichir();
    String id = GenerateurTool.genererID();
    String date = GenerateurTool.genererDateActuelle();
    ProjetModel projet = ProjetController.getProjet(context)!;

    ObjetModel objet = ObjetModel(
      id: id,
      idCreateur: UtilisateurController.getUtilisateur(context)!.id,
      idProjet: projet.id,
      urlImage: urlImage,
      nom: nom,
      description: description,
      dateModification: date,
    );

    projet.derniereModification = date;
    await FirebaseServiceFirestore.ajouterDocumentID(ObjetModel.nomCollection, id, objet.toMap());
    await FirebaseServiceFirestore.modifierDocument(
      ProjetModel.nomCollection,
      projet.id,
      projet.toMap(),
    );
    await actualiser();
    rafraichir();
    changerRoute("/editeur/objet/liste");
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

    return ObjetAjouterFormulaire(creer: creer);
  }
}
