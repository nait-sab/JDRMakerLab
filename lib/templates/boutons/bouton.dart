import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';

/// Classe : Bouton
///
/// Type : Widget (Commun)
///
/// Créer un bouton personnalisé
class Bouton extends StatelessWidget {
  /// Fonction appeler au clic
  final VoidCallback onTap;
  final Color couleurTap;

  // Survol
  final Function(bool) onHover;
  final Color couleurHover;

  /// Widget à placer dans le bouton
  final Widget child;

  /// Arrondi de l'animation du bouton si nécéssaire
  final BorderRadius borderRadius;

  Bouton({
    required this.onTap,
    required this.child,
    BorderRadius? borderRadius,
    Function(bool)? onHover,
    Color? couleurTap,
    Color? couleurHover,
  })  : onHover = onHover ?? ((survol) {}),
        couleurTap = couleurTap ?? App.couleurs().important().withOpacity(0.3),
        couleurHover = couleurHover ?? App.couleurs().fondSecondaire(),
        borderRadius = borderRadius ?? BorderRadius.circular(0);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: couleurTap,
      onHover: onHover,
      hoverColor: couleurHover,
      borderRadius: borderRadius,
      child: child,
    );
  }
}
