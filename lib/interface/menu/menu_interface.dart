import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/controllers/projet_controller.dart';
import 'package:jdr_maker/firebase/firebase_service_auth.dart';
import 'package:jdr_maker/interface/menu/menu_bouton.dart';
import 'package:jdr_maker/interface/menu/menu_icone.dart';
import 'package:jdr_maker/interface/menu/menu_titre.dart';

class MenuInterface extends StatefulWidget {
  @override
  State<MenuInterface> createState() => _MenuInterfaceState();
}

class _MenuInterfaceState extends State<MenuInterface> {
  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid ? renduAndroid(context) : renduDesktop(context);
  }

  Widget renduDesktop(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(width: 3, color: App.couleurs().fondSecondaire()),
        ),
      ),
      child: Column(
        children: _getContenu(context),
      ),
    );
  }

  Widget renduAndroid(BuildContext context) {
    return Container(
      height: 75,
      color: App.couleurs().fondSecondaire(),
      child: Row(
        children: _getContenu(context),
      ),
    );
  }

  List<Widget> _getContenu(BuildContext context) {
    List<Widget> liste = [];

    if (Platform.isAndroid) {
      liste.add(MenuIcone(icone: Icons.explore_rounded));
      liste.add(MenuIcone(icone: Icons.search_rounded));
      liste.add(MenuIcone(icone: Icons.home_rounded));
      liste.add(MenuIcone(icone: Icons.play_arrow_rounded));
      liste.add(MenuIcone(icone: Icons.person_rounded));
    } else {
      liste.add(MenuTitre(texte: "Projet"));
      liste.add(MenuBouton(
        texte: "Explorer",
        icone: Icons.explore_rounded,
        routes: ["/explorer"],
        action: () {},
      ));

      if (ProjetController.getProjet(context) != null) {
        liste.add(MenuBouton(
          texte: "Éditeur",
          icone: Icons.home_rounded,
          routes: [],
          action: () {},
        ));
      }

      liste.add(MenuTitre(texte: "Social"));
      liste.add(MenuBouton(
        texte: "Amis",
        icone: Icons.group_rounded,
        routes: [],
        action: () {},
      ));
      liste.add(MenuBouton(
        texte: "Jouer",
        icone: Icons.play_arrow_rounded,
        routes: [],
        action: () {},
      ));

      liste.add(MenuTitre(texte: "Général"));
      liste.add(MenuBouton(
        texte: "Paramètres",
        icone: Icons.settings_rounded,
        routes: [],
        action: () {},
      ));
      liste.add(MenuBouton(
        texte: "Déconnexion",
        icone: Icons.logout_rounded,
        routes: [],
        action: _deconnexion,
      ));
    }

    return liste;
  }

  /// Déconnecter l'utilisateur
  Future _deconnexion() async {
    await FirebaseServiceAuth.deconnexion(context);
    _changerRoute("/connexion");
  }

  void _changerRoute(String route) => NavigationController.changerView(context, route);
}