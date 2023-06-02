import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/controllers/projet_controller.dart';
import 'package:jdr_maker/interface/app_interface.dart';
import 'package:jdr_maker/models/systeme_model.dart';
import 'package:jdr_maker/templates/boutons/bouton_icone.dart';
import 'package:jdr_maker/views/editeur/apps/systeme/widget/systeme_liste.dart';
import 'package:jdr_maker/views/editeur/apps/systeme/widget/systeme_liste_entete.dart';
import 'package:jdr_maker/views/editeur/apps/widgets/editeur_application_entete.dart';

class SystemeListeView extends StatefulWidget {
  @override
  State<SystemeListeView> createState() => _SystemeListeViewState();
}

class _SystemeListeViewState extends State<SystemeListeView> {
  late List<SystemeModel> systemes;

  late bool isTriAscNom;
  late bool isTriAscDate;
  late bool isTriDescNom;
  late bool isTriDescDate;

  @override
  void initState() {
    super.initState();
    systemes = ProjetController.getSystemes(context);
    trierDescendantDate();
  }

  void trierAscendantNom() {
    setState(() {
      isTriAscNom = true;
      isTriAscDate = false;
      isTriDescNom = false;
      isTriDescDate = false;
      systemes.sort((a, b) => a.nom.compareTo(b.nom));
    });
  }

  void trierAscendantDate() {
    setState(() {
      isTriAscNom = false;
      isTriAscDate = true;
      isTriDescNom = false;
      isTriDescDate = false;
      systemes.sort((a, b) => a.dateModification.compareTo(b.dateModification));
    });
  }

  void trierDescendantNom() {
    setState(() {
      isTriAscNom = false;
      isTriAscDate = false;
      isTriDescNom = true;
      isTriDescDate = false;
      systemes.sort((a, b) => b.nom.compareTo(a.nom));
    });
  }

  void trierDescendantDate() {
    setState(() {
      isTriAscNom = false;
      isTriAscDate = false;
      isTriDescNom = false;
      isTriDescDate = true;
      systemes.sort((a, b) => b.dateModification.compareTo(a.dateModification));
    });
  }

  void versCreation() => NavigationController.changerView(context, "/editeur/systeme/ajouter");

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
                  titre: "Systèmes",
                  route: "/editeur",
                ),
                SystemeListeEntete(
                  triAscNom: trierAscendantNom,
                  triAscDate: trierAscendantDate,
                  triDescNom: trierDescendantNom,
                  triDescDate: trierDescendantDate,
                  isTriAscNom: isTriAscNom,
                  isTriAscDate: isTriAscDate,
                  isTriDescNom: isTriDescNom,
                  isTriDescDate: isTriDescDate,
                ),
                SystemeListe(systemes: systemes),
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
