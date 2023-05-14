import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/controllers/projet_controller.dart';
import 'package:jdr_maker/interface/app_interface.dart';
import 'package:jdr_maker/templates/alertes/alerte.dart';
import 'package:jdr_maker/templates/boutons/bouton_icone.dart';
import 'package:jdr_maker/templates/chargement.dart';
import 'package:jdr_maker/views/editeur/widgets/editeur_application.dart';
import 'package:jdr_maker/views/editeur/widgets/editeur_info.dart';
import 'package:provider/provider.dart';

class EditeurView extends StatefulWidget {
  @override
  State<EditeurView> createState() => _EditeurViewState();
}

class _EditeurViewState extends State<EditeurView> {
  late ProjetController projetController;
  late bool chargement;

  void changerRoute(String route) => NavigationController.changerView(context, route);

  Future alerteSupprimer() async {
    Alerte.demander(
      context,
      "Supprimer le projet",
      "Souhaitez-vous vraiment supprimer le projet \"${projetController.projet!.nom}\" ?",
      () async {
        setState(() => chargement = true);
        await _supprimer();
        changerRoute("/explorer");
      },
    );
  }

  Future _supprimer() async => await ProjetController.supprimerProjet(context);

  @override
  void initState() {
    super.initState();
    chargement = false;
  }

  @override
  Widget build(BuildContext context) {
    projetController = Provider.of<ProjetController>(context, listen: false);

    return AppInterface(
      child: Container(
        height: double.infinity,
        margin: EdgeInsets.all(20),
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
        SingleChildScrollView(
          child: Column(
            children: [
              EditeurInfo(),
              SizedBox(height: 20),
              StaggeredGrid.count(
                crossAxisCount: Platform.isAndroid ? 1 : 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  EditeurApplication(
                    nom: "Systèmes de jeu",
                    route: "",
                    icone: Icons.warning_rounded,
                    iconeCouleur: App.couleurs().jaune(),
                    total: 0,
                  ),
                  EditeurApplication(
                    nom: "Événements",
                    route: "",
                    icone: Icons.menu_book_rounded,
                    iconeCouleur: App.couleurs().rouge(),
                    total: projetController.personnages.length,
                  ),
                  EditeurApplication(
                    nom: "Personnages",
                    route: "/editeur/personnage/liste",
                    icone: Icons.group_rounded,
                    iconeCouleur: App.couleurs().vert(),
                    total: 0,
                  ),
                  EditeurApplication(
                    nom: "Lieux",
                    route: "",
                    icone: Icons.location_on_rounded,
                    iconeCouleur: App.couleurs().violet(),
                    total: 0,
                  ),
                  EditeurApplication(
                    nom: "Objets",
                    route: "",
                    icone: Icons.diamond_rounded,
                    iconeCouleur: App.couleurs().bleu(),
                    total: 0,
                  ),
                ],
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: BoutonIcone(
            action: alerteSupprimer,
            icone: Icons.delete_rounded,
            couleur: App.couleurs().rouge(),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: BoutonIcone(
            action: () => changerRoute("/modifier_projet"),
            icone: Icons.edit_rounded,
          ),
        ),
      ],
    );
  }
}
