import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/controllers/utilisateur_controller.dart';
import 'package:jdr_maker/firebase/firebase_service_firestore.dart';
import 'package:jdr_maker/models/utilisateur_model.dart';
import 'package:jdr_maker/views/profil/widgets/profil_parametre_bouton.dart';
import 'package:jdr_maker/views/profil/widgets/profil_parametre_categorie.dart';

class ProfilParametres extends StatefulWidget {
  final String onglet;

  ProfilParametres({
    required this.onglet,
  });

  @override
  State<ProfilParametres> createState() => _ProfilParametresState();
}

class _ProfilParametresState extends State<ProfilParametres> {
  void changerRoute(String route) => NavigationController.changerView(context, route);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfilParametreCategorie(
                  nom: "Compte",
                  actif: widget.onglet == "compte",
                  route: "/profil/compte",
                ),
                ProfilParametreCategorie(
                  nom: "Feuilles Personnage",
                  actif: widget.onglet == "feuilles",
                  route: "/profil/feuilles",
                ),
                ProfilParametreCategorie(
                  nom: "Paramètres",
                  actif: widget.onglet == "parametres",
                  route: "/profil/parametres",
                ),
              ],
            ),
          ),
          Container(
            width: 5,
            height: 250,
            decoration: BoxDecoration(
              color: App.couleurs().texte(),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          Expanded(
            child: afficherOnglet(),
          ),
        ],
      ),
    );
  }

  Widget afficherOnglet() {
    List<Widget> onglet = [];

    switch (widget.onglet) {
      case "compte":
        onglet = ongletCompte();
        break;
      case "feuilles":
        onglet = ongletFeuilles();
        break;
      case "parametres":
        onglet = ongletParametres();
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: onglet,
    );
  }

  List<Widget> ongletCompte() {
    List<Widget> liste = [
      ProfilParametreBouton(
        nom: "Modifier mon profil",
        action: () => changerRoute("/profil/modifier"),
      ),
    ];

    return liste;
  }

  List<Widget> ongletFeuilles() {
    List<Widget> liste = [
      ProfilParametreBouton(
        nom: "Créer une nouvelle feuille",
        action: () {},
      ),
    ];
    return liste;
  }

  List<Widget> ongletParametres() {
    List<Widget> liste = [
      ProfilParametreBouton(
        nom: "Changer de thème",
        action: changerTheme,
      ),
    ];
    return liste;
  }

  Future changerTheme() async {
    UtilisateurModel utilisateur = UtilisateurController.getUtilisateur(context)!;
    utilisateur.themeSombre = !utilisateur.themeSombre;

    await FirebaseServiceFirestore.modifierDocument(
      UtilisateurModel.nomCollection,
      utilisateur.id,
      utilisateur.toMap(),
    );

    UtilisateurController.themeSombre = utilisateur.themeSombre;
    changerRoute("/profil/parametres");
  }
}
