import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/controllers/personnage_controller.dart';
import 'package:jdr_maker/controllers/projet_controller.dart';
import 'package:jdr_maker/firebase/firebase_service_firestore.dart';
import 'package:jdr_maker/interface/app_interface.dart';
import 'package:jdr_maker/models/personnage_model.dart';
import 'package:jdr_maker/templates/alertes/alerte.dart';
import 'package:jdr_maker/templates/boutons/bouton_icone.dart';
import 'package:jdr_maker/templates/chargement.dart';
import 'package:jdr_maker/views/editeur/apps/personnage/widget/personnage_vue_contenu.dart';
import 'package:jdr_maker/views/editeur/apps/widgets/editeur_application_entete.dart';

class PersonnageVueView extends StatefulWidget {
  @override
  State<PersonnageVueView> createState() => _PersonnageVueViewState();
}

class _PersonnageVueViewState extends State<PersonnageVueView> {
  late PersonnageModel personnage;
  late bool chargement;

  @override
  void initState() {
    super.initState();
    personnage = PersonnageController.getPersonnage(context)!;
    chargement = false;
  }

  Future supprimer() async {
    Alerte.demander(
      context,
      "Supprimer un personnage",
      "Souhaitez-vous vraiment supprimer le personnage \"${personnage.nom}\" ?",
      () async {
        rafraichir();
        await FirebaseServiceFirestore.supprimerDocument(PersonnageModel.nomCollection, personnage.id);
        await actualiser();
        rafraichir();
        changerRoute("/editeur/personnage/liste");
      },
    );
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

    return Stack(
      children: [
        Column(
          children: [
            EditeurApplicationEntete(
              titre: "Personnage : ${personnage.nom}",
              route: "/editeur/personnage/liste",
            ),
            SizedBox(height: 20),
            Expanded(child: PersonnageVueContenu(personnage: personnage)),
          ],
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: BoutonIcone(
            action: supprimer,
            icone: Icons.delete_rounded,
            couleur: App.couleurs().rouge(),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: BoutonIcone(
            action: () => changerRoute("/editeur/personnage/modifier"),
            icone: Icons.edit_rounded,
          ),
        ),
      ],
    );
  }
}
