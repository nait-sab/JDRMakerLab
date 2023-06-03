import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/models/systeme_model.dart';
import 'package:jdr_maker/templates/champs/champ_texte.dart';

class SystemeVueContenu extends StatelessWidget {
  final SystemeModel systeme;

  SystemeVueContenu({
    required this.systeme,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nom",
              style: TextStyle(
                color: App.couleurs().important(),
                fontSize: App.fontSize().normal(),
              ),
            ),
            SizedBox(height: 5),
            Text(
              systeme.nom,
              style: TextStyle(
                color: App.couleurs().texte(),
                fontSize: App.fontSize().normal(),
              ),
            ),
            blocDescription(),
          ],
        ),
      ),
    );
  }

  Widget blocDescription() {
    if (systeme.contenu.isEmpty) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          "Contenu",
          style: TextStyle(
            color: App.couleurs().important(),
            fontSize: App.fontSize().normal(),
          ),
        ),
        SizedBox(height: 5),
        ChampTexte(
          controller: QuillController(
            document: Document.fromJson(jsonDecode(systeme.contenu)),
            selection: TextSelection.fromPosition(TextPosition(offset: 0)),
          ),
          modifiable: false,
        ),
      ],
    );
  }
}
