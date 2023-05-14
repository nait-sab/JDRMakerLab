import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/controllers/utilisateur_controller.dart';
import 'package:jdr_maker/firebase/firebase_service_auth.dart';
import 'package:jdr_maker/firebase/firebase_service_firestore.dart';
import 'package:jdr_maker/interface/app_interface.dart';
import 'package:jdr_maker/models/utilisateur_model.dart';
import 'package:jdr_maker/templates/alertes/alerte.dart';
import 'package:jdr_maker/templates/chargement.dart';
import 'package:jdr_maker/views/profil/widgets/profil_modifier_formulaire.dart';

class ProfilModifierView extends StatefulWidget {
  @override
  State<ProfilModifierView> createState() => _ProfilModifierViewState();
}

class _ProfilModifierViewState extends State<ProfilModifierView> {
  late UtilisateurModel utilisateur;
  late bool chargement;

  @override
  void initState() {
    super.initState();
    utilisateur = UtilisateurController.getUtilisateur(context)!;
    chargement = false;
  }

  void afficherAlerte(String texte) => Alerte.message(context, "Modifier mon profil", texte);

  Future modifierProfil(String pseudo, String mail, String passe) async {
    if (pseudo.isEmpty) {
      return afficherAlerte("Aucun pseudo renseigné");
    }

    if (mail.isEmpty) {
      return afficherAlerte("Aucun mail renseigné");
    }

    if (passe.isEmpty) {
      return afficherAlerte("Aucun mot de passe renseigné");
    }

    if (passe.length < 6) {
      return afficherAlerte("Votre mot de passe doit contenir au moins 6 caractères");
    }

    setState(() => chargement = true);
    utilisateur.pseudo = pseudo;
    utilisateur.mail = mail;

    await FirebaseServiceAuth.modifierUtilisateur(pseudo, mail, passe);

    await FirebaseServiceFirestore.modifierDocument(
      UtilisateurModel.nomCollection,
      utilisateur.id,
      utilisateur.toMap(),
    );

    rafraichir(utilisateur);
  }

  void rafraichir(UtilisateurModel utilisateur) {
    UtilisateurController.changerUtilisateur(context, utilisateur);
    setState(() => chargement = false);
    NavigationController.changerView(context, "/profil/compte");
  }

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

    return ProfilModifierFormulaire(
      modifier: modifierProfil,
      utilisateur: utilisateur,
    );
  }
}
