import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/controllers/projet_controller.dart';
import 'package:jdr_maker/controllers/utilisateur_controller.dart';
import 'package:jdr_maker/interface/selection/selection_nouveau.dart';
import 'package:jdr_maker/interface/selection/selection_rejoindre.dart';
import 'package:jdr_maker/models/projet_model.dart';
import 'package:jdr_maker/templates/boutons/bouton.dart';
import 'package:jdr_maker/tools/securite_tool.dart';

class SelectionInterface extends StatefulWidget {
  final ProjetController projetController;
  final Function action;

  SelectionInterface({
    required this.projetController,
    required this.action,
  });

  @override
  State<SelectionInterface> createState() => _SelectionInterfaceState();
}

class _SelectionInterfaceState extends State<SelectionInterface> {
  void changerRoute(String route) => NavigationController.changerView(context, route);
  void creerProjet() => changerRoute("/creer_projet");

  @override
  Widget build(BuildContext context) {
    Size ecran = MediaQuery.of(context).size;

    return Container(
      width: Platform.isAndroid ? double.infinity : ecran.width / 4,
      decoration: BoxDecoration(
        border: Border.all(color: App.couleurs().texte()),
        color: App.couleurs().fondPrincipale(),
      ),
      child: renduListe(),
    );
  }

  Widget renduListe() {
    if (widget.projetController.projets.length < 5) {
      return Wrap(
        children: liste(),
      );
    }

    return SizedBox(
      height: 250,
      child: SingleChildScrollView(child: Column(children: liste())),
    );
  }

  List<Widget> liste() {
    List<Widget> liste = [];

    liste.add(SelectionNouveau(action: () => changerRoute("/nouveau_projet")));
    liste.add(SelectionRejoindre(action: () => changerRoute("/rejoindre_projet")));

    if (widget.projetController.projets.isEmpty) {
      liste.add(Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Text(
            "Vous n'avez aucun projet",
            style: TextStyle(
              color: App.couleurs().texte(),
              fontSize: App.fontSize().normal(),
            ),
          ),
        ),
      ));
    } else {
      for (ProjetModel projet in widget.projetController.projets) {
        liste.add(boutonProjet(projet));
      }
    }

    return liste;
  }

  Widget boutonProjet(ProjetModel projet) {
    return Material(
      color: Colors.transparent,
      child: Bouton(
        onTap: () => widget.action(projet),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(border: Border.all()),
          child: Row(
            children: [
              Text(
                projet.nom,
                style: TextStyle(
                  color: App.couleurs().texte(),
                  fontSize: App.fontSize().normal(),
                ),
              ),
              Spacer(),
              iconePartage(projet),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconePartage(ProjetModel projet) {
    bool isCreateur = SecuriteTool.isCreateur(
      projet,
      UtilisateurController.getUtilisateur(context)!,
    );

    if (!isCreateur) {
      return Icon(
        Icons.share_rounded,
        color: App.couleurs().violet(),
        size: 30,
      );
    }

    return Container();
  }
}
