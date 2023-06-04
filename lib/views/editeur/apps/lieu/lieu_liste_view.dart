import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/controllers/projet_controller.dart';
import 'package:jdr_maker/interface/app_interface.dart';
import 'package:jdr_maker/models/lieu_model.dart';
import 'package:jdr_maker/templates/boutons/bouton_icone.dart';
import 'package:jdr_maker/views/editeur/apps/lieu/widget/lieu_liste.dart';
import 'package:jdr_maker/views/editeur/apps/lieu/widget/lieu_liste_entete.dart';
import 'package:jdr_maker/views/editeur/apps/widgets/editeur_application_entete.dart';

class LieuListeView extends StatefulWidget {
  @override
  State<LieuListeView> createState() => _LieuListeViewState();
}

class _LieuListeViewState extends State<LieuListeView> {
  late List<LieuModel> lieux;

  late bool isTriAscNom;
  late bool isTriAscDate;
  late bool isTriDescNom;
  late bool isTriDescDate;

  @override
  void initState() {
    super.initState();
    lieux = ProjetController.getLieux(context);
    trierDescendantDate();
  }

  void trierAscendantNom() {
    setState(() {
      isTriAscNom = true;
      isTriAscDate = false;
      isTriDescNom = false;
      isTriDescDate = false;
      lieux.sort((a, b) => a.nom.compareTo(b.nom));
    });
  }

  void trierAscendantDate() {
    setState(() {
      isTriAscNom = false;
      isTriAscDate = true;
      isTriDescNom = false;
      isTriDescDate = false;
      lieux.sort((a, b) => b.dateModification.compareTo(a.dateModification));
    });
  }

  void trierDescendantNom() {
    setState(() {
      isTriAscNom = false;
      isTriAscDate = false;
      isTriDescNom = true;
      isTriDescDate = false;
      lieux.sort((a, b) => b.nom.compareTo(a.nom));
    });
  }

  void trierDescendantDate() {
    setState(() {
      isTriAscNom = false;
      isTriAscDate = false;
      isTriDescNom = false;
      isTriDescDate = true;
      lieux.sort((a, b) => a.dateModification.compareTo(b.dateModification));
    });
  }

  void versCreation() => NavigationController.changerView(context, "/editeur/lieu/ajouter");

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
                  titre: "Lieux",
                  route: "/editeur",
                ),
                LieuListeEntete(
                  triAscNom: trierAscendantNom,
                  triAscDate: trierAscendantDate,
                  triDescNom: trierDescendantNom,
                  triDescDate: trierDescendantDate,
                  isTriAscNom: isTriAscNom,
                  isTriAscDate: isTriAscDate,
                  isTriDescNom: isTriDescNom,
                  isTriDescDate: isTriDescDate,
                ),
                LieuListe(lieux: lieux),
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
