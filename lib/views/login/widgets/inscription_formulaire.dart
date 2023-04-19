import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/controllers/utilisateur_controller.dart';
import 'package:jdr_maker/firebase/firebase_service_auth.dart';
import 'package:jdr_maker/firebase/firebase_service_firestore.dart';
import 'package:jdr_maker/models/utilisateur_model.dart';
import 'package:jdr_maker/templates/alertes/alerte.dart';
import 'package:jdr_maker/templates/boutons/bouton.dart';
import 'package:jdr_maker/templates/champs/champ_mail.dart';
import 'package:jdr_maker/templates/champs/champ_passe.dart';
import 'package:jdr_maker/templates/champs/champ_saisie.dart';
import 'package:jdr_maker/templates/chargement.dart';

class InscriptionFormulaire extends StatefulWidget {
  @override
  State<InscriptionFormulaire> createState() => _InscriptionFormulaireState();
}

class _InscriptionFormulaireState extends State<InscriptionFormulaire> {
  /// Controller du champ Pseudo
  late TextEditingController pseudoController;

  /// Controller du champ Mail
  late TextEditingController mailController;

  /// Controller du champ Mot de passe
  late TextEditingController passeController;

  /// Chargement lors d'une vérification
  late bool chargement;

  late String messageTitre;

  @override
  void initState() {
    super.initState();
    pseudoController = TextEditingController();
    mailController = TextEditingController();
    passeController = TextEditingController();
    chargement = false;
    messageTitre = "Création de compte";
  }

  @override
  Widget build(BuildContext context) {
    return chargement ? Chargement() : _formulaire();
  }

  Future inscription() async {
    // Vérification des champs
    String pseudo = pseudoController.text;
    String mail = mailController.text;
    String passe = passeController.text;

    if (pseudo.isEmpty) {
      return _afficherErreur("Veuillez indiqué votre pseudo");
    } else if (mail.isEmpty) {
      return _afficherErreur("Veuillez indiqué votre mail");
    } else if (!EmailValidator.validate(mail)) {
      return _afficherErreur("Mail invalide");
    } else if (passe.isEmpty) {
      return _afficherErreur("Veuillez indiqué votre mot de passe");
    } else if (passe.length < 6) {
      return _afficherErreur("Votre mot de passe doit au moins contenir 6 caractères");
    }

    // Tentative d'inscription
    setState(() => chargement = !chargement);
    bool inscriptionReussi = await FirebaseServiceAuth.creerCompte(mail, passe);
    if (!inscriptionReussi) {
      setState(() => chargement = !chargement);
      return _afficherErreur("Imposible de créer le compte, veuillez contacter le support");
    }

    // Création de l'utilisateur
    UtilisateurModel utilisateur = UtilisateurModel(
      id: FirebaseServiceAuth.getUtilisateurID(),
      username: pseudo,
      mail: mail,
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/jdrmakerlab.appspot.com/o/defaut.png?alt=media&token=44435f0a-3992-4d9f-b16f-21c50ce1b266",
      themeSombre: true,
    );

    await FirebaseServiceFirestore.ajouterDocumentID(
      UtilisateurModel.nomCollection,
      FirebaseServiceAuth.getUtilisateurID(),
      utilisateur.toMap(),
    );

    // Chargement de l'utilisateur
    _chargerUtilisateur(utilisateur);

    // Chargement de l'application
    _changerRoute("/explorer");
    setState(() => chargement = !chargement);
  }

  /// Widget contenant l'ensemble du formulaire
  Widget _formulaire() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Inscription",
              style: TextStyle(
                color: App.couleurs().important(),
                fontSize: App.fontSize().titre(),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Créer votre compte pour accéder à l'application",
              style: TextStyle(
                color: App.couleurs().texte(),
                fontSize: App.fontSize().normal(),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pseudo",
              style: TextStyle(
                color: App.couleurs().important(),
                fontSize: App.fontSize().sousTitre(),
              ),
            ),
            SizedBox(height: 5),
            ChampSaisie(
              iconeGauche: Icon(
                Icons.person_rounded,
                color: App.couleurs().texte(),
                size: App.fontSize().icone(),
              ),
              controller: pseudoController,
              couleurFond: App.couleurs().fondPrincipale(),
              couleurSaisie: App.couleurs().texte(),
              couleurPlaceholder: App.couleurs().texte(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: App.couleurs().texte(),
                  width: 3,
                ),
              ),
              focusBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: App.couleurs().violet(),
                  width: 3,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Mail",
              style: TextStyle(
                color: App.couleurs().important(),
                fontSize: App.fontSize().sousTitre(),
              ),
            ),
            SizedBox(height: 5),
            ChampMail(
              iconeGauche: Icon(
                Icons.mail_rounded,
                color: App.couleurs().texte(),
                size: App.fontSize().icone(),
              ),
              controller: mailController,
              couleurFond: App.couleurs().fondPrincipale(),
              couleurSaisie: App.couleurs().texte(),
              couleurPlaceholder: App.couleurs().texte(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: App.couleurs().texte(),
                  width: 3,
                ),
              ),
              focusBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: App.couleurs().violet(),
                  width: 3,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Mot de passe",
              style: TextStyle(
                color: App.couleurs().important(),
                fontSize: App.fontSize().sousTitre(),
              ),
            ),
            SizedBox(height: 5),
            ChampPasse(
              iconeGauche: Icon(
                Icons.lock_rounded,
                color: App.couleurs().texte(),
                size: App.fontSize().icone(),
              ),
              controller: passeController,
              couleurFond: App.couleurs().fondPrincipale(),
              couleurSaisie: App.couleurs().texte(),
              couleurPlaceholder: App.couleurs().texte(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: App.couleurs().texte(),
                  width: 3,
                ),
              ),
              focusBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: App.couleurs().violet(),
                  width: 3,
                ),
              ),
            ),
          ],
        ),
        Bouton(
          onTap: inscription,
          borderRadius: BorderRadius.circular(50),
          couleurHover: App.couleurs().important().withOpacity(0.2),
          child: Ink(
            height: 50,
            width: 150,
            decoration: BoxDecoration(
              color: App.couleurs().violet(),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(
                "Créer",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: App.fontSize().normal(),
                ),
              ),
            ),
          ),
        ),
        Bouton(
          onTap: () => _changerRoute("/connexion"),
          couleurHover: Colors.transparent,
          couleurTap: Colors.transparent,
          child: Text(
            "< Se connecter",
            style: TextStyle(
              color: App.couleurs().important(),
              fontSize: App.fontSize().chargement(),
            ),
          ),
        ),
      ],
    );
  }

  /// Afficher une erreur contenant un [message]
  void _afficherErreur(String message) => Alerte.message(context, messageTitre, message);

  void _chargerUtilisateur(UtilisateurModel utilisateur) {
    UtilisateurController.changerUtilisateur(context, utilisateur);
  }

  void _changerRoute(String route) => NavigationController.changerView(context, route);
}
