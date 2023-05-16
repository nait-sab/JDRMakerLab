import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/controllers/projet_controller.dart';
import 'package:jdr_maker/firebase/firebase_service_firestore.dart';
import 'package:jdr_maker/models/lieu_model.dart';
import 'package:jdr_maker/templates/alertes/alerte.dart';
import 'package:jdr_maker/templates/boutons/bouton_icone.dart';
import 'package:jdr_maker/templates/champs/champ_saisie.dart';
import 'package:jdr_maker/templates/champs/champ_zone.dart';
import 'package:jdr_maker/views/editeur/apps/widgets/editeur_application_entete.dart';

class LieuModifierFormulaire extends StatefulWidget {
  final LieuModel lieu;
  final Function modifier;
  final Function supprimer;

  LieuModifierFormulaire({
    required this.lieu,
    required this.modifier,
    required this.supprimer,
  });

  @override
  State<LieuModifierFormulaire> createState() => _LieuModifierFormulaireState();
}

class _LieuModifierFormulaireState extends State<LieuModifierFormulaire> {
  late TextEditingController nom;
  late TextEditingController description;

  @override
  void initState() {
    super.initState();
    nom = TextEditingController(text: widget.lieu.nom);
    description = TextEditingController(text: widget.lieu.description);
    nom.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            EditeurApplicationEntete(
              titre: "Modifier un lieu",
              route: "/editeur/lieu/liste",
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
                      "Description",
                      style: TextStyle(
                        color: App.couleurs().important(),
                        fontSize: App.fontSize().normal(),
                      ),
                    ),
                    SizedBox(height: 5),
                    ChampZone(
                      controller: description,
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
                  ],
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: BoutonIcone(
            action: () => widget.supprimer(widget.lieu),
            icone: Icons.delete_rounded,
            couleur: App.couleurs().rouge(),
          ),
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
        action: () => widget.modifier(nom.text, description.text),
        icone: Icons.done_rounded,
      ),
    );
  }
}
