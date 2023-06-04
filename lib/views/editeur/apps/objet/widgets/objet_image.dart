import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/firebase/firebase_service_storage.dart';
import 'package:jdr_maker/templates/boutons/bouton.dart';
import 'package:jdr_maker/tools/image_tool.dart';

class ObjetImage extends StatelessWidget {
  final bool modifiable;
  final String urlIcone;
  final Function changerImage;

  ObjetImage({
    required this.modifiable,
    required this.urlIcone,
    Function? changerImage,
  }) : changerImage = changerImage ?? (() {});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: getPhoto(),
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

  Widget getPhoto() {
    if (urlIcone == "") {
      return Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: App.couleurs().important().withOpacity(0.5),
          borderRadius: BorderRadius.circular(100),
        ),
      );
    }

    return Image.network(
      urlIcone,
      width: 150,
      height: 150,
    );
  }

  Widget _boutonProfil(VoidCallback action, Color couleur, IconData icone) {
    if (!modifiable) {
      return Container();
    }

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
      changerImage(url);
    }
  }

  Future supprimer() async {
    changerImage("");
  }
}
