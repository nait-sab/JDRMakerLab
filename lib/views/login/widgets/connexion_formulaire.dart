import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/controllers/projet_controller.dart';
import 'package:jdr_maker/controllers/utilisateur_controller.dart';
import 'package:jdr_maker/firebase/firebase_service_auth.dart';
import 'package:jdr_maker/firebase/firebase_service_firestore.dart';
import 'package:jdr_maker/models/utilisateur_model.dart';
import 'package:jdr_maker/templates/alertes/alerte.dart';
import 'package:jdr_maker/templates/boutons/bouton.dart';
import 'package:jdr_maker/templates/champs/champ_mail.dart';
import 'package:jdr_maker/templates/champs/champ_passe.dart';
import 'package:jdr_maker/templates/chargement.dart';

class ConnexionFormulaire extends StatefulWidget {
  @override
  State<ConnexionFormulaire> createState() => _ConnexionFormulaireState();
}

class _ConnexionFormulaireState extends State<ConnexionFormulaire> {
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
    mailController = TextEditingController();
    passeController = TextEditingController();
    chargement = false;
    messageTitre = "Tentative de connexion";
  }

  @override
  Widget build(BuildContext context) {
    if (UtilisateurController.getUtilisateur(context) == null) {
      autoLog();
    }
    return chargement ? Chargement() : _formulaire();
  }

  Future connexion() async {
    // Vérification des champs
    String mail = mailController.text;
    String passe = passeController.text;

    if (mail.isEmpty) {
      return _afficherErreur("Veuillez indiqué votre mail ou pseudo");
    } else if (passe.isEmpty) {
      return _afficherErreur("Veuillez indiqué votre mot de passe");
    }

    // Tentative de connexion
    setState(() => chargement = !chargement);

    bool connexionReussi = await FirebaseServiceAuth.connexion(mail, passe);

    if (!connexionReussi) {
      setState(() => chargement = !chargement);
      return _afficherErreur("Compte invalide ou introuvable");
    }

    // Chargement de l'utilisateur
    var utilisateurData = await FirebaseServiceFirestore.getDocumentID(
      UtilisateurModel.nomCollection,
      FirebaseServiceAuth.getUtilisateurID(),
    );

    UtilisateurModel utilisateur = UtilisateurModel.fromMap(utilisateurData);
    _chargerUtilisateur(utilisateur);

    // Chargement de l'application
    await chargerProjets();
    UtilisateurController.themeSombre = utilisateur.themeSombre;
    _changerRoute("/explorer");
  }

  Future chargerProjets() async {
    await ProjetController.chargerProjets(
      context,
      UtilisateurController.getUtilisateur(context)!,
    );
  }

  void autoLog() {
    mailController.text = "test@gmail.com";
    passeController.text = "000000";
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
              "Connexion",
              style: TextStyle(
                color: App.couleurs().important(),
                fontSize: App.fontSize().titre(),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Connecter vous pour accéder à l'application",
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
          onTap: connexion,
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
                "Connexion",
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
          onTap: () => _changerRoute("/inscription"),
          couleurHover: Colors.transparent,
          couleurTap: Colors.transparent,
          child: Text(
            "Créer un compte >",
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
