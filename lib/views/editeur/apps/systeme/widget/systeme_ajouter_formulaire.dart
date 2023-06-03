import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/templates/boutons/bouton_icone.dart';
import 'package:jdr_maker/templates/champs/champ_saisie.dart';
import 'package:jdr_maker/templates/champs/champ_texte.dart';
import 'package:jdr_maker/views/editeur/apps/widgets/editeur_application_entete.dart';

class SystemeAjouterFormulaire extends StatefulWidget {
  final Function creer;

  SystemeAjouterFormulaire({
    required this.creer,
  });

  @override
  State<SystemeAjouterFormulaire> createState() => _SystemeAjouterFormulaireState();
}

class _SystemeAjouterFormulaireState extends State<SystemeAjouterFormulaire> {
  late TextEditingController nom;
  late QuillController contenu;

  @override
  void initState() {
    super.initState();
    nom = TextEditingController();
    contenu = QuillController.basic();
    nom.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            EditeurApplicationEntete(
              titre: "Nouveau système",
              route: "/editeur/systeme/liste",
            ),
            SizedBox(height: 20),
            Expanded(
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
                    ChampSaisie(
                      controller: nom,
                      couleurFond: App.couleurs().fondPrincipale(),
                      couleurSaisie: App.couleurs().texte(),
                      couleurPlaceholder: App.couleurs().texte(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: App.couleurs().texte(),
                          width: 3,
                        ),
                      ),
                      focusBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: App.couleurs().violet(),
                          width: 3,
                        ),
                      ),
                    ),
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
                      controller: contenu,
                      modifiable: true,
                    ),
                    SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
        boutonAjouter(),
      ],
    );
  }

  Widget boutonAjouter() {
    if (nom.text.isEmpty) {
      return Container();
    }

    return Align(
      alignment: Alignment.bottomRight,
      child: BoutonIcone(
        action: () => widget.creer(
          nom.text,
          jsonEncode(contenu.document.toDelta().toJson()).toString(),
        ),
        icone: Icons.done_rounded,
      ),
    );
  }
}
