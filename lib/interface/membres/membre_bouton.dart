import 'package:flutter/material.dart';
import 'package:jdr_maker/models/utilisateur_model.dart';
import 'package:jdr_maker/templates/boutons/bouton.dart';

class MembreBouton extends StatelessWidget {
  final UtilisateurModel utilisateur;

  MembreBouton({
    required this.utilisateur,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Bouton(
        onTap: () {},
        couleurHover: Colors.white.withOpacity(0.3),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.network(
            utilisateur.imageUrl,
            width: 50,
            height: 50,
          ),
        ),
      ),
    );
  }
}
