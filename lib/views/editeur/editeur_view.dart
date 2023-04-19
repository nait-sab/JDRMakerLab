import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/projet_controller.dart';
import 'package:jdr_maker/interface/app_interface.dart';
import 'package:jdr_maker/views/editeur/widgets/editeur_application.dart';
import 'package:jdr_maker/views/editeur/widgets/editeur_info.dart';
import 'package:provider/provider.dart';

class EditeurView extends StatefulWidget {
  @override
  State<EditeurView> createState() => _EditeurViewState();
}

class _EditeurViewState extends State<EditeurView> {
  late ProjetController projetController;

  @override
  Widget build(BuildContext context) {
    projetController = Provider.of<ProjetController>(context, listen: false);

    return AppInterface(
      child: Container(
        height: double.infinity,
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
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
                    nom: "Système de jeu",
                    icone: Icons.warning_rounded,
                    iconeCouleur: App.couleurs().jaune(),
                    total: 0,
                  ),
                  EditeurApplication(
                    nom: "Événements",
                    icone: Icons.menu_book_rounded,
                    iconeCouleur: App.couleurs().rouge(),
                    total: 0,
                  ),
                  EditeurApplication(
                    nom: "Personnages",
                    icone: Icons.group_rounded,
                    iconeCouleur: App.couleurs().vert(),
                    total: 0,
                  ),
                  EditeurApplication(
                    nom: "Lieux",
                    icone: Icons.location_on_rounded,
                    iconeCouleur: App.couleurs().violet(),
                    total: 0,
                  ),
                  EditeurApplication(
                    nom: "Objets",
                    icone: Icons.diamond_rounded,
                    iconeCouleur: App.couleurs().bleu(),
                    total: 0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
