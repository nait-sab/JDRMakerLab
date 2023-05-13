import 'package:flutter/material.dart';
import 'package:jdr_maker/controllers/projet_controller.dart';
import 'package:jdr_maker/firebase/firebase_service_firestore.dart';
import 'package:jdr_maker/models/projet_model.dart';
import 'package:jdr_maker/templates/alertes/alerte.dart';
import 'package:jdr_maker/templates/boutons/bouton_icone.dart';
import 'package:jdr_maker/templates/chargement.dart';
import 'package:jdr_maker/tools/generateur_tool.dart';

class MembreAjout extends StatefulWidget {
  @override
  State<MembreAjout> createState() => _MembreAjoutState();
}

class _MembreAjoutState extends State<MembreAjout> {
  late bool chargement;

  @override
  void initState() {
    super.initState();
    chargement = false;
  }

  Future genererCode() async {
    setState(() => chargement = true);
    ProjetModel projet = ProjetController.getProjet(context)!;
    String code = GenerateurTool.genererID().substring(0, 8);
    projet.codeMembre = code;
    projet.codeUtilisable = true;
    await FirebaseServiceFirestore.modifierDocument(ProjetModel.nomCollection, projet.id, projet.toMap());
    afficherAlerte(code);
    setState(() => chargement = false);
  }

  void afficherAlerte(String code) {
    Alerte.messageCopiable(context, "Ajouter un membre", "Nouveau code d'invitation : ", code);
  }

  @override
  Widget build(BuildContext context) {
    if (chargement) {
      return SizedBox(
        height: 50,
        width: 50,
        child: Center(child: Chargement()),
      );
    }

    return BoutonIcone(
      icone: Icons.add_rounded,
      action: genererCode,
    );
  }
}
