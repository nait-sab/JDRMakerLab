import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/controllers/projet_controller.dart';
import 'package:jdr_maker/controllers/utilisateur_controller.dart';
import 'package:jdr_maker/firebase/firebase_service_firestore.dart';
import 'package:jdr_maker/interface/app_interface.dart';
import 'package:jdr_maker/models/lieu_model.dart';
import 'package:jdr_maker/models/projet_model.dart';
import 'package:jdr_maker/templates/chargement.dart';
import 'package:jdr_maker/tools/generateur_tool.dart';
import 'package:jdr_maker/views/editeur/apps/lieu/widget/lieu_ajouter_formulaire.dart';

class LieuAjouterView extends StatefulWidget {
  @override
  State<LieuAjouterView> createState() => _LieuAjouterViewState();
}

class _LieuAjouterViewState extends State<LieuAjouterView> {
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

    LieuModel lieu = LieuModel(
      id: id,
      idCreateur: UtilisateurController.getUtilisateur(context)!.id,
      idProjet: projet.id,
      urlImage: urlImage,
      nom: nom,
      description: description,
      dateModification: date,
    );

    projet.derniereModification = date;
    await FirebaseServiceFirestore.ajouterDocumentID(LieuModel.nomCollection, id, lieu.toMap());
    await FirebaseServiceFirestore.modifierDocument(
      ProjetModel.nomCollection,
      projet.id,
      projet.toMap(),
    );
    await actualiser();
    rafraichir();
    changerRoute("/editeur/lieu/liste");
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

    return LieuAjouterFormulaire(creer: creer);
  }
}
