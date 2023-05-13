import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/controllers/projet_controller.dart';
import 'package:jdr_maker/controllers/utilisateur_controller.dart';
import 'package:jdr_maker/firebase/firebase_service_firestore.dart';
import 'package:jdr_maker/interface/app_interface.dart';
import 'package:jdr_maker/models/membre_model.dart';
import 'package:jdr_maker/models/projet_model.dart';
import 'package:jdr_maker/templates/alertes/alerte.dart';
import 'package:jdr_maker/templates/boutons/bouton_icone.dart';
import 'package:jdr_maker/templates/champs/champ_saisie.dart';
import 'package:jdr_maker/templates/chargement.dart';
import 'package:jdr_maker/tools/generateur_tool.dart';
import 'package:jdr_maker/views/projet/widgets/projet_modifier_formulaire.dart';

class ProjetRejoindreView extends StatefulWidget {
  @override
  State<ProjetRejoindreView> createState() => _ProjetRejoindreViewState();
}

class _ProjetRejoindreViewState extends State<ProjetRejoindreView> {
  late bool chargement;
  late ProjetModel? projet;
  late TextEditingController code;

  @override
  void initState() {
    super.initState();
    chargement = false;
    code = TextEditingController();
  }

  void afficherMessage(String texte) => Alerte.message(context, "Rejoindre un projet", texte);
  void alerteRejoindre() {
    Alerte.demander(
      context,
      "Rejoindre un projet",
      "Souhaitez-vous rejoindre le projet \"${projet!.nom}\"",
      () async {
        await ajouterProjet();
      },
    );
  }

  Future chercherProjet() async {
    if (code.text.isEmpty) {
      return afficherMessage("Aucun code renseigné");
    }

    setState(() => chargement = true);
    projet = null;
    bool codeValide = false;

    await FirebaseServiceFirestore.getListe(ProjetModel.nomCollection, (data) {
      ProjetModel cible = ProjetModel.fromMap(data);

      if (cible.codeMembre == code.text) {
        if (!cible.codeUtilisable) {
          setState(() => chargement = false);
          code.text = "";
          codeValide = true;
          return afficherMessage("Code expiré");
        }
        projet = cible;
      }
    });

    setState(() => chargement = false);
    code.text = "";

    if (projet != null) {
      alerteRejoindre();
    } else if (!codeValide) {
      return afficherMessage("Code invalide");
    }
  }

  Future ajouterProjet() async {
    setState(() => chargement = true);
    String id = GenerateurTool.genererID();

    MembreModel membre = MembreModel(
      id: id,
      idProjet: projet!.id,
      idMembre: UtilisateurController.getUtilisateur(context)!.id,
      evenementCreation: false,
      evenementEdition: false,
      evenementSupprimer: false,
    );

    // Détecter si l'utilisateur est le créateur
    if (projet!.idCreateur == membre.idMembre) {
      setState(() => chargement = false);
      code.text = "";
      return afficherMessage("Vous êtes déjà créateur du projet");
    }

    // Chercher les membres du projet
    List<MembreModel> listeMembres = [];
    await FirebaseServiceFirestore.getListe(MembreModel.nomCollection, (data) {
      MembreModel cible = MembreModel.fromMap(data);
      if (cible.idProjet == projet!.id) {
        listeMembres.add(cible);
      }
    });

    // Détecter si l'utilisateur est déjà membre
    for (MembreModel cible in listeMembres) {
      if (cible.idMembre == membre.idMembre) {
        setState(() => chargement = false);
        code.text = "";
        return afficherMessage("Vous êtes déjà membre du projet");
      }
    }

    // Ajouter le membre et désactiver le code
    projet!.codeUtilisable = false;
    await FirebaseServiceFirestore.ajouterDocumentID(MembreModel.nomCollection, id, membre.toMap());
    await FirebaseServiceFirestore.modifierDocument(ProjetModel.nomCollection, projet!.id, projet!.toMap());
    await _chargerProjets();
    await _chargerProjet(projet!);
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
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Création en cours...",
              style: TextStyle(
                color: App.couleurs().important(),
                fontSize: App.fontSize().sousTitre(),
              ),
            ),
            SizedBox(height: 20),
            Chargement(),
          ],
        ),
      );
    }

    return Stack(
      children: [
        Column(
          children: [
            Text(
              "Rejoindre un projet",
              style: TextStyle(
                color: App.couleurs().important(),
                fontSize: App.fontSize().sousTitre(),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Code d'invitation",
                  style: TextStyle(
                    color: App.couleurs().important(),
                    fontSize: App.fontSize().sousTitre(),
                  ),
                ),
                SizedBox(height: 5),
                ChampSaisie(
                  controller: code,
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
            )
          ],
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: BoutonIcone(
            icone: Icons.search_rounded,
            action: chercherProjet,
          ),
        ),
      ],
    );
  }
}
