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

  @override
  void initState() {
    super.initState();
    lieux = ProjetController.getLieux(context);
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
                LieuListeEntete(),
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
