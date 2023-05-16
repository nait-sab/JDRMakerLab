import 'package:flutter/material.dart';
import 'package:jdr_maker/controllers/membre_controller.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/models/membre_model.dart';
import 'package:jdr_maker/models/utilisateur_model.dart';
import 'package:jdr_maker/templates/boutons/bouton.dart';

class MembreBouton extends StatefulWidget {
  final MembreModel membreModel;
  final UtilisateurModel membre;
  final bool clicAutoriser;

  MembreBouton({
    required this.membreModel,
    required this.membre,
    required this.clicAutoriser,
  });

  @override
  State<MembreBouton> createState() => _MembreBoutonState();
}

class _MembreBoutonState extends State<MembreBouton> {
  void ouvrirDroits() {
    if (widget.clicAutoriser) {
      MembreController.changerMembre(context, widget.membreModel, widget.membre);
      changerRoute("/membres/droits");
    }
  }

  void changerRoute(String route) => NavigationController.changerView(context, route);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Bouton(
        onTap: ouvrirDroits,
        couleurHover: Colors.white.withOpacity(0.3),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.network(
            widget.membre.imageUrl,
            width: 50,
            height: 50,
          ),
        ),
      ),
    );
  }
}
