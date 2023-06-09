import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/utilisateur_controller.dart';
import 'package:jdr_maker/firebase/firebase_service_firestore.dart';
import 'package:jdr_maker/firebase/firebase_service_storage.dart';
import 'package:jdr_maker/models/utilisateur_model.dart';
import 'package:jdr_maker/templates/boutons/bouton.dart';
import 'package:jdr_maker/tools/image_tool.dart';

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
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.network(
            widget.utilisateur.imageUrl,
            width: 150,
            height: 150,
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: _boutonProfil(modifier, App.couleurs().violet(), Icons.edit_rounded),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: _boutonProfil(supprimer, App.couleurs().rouge(), Icons.delete_rounded),
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

  Future modifier() async {
    File? image = await ImageTool.choisirImage();

    if (image != null) {
      String url = await FirebaseServiceStorage.importer(image);
      UtilisateurModel utilisateur = await getUtilisateur();
      utilisateur.imageUrl = url;

      await FirebaseServiceFirestore.modifierDocument(
        UtilisateurModel.nomCollection,
        utilisateur.id,
        utilisateur.toMap(),
      );

      rafraichir(utilisateur);
    }
  }

  void rafraichir(UtilisateurModel utilisateur) {
    UtilisateurController.changerUtilisateur(context, utilisateur);
    setState(() {});
  }

  Future supprimer() async {
    UtilisateurModel utilisateur = await getUtilisateur();
    utilisateur.imageUrl =
        "https://firebasestorage.googleapis.com/v0/b/jdrmakerlab.appspot.com/o/defaut.png?alt=media&token=44435f0a-3992-4d9f-b16f-21c50ce1b266";

    await FirebaseServiceFirestore.modifierDocument(
      UtilisateurModel.nomCollection,
      utilisateur.id,
      utilisateur.toMap(),
    );

    rafraichir(utilisateur);
  }

  Future<UtilisateurModel> getUtilisateur() async {
    return UtilisateurController.getUtilisateur(context)!;
  }
}
