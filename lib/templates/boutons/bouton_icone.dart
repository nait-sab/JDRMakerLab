import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/templates/boutons/bouton.dart';

/// Classe : Bouton Icone
///
/// Type : Widget (Commun)
class BoutonIcone extends StatelessWidget {
  /// Icone du bouton
  final IconData icone;

  /// Taille de l'icone
  final double size;

  /// Action du bouton
  final VoidCallback action;

  /// Bouton du bouton (Violet par défaut)
  final Color? couleur;

  BoutonIcone({
    required this.icone,
    required this.action,
    double? size,
    Color? couleur,
  })  : size = size ?? App.fontSize().icone(),
        couleur = couleur ?? App.couleurs().violet();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Bouton(
        onTap: action,
        borderRadius: BorderRadius.circular(50),
        couleurHover: App.couleurs().fondSecondaire().withOpacity(0.3),
        child: Ink(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: couleur,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Icon(
            icone,
            color: Colors.white,
            size: size,
          ),
        ),
      ),
    );
  }
}
