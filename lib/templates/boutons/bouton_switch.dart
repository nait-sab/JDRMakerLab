import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/templates/boutons/bouton.dart';

class BoutonSwitch extends StatefulWidget {
  /// État par défaut du switch
  final bool actif;

  /// Action lié au switch
  final VoidCallback action;

  BoutonSwitch({
    required this.actif,
    required this.action,
  });

  @override
  State<BoutonSwitch> createState() => _BoutonSwitchState();
}

class _BoutonSwitchState extends State<BoutonSwitch> {
  late bool actif;

  @override
  void initState() {
    super.initState();
    actif = widget.actif;
  }

  void onTap() {
    setState(() {
      widget.action();
      actif = !actif;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Bouton(
      onTap: onTap,
      child: Container(
        width: App.fontSize().icone() * 2,
        height: App.fontSize().icone(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: actif ? App.couleurs().violet().withOpacity(0.2) : App.couleurs().fondPrincipale(),
        ),
        child: Row(
          children: [
            // Bord Gauche
            SizedBox(width: actif ? App.fontSize().icone() : 0),
            // Curseur
            Container(
              width: App.fontSize().icone(),
              height: App.fontSize().icone(),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: App.couleurs().violet(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
