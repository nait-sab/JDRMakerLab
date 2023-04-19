import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';

/// Bouton du menu pour changer de route
class MenuBouton extends StatefulWidget {
  /// Texte du bouton
  final String texte;

  /// Icône du bouton
  final IconData icone;

  /// Liste de [routes] à vérifier pour afficher le bouton comme actif ou non
  final List<String> routes;

  /// Action du clic
  final VoidCallback action;

  MenuBouton({
    required this.texte,
    required this.icone,
    required this.routes,
    required this.action,
  });

  @override
  State<MenuBouton> createState() => _MenuBoutonState();
}

class _MenuBoutonState extends State<MenuBouton> {
  void _survol(bool survol) {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.action,
      onHover: _survol,
      hoverColor: App.couleurs().fondSecondaire(),
      child: Container(
        width: double.infinity,
        height: 30,
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              _getPastille(),
              SizedBox(width: _isActif() ? 10 : 20),
              Icon(
                widget.icone,
                color: getCouleur(),
                size: App.fontSize().icone(),
              ),
              SizedBox(width: 5),
              Text(
                widget.texte,
                style: TextStyle(
                  color: getCouleur(),
                  fontSize: App.fontSize().normal(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getPastille() {
    if (_isActif()) {
      return Container(
        width: 10,
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: getCouleur(),
        ),
      );
    }

    return Container();
  }

  Color getCouleur() {
    if (widget.routes.contains(NavigationController.getRoute(context))) {
      return App.couleurs().important();
    }

    return App.couleurs().texte();
  }

  bool _isActif() {
    return widget.routes.contains(NavigationController.getRoute(context));
  }
}
