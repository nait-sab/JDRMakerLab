import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';

/// Classe : Boutons Windows
///
/// Définit les boutons windows et leurs couleurs
class BoutonsWindows extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: couleurBoutonWindow()),
        MaximizeWindowButton(colors: couleurBoutonWindow()),
        CloseWindowButton(colors: couleurBoutonWindow()),
      ],
    );
  }

  WindowButtonColors couleurBoutonWindow() {
    return WindowButtonColors(
      mouseOver: App.couleurs().fondSecondaire(),
      mouseDown: App.couleurs().fondSecondaire(),
      iconNormal: Colors.white,
      iconMouseDown: Colors.white,
      iconMouseOver: Colors.white,
    );
  }
}
