import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/templates/boutons/bouton.dart';

class ProfilParametreCategorie extends StatefulWidget {
  final String nom;
  final bool actif;
  final String route;

  /// Si une quantité doit être affiché dans le nom
  final int? total;

  ProfilParametreCategorie({
    required this.nom,
    required this.actif,
    required this.route,
    int? total,
  }) : total = total ?? 0;

  @override
  State<ProfilParametreCategorie> createState() => _ProfilParametreCategorieState();
}

class _ProfilParametreCategorieState extends State<ProfilParametreCategorie> {
  late String nom;

  @override
  void initState() {
    super.initState();
    nom = widget.nom;

    if (widget.total != 0) {
      nom += "(${widget.total.toString()})";
    }
  }

  void changerRoute(String route) => NavigationController.changerView(context, route);

  @override
  Widget build(BuildContext context) {
    return Bouton(
      onTap: () => changerRoute(widget.route),
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          nom,
          style: TextStyle(
            color: widget.actif ? App.couleurs().important() : App.couleurs().texte(),
            fontSize: App.fontSize().normal(),
            fontWeight: widget.actif ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
