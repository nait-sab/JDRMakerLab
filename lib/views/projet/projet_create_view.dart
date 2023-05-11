import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/controllers/projet_controller.dart';
import 'package:jdr_maker/controllers/utilisateur_controller.dart';
import 'package:jdr_maker/firebase/firebase_service_firestore.dart';
import 'package:jdr_maker/interface/app_interface.dart';
import 'package:jdr_maker/models/projet_model.dart';
import 'package:jdr_maker/templates/chargement.dart';
import 'package:jdr_maker/tools/generateur_tool.dart';
import 'package:jdr_maker/views/projet/widgets/projet_create_formulaire.dart';

class ProjetCreateView extends StatefulWidget {
  @override
  State<ProjetCreateView> createState() => _ProjetCreateViewState();
}

class _ProjetCreateViewState extends State<ProjetCreateView> {
  late bool chargement;

  @override
  void initState() {
    super.initState();
    chargement = false;
  }

  void rafraichir() => setState(() => chargement = !chargement);

  Future creer(String nom, bool projetPublic) async {
    if (nom.isEmpty) {
      return;
    }

    String idProjet = GenerateurTool.genererID();
    String date = GenerateurTool.genererDateActuelle();
    rafraichir();

    ProjetModel projet = ProjetModel(
      id: idProjet,
      idCreateur: UtilisateurController.getUtilisateur(context)!.id,
      nom: nom,
      isPublic: projetPublic,
      codeMembre: "",
      codeUtilisable: false,
      derniereModification: date,
      dateCreation: date,
    );

    await FirebaseServiceFirestore.ajouterDocumentID(ProjetModel.nomCollection, idProjet, projet.toMap());
    await _chargerProjets();
    await _chargerProjet(projet);
    rafraichir();
    changerRoute("/explorer");
  }

  Future _chargerProjets() async {
    await ProjetController.chargerProjets(context, UtilisateurController.getUtilisateur(context)!);
  }

  Future _chargerProjet(ProjetModel projet) async => await ProjetController.charger(context, projet);

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

    return ProjetCreateFormulaire(
      creer: creer,
    );
  }
}
