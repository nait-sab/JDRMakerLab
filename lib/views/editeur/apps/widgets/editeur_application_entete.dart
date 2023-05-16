import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/templates/boutons/bouton.dart';

class EditeurApplicationEntete extends StatefulWidget {
  final String titre;
  final String route;

  EditeurApplicationEntete({
    required this.titre,
    required this.route,
  });

  @override
  State<EditeurApplicationEntete> createState() => _EditeurApplicationEnteteState();
}

class _EditeurApplicationEnteteState extends State<EditeurApplicationEntete> {
  void changerRoute(String route) => NavigationController.changerView(context, route);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Bouton(
              onTap: () => changerRoute(widget.route),
              child: Text(
                "< Retour",
                style: TextStyle(
                  color: App.couleurs().texte(),
                  fontSize: App.fontSize().sousTitre(),
                ),
              ),
            ),
          ),
          Align(
            child: Center(
              child: Text(
                widget.titre,
                style: TextStyle(
                  color: App.couleurs().important(),
                  fontSize: App.fontSize().sousTitre(),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
