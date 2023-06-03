import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/models/systeme_model.dart';
import 'package:jdr_maker/templates/boutons/bouton_icone.dart';
import 'package:jdr_maker/templates/champs/champ_saisie.dart';
import 'package:jdr_maker/templates/champs/champ_texte.dart';
import 'package:jdr_maker/views/editeur/apps/widgets/editeur_application_entete.dart';

class SystemeModifierFormulaire extends StatefulWidget {
  final SystemeModel systeme;
  final Function modifier;

  SystemeModifierFormulaire({
    required this.systeme,
    required this.modifier,
  });

  @override
  State<SystemeModifierFormulaire> createState() => _SystemeModifierFormulaireState();
}

class _SystemeModifierFormulaireState extends State<SystemeModifierFormulaire> {
  late TextEditingController nom;
  late QuillController contenu;

  @override
  void initState() {
    super.initState();
    nom = TextEditingController(text: widget.systeme.nom);
    contenu = QuillController(
      document: Document.fromJson(jsonDecode(widget.systeme.contenu)),
      selection: TextSelection.fromPosition(TextPosition(offset: 0)),
    );
    nom.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            EditeurApplicationEntete(
              titre: "Modifier le système : ${widget.systeme.nom}",
              route: "/editeur/systeme/vue",
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
        Align(
          alignment: Alignment.bottomLeft,
          child: BoutonIcone(
            action: () => NavigationController.changerView(context, "/editeur/systeme/vue"),
            icone: Icons.close_rounded,
            couleur: App.couleurs().rouge(),
          ),
        ),
        boutonConfirmer(),
      ],
    );
  }

  Widget boutonConfirmer() {
    if (nom.text.isEmpty) {
      return Container();
    }

    return Align(
      alignment: Alignment.bottomRight,
      child: BoutonIcone(
        action: () => widget.modifier(nom.text, ""),
        icone: Icons.done_rounded,
      ),
    );
  }
}
