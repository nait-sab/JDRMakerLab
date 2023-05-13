import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/templates/boutons/bouton.dart';

class SelectionNouveau extends StatelessWidget {
  final VoidCallback action;

  SelectionNouveau({
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Bouton(
        onTap: action,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(border: Border.all(color: App.couleurs().texte())),
          child: Center(
            child: Text(
              "Créer un projet",
              style: TextStyle(
                color: App.couleurs().important(),
                fontSize: App.fontSize().normal(),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
