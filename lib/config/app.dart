import 'package:flutter/material.dart';
import 'package:jdr_maker/config/routes.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/data/couleurs.dart';
import 'package:jdr_maker/data/icones.dart';
import 'package:jdr_maker/data/polices.dart';
import 'package:provider/provider.dart';

/// Classe App
///
/// Initialisation de la configuration et lancement du projet
///
/// Démarrage automatique de l'application sur la route d'accueil ("/")
class App extends StatelessWidget {
  /// Instance des icones
  static Icones icones() => Icones();

  /// Instance des couleurs
  static Couleurs couleurs() => Couleurs();

  /// Instance des polices
  static Polices fontSize() => Polices();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Navigator(
          pages: Routes.applicationRoutes(context),
          onPopPage: (route, resultat) {
            bool popStatus = route.didPop(resultat);
            if (popStatus) {
              Provider.of<NavigationController>(context, listen: false).changerRoute("/connexion");
            }
            return popStatus;
          },
        ),
      ),
    );
  }
}
