import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/controllers/projet_controller.dart';
import 'package:jdr_maker/interface/app_interface.dart';
import 'package:jdr_maker/models/objet_model.dart';
import 'package:jdr_maker/templates/boutons/bouton_icone.dart';
import 'package:jdr_maker/views/editeur/apps/objet/widgets/objet_liste.dart';
import 'package:jdr_maker/views/editeur/apps/objet/widgets/objet_liste_entete.dart';
import 'package:jdr_maker/views/editeur/apps/widgets/editeur_application_entete.dart';

class ObjetListeView extends StatefulWidget {
  @override
  State<ObjetListeView> createState() => _ObjetListeViewState();
}

class _ObjetListeViewState extends State<ObjetListeView> {
  late List<ObjetModel> objets;

  late bool isTriAscNom;
  late bool isTriAscDate;
  late bool isTriDescNom;
  late bool isTriDescDate;

  @override
  void initState() {
    super.initState();
    objets = ProjetController.getObjets(context);
    trierDescendantDate();
  }

  void trierAscendantNom() {
    setState(() {
      isTriAscNom = true;
      isTriAscDate = false;
      isTriDescNom = false;
      isTriDescDate = false;
      objets.sort((a, b) => a.nom.compareTo(b.nom));
    });
  }

  void trierAscendantDate() {
    setState(() {
      isTriAscNom = false;
      isTriAscDate = true;
      isTriDescNom = false;
      isTriDescDate = false;
      objets.sort((a, b) => b.dateModification.compareTo(a.dateModification));
    });
  }

  void trierDescendantNom() {
    setState(() {
      isTriAscNom = false;
      isTriAscDate = false;
      isTriDescNom = true;
      isTriDescDate = false;
      objets.sort((a, b) => b.nom.compareTo(a.nom));
    });
  }

  void trierDescendantDate() {
    setState(() {
      isTriAscNom = false;
      isTriAscDate = false;
      isTriDescNom = false;
      isTriDescDate = true;
      objets.sort((a, b) => a.dateModification.compareTo(b.dateModification));
    });
  }

  void versCreation() => NavigationController.changerView(context, "/editeur/objet/ajouter");

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
                  titre: "Objets",
                  route: "/editeur",
                ),
                ObjetListeEntete(
                  triAscNom: trierAscendantNom,
                  triAscDate: trierAscendantDate,
                  triDescNom: trierDescendantNom,
                  triDescDate: trierDescendantDate,
                  isTriAscNom: isTriAscNom,
                  isTriAscDate: isTriAscDate,
                  isTriDescNom: isTriDescNom,
                  isTriDescDate: isTriDescDate,
                ),
                ObjetListe(objets: objets),
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
