import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/controllers/projet_controller.dart';
import 'package:jdr_maker/interface/app_interface.dart';
import 'package:jdr_maker/models/evenement_model.dart';
import 'package:jdr_maker/templates/boutons/bouton_icone.dart';
import 'package:jdr_maker/views/editeur/apps/evenement/widgets/evenement_liste.dart';
import 'package:jdr_maker/views/editeur/apps/evenement/widgets/evenement_liste_entete.dart';
import 'package:jdr_maker/views/editeur/apps/widgets/editeur_application_entete.dart';

class EvenementListeView extends StatefulWidget {
  @override
  State<EvenementListeView> createState() => _EvenementListeViewState();
}

class _EvenementListeViewState extends State<EvenementListeView> {
  late List<EvenementModel> evenements;

  late bool isTriAscNumero;
  late bool isTriDescNumero;
  late bool isTriAscNom;
  late bool isTriAscDate;
  late bool isTriDescNom;
  late bool isTriDescDate;

  @override
  void initState() {
    super.initState();
    evenements = ProjetController.getEvenements(context);
    trierAscendantNumero();
  }

  void trierAscendantNumero() {
    setState(() {
      isTriAscNumero = true;
      isTriDescNumero = false;
      isTriAscNom = false;
      isTriAscDate = false;
      isTriDescNom = false;
      isTriDescDate = false;
      evenements.sort((a, b) => a.numero.compareTo(b.numero));
    });
  }

  void trierAscendantNom() {
    setState(() {
      isTriAscNumero = false;
      isTriDescNumero = false;
      isTriAscNom = true;
      isTriAscDate = false;
      isTriDescNom = false;
      isTriDescDate = false;
      evenements.sort((a, b) => a.nom.compareTo(b.nom));
    });
  }

  void trierAscendantDate() {
    setState(() {
      isTriAscNumero = false;
      isTriDescNumero = false;
      isTriAscNom = false;
      isTriAscDate = true;
      isTriDescNom = false;
      isTriDescDate = false;
      evenements.sort((a, b) => b.dateModification.compareTo(a.dateModification));
    });
  }

  void trierDescendantNumero() {
    setState(() {
      isTriAscNumero = false;
      isTriDescNumero = true;
      isTriAscNom = false;
      isTriAscDate = false;
      isTriDescNom = false;
      isTriDescDate = false;
      evenements.sort((a, b) => b.numero.compareTo(a.numero));
    });
  }

  void trierDescendantNom() {
    setState(() {
      isTriAscNumero = false;
      isTriDescNumero = false;
      isTriAscNom = false;
      isTriAscDate = false;
      isTriDescNom = true;
      isTriDescDate = false;
      evenements.sort((a, b) => b.nom.compareTo(a.nom));
    });
  }

  void trierDescendantDate() {
    setState(() {
      isTriAscNumero = false;
      isTriDescNumero = false;
      isTriAscNom = false;
      isTriAscDate = false;
      isTriDescNom = false;
      isTriDescDate = true;
      evenements.sort((a, b) => a.dateModification.compareTo(b.dateModification));
    });
  }

  void versCreation() => NavigationController.changerView(context, "/editeur/evenement/ajouter");

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
                  titre: "Événements",
                  route: "/editeur",
                ),
                EvenementListeEntete(
                  triAscNumero: trierAscendantNumero,
                  triAscNom: trierAscendantNom,
                  triAscDate: trierAscendantDate,
                  triDescNumero: trierDescendantNumero,
                  triDescNom: trierDescendantNom,
                  triDescDate: trierDescendantDate,
                  isTriAscNumero: isTriAscNumero,
                  isTriAscNom: isTriAscNom,
                  isTriAscDate: isTriAscDate,
                  isTriDescNumero: isTriDescNumero,
                  isTriDescNom: isTriDescNom,
                  isTriDescDate: isTriDescDate,
                ),
                EvenementListe(evenements: evenements),
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
