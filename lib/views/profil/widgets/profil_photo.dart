import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/models/utilisateur_model.dart';
import 'package:jdr_maker/templates/boutons/bouton.dart';

class ProfilPhoto extends StatefulWidget {
  final UtilisateurModel utilisateur;

  ProfilPhoto({
    required this.utilisateur,
  });

  @override
  State<ProfilPhoto> createState() => _ProfilPhotoState();
}

class _ProfilPhotoState extends State<ProfilPhoto> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
          ),
          child: Image.network(
            widget.utilisateur.imageUrl,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: _boutonProfil(() {}, App.couleurs().violet(), Icons.edit_rounded),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: _boutonProfil(() {}, App.couleurs().rouge(), Icons.delete_rounded),
        ),
      ],
    );
  }

  Widget _boutonProfil(VoidCallback action, Color couleur, IconData icone) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: couleur,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Material(
        color: Colors.transparent,
        child: Bouton(
          onTap: action,
          borderRadius: BorderRadius.circular(100),
          couleurHover: App.couleurs().important().withOpacity(0.3),
          child: Icon(
            icone,
            color: Colors.white,
            size: App.fontSize().icone(),
          ),
        ),
      ),
    );
  }
}
