import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/controllers/projet_controller.dart';
import 'package:jdr_maker/interface/app_interface.dart';
import 'package:jdr_maker/models/personnage_model.dart';
import 'package:jdr_maker/templates/boutons/bouton_icone.dart';
import 'package:jdr_maker/views/editeur/apps/personnage/widget/personnage_liste.dart';
import 'package:jdr_maker/views/editeur/apps/personnage/widget/personnage_liste_entete.dart';
import 'package:jdr_maker/views/editeur/apps/widgets/editeur_application_entete.dart';

class PersonnageListeView extends StatefulWidget {
  @override
  State<PersonnageListeView> createState() => _PersonnageListeViewState();
}

class _PersonnageListeViewState extends State<PersonnageListeView> {
  late List<PersonnageModel> personnages;

  late bool isTriAscNom;
  late bool isTriAscOccupation;
  late bool isTriAscDate;
  late bool isTriDescNom;
  late bool isTriDescOccupation;
  late bool isTriDescDate;

  @override
  void initState() {
    super.initState();
    personnages = ProjetController.getPersonnages(context);
    isTriAscNom = false;
    isTriAscOccupation = false;
    isTriAscDate = false;
    isTriDescNom = false;
    isTriDescOccupation = false;
    isTriDescDate = true;
  }

  void trierAscendantNom() {
    setState(() {
      isTriAscNom = true;
      isTriAscOccupation = false;
      isTriAscDate = false;
      isTriDescNom = false;
      isTriDescOccupation = false;
      isTriDescDate = false;
      personnages.sort((a, b) => a.nom.compareTo(b.nom));
    });
  }

  void trierAscendantOccupation() {
    setState(() {
      isTriAscNom = false;
      isTriAscOccupation = true;
      isTriAscDate = true;
      isTriDescNom = false;
      isTriDescOccupation = false;
      isTriDescDate = false;
      personnages.sort((a, b) => a.occupation.compareTo(b.occupation));
    });
  }

  void trierAscendantDate() {
    setState(() {
      isTriAscNom = false;
      isTriAscOccupation = false;
      isTriAscDate = true;
      isTriDescNom = false;
      isTriDescOccupation = false;
      isTriDescDate = false;
      personnages.sort((a, b) => a.dateModification.compareTo(b.dateModification));
    });
  }

  void trierDescendantNom() {
    setState(() {
      isTriAscNom = false;
      isTriAscOccupation = false;
      isTriAscDate = false;
      isTriDescNom = true;
      isTriDescOccupation = false;
      isTriDescDate = false;
      personnages.sort((a, b) => b.nom.compareTo(a.nom));
    });
  }

  void trierDescendantOccupation() {
    setState(() {
      isTriAscNom = false;
      isTriAscOccupation = false;
      isTriAscDate = true;
      isTriDescNom = false;
      isTriDescOccupation = true;
      isTriDescDate = false;
      personnages.sort((a, b) => b.occupation.compareTo(a.occupation));
    });
  }

  void trierDescendantDate() {
    setState(() {
      isTriAscNom = false;
      isTriAscOccupation = false;
      isTriAscDate = false;
      isTriDescNom = false;
      isTriDescOccupation = false;
      isTriDescDate = true;
      personnages.sort((a, b) => b.dateModification.compareTo(a.dateModification));
    });
  }

  void versCreation() => NavigationController.changerView(context, "/editeur/personnage/ajouter");

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
        child: Stack(
          children: [
            Column(
              children: [
                EditeurApplicationEntete(
                  titre: "Personnages",
                  route: "/editeur",
                ),
                PersonnageListeEntete(
                  triAscNom: trierAscendantNom,
                  triAscOccupation: trierAscendantOccupation,
                  triAscDate: trierAscendantDate,
                  triDescNom: trierDescendantNom,
                  triDescOccupation: trierDescendantOccupation,
                  triDescDate: trierDescendantDate,
                  isTriAscNom: isTriAscNom,
                  isTriAscOccupation: isTriAscOccupation,
                  isTriAscDate: isTriAscDate,
                  isTriDescNom: isTriDescNom,
                  isTriDescOccupation: isTriDescOccupation,
                  isTriDescDate: isTriDescDate,
                ),
                PersonnageListe(personnages: personnages),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: BoutonIcone(
                action: versCreation,
                icone: Icons.add_rounded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
