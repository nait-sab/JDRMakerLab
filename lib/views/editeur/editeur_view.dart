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
                crossAxisCount: 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  EditeurApplication(
                    nom: "Systèmes de jeu",
                    route: "/editeur/systeme/liste",
                    icone: Icons.warning_rounded,
                    iconeCouleur: App.couleurs().jaune(),
                    total: projetController.systemes.length,
                  ),
                  EditeurApplication(
                    nom: "Événements",
                    route: "/editeur/evenement/liste",
                    icone: Icons.menu_book_rounded,
                    iconeCouleur: App.couleurs().rouge(),
                    total: projetController.evenements.length,
                  ),
                  EditeurApplication(
                    nom: "Personnages",
                    route: "/editeur/personnage/liste",
                    icone: Icons.group_rounded,
                    iconeCouleur: App.couleurs().vert(),
                    total: projetController.personnages.length,
                  ),
                  EditeurApplication(
                    nom: "Lieux",
                    route: "/editeur/lieu/liste",
                    icone: Icons.location_on_rounded,
                    iconeCouleur: App.couleurs().violet(),
                    total: projetController.lieux.length,
                  ),
                  EditeurApplication(
                    nom: "Objets",
                    route: "/editeur/objet/liste",
                    icone: Icons.diamond_rounded,
                    iconeCouleur: App.couleurs().bleu(),
                    total: projetController.objets.length,
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
