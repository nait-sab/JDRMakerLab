import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/firebase/firebase_service_storage.dart';
import 'package:jdr_maker/templates/boutons/bouton.dart';
import 'package:jdr_maker/tools/image_tool.dart';

class PersonnageImage extends StatefulWidget {
  final bool modifiable;
  final bool isIcone;

  final String urlIcone;
  final Function changerImage;

  PersonnageImage({
    required this.modifiable,
    required this.isIcone,
    String? urlIcone,
    Function? changerIcone,
  })  : urlIcone = urlIcone ?? "",
        changerImage = changerIcone ?? (() {});

  @override
  State<PersonnageImage> createState() => _PersonnageImageState();
}

class _PersonnageImageState extends State<PersonnageImage> {
  late bool chargement;

  @override
  void initState() {
    super.initState();
    chargement = false;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(widget.isIcone ? 100 : 20),
          child: getPhoto(),
        ),
        Align(
          alignment: widget.isIcone ? Alignment.topRight : Alignment.bottomRight,
          child: _boutonProfil(modifier, App.couleurs().violet(), Icons.edit_rounded),
        ),
        Align(
          alignment: widget.isIcone ? Alignment.bottomRight : Alignment.bottomLeft,
          child: _boutonProfil(supprimer, App.couleurs().rouge(), Icons.delete_rounded),
        ),
      ],
    );
  }

  Widget getPhoto() {
    if (widget.urlIcone == "") {
      return Container(
        width: widget.isIcone ? 150 : 180,
        height: widget.isIcone ? 150 : 400,
        decoration: BoxDecoration(
          color: App.couleurs().important().withOpacity(0.5),
          borderRadius: BorderRadius.circular(widget.isIcone ? 100 : 20),
        ),
      );
    }

    return Image.network(
      widget.urlIcone,
      width: widget.isIcone ? 150 : 180,
      height: widget.isIcone ? 150 : 400,
    );
  }

  Widget _boutonProfil(VoidCallback action, Color couleur, IconData icone) {
    if (!widget.modifiable) {
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
      widget.changerImage(url);
    }
  }

  Future supprimer() async {
    widget.changerImage("");
  }
}
