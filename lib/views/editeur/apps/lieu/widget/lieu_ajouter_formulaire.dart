import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/templates/boutons/bouton_icone.dart';
import 'package:jdr_maker/templates/champs/champ_saisie.dart';
import 'package:jdr_maker/templates/champs/champ_zone.dart';
import 'package:jdr_maker/views/editeur/apps/widgets/editeur_application_entete.dart';

class LieuAjouterFormulaire extends StatefulWidget {
  final Function creer;

  LieuAjouterFormulaire({
    required this.creer,
  });

  @override
  State<LieuAjouterFormulaire> createState() => _LieuAjouterFormulaireState();
}

class _LieuAjouterFormulaireState extends State<LieuAjouterFormulaire> {
  late TextEditingController nom;
  late TextEditingController description;

  @override
  void initState() {
    super.initState();
    nom = TextEditingController();
    description = TextEditingController();
    nom.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            EditeurApplicationEntete(
              titre: "Nouveau lieu",
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
        action: () => widget.creer(nom.text, description.text),
        icone: Icons.done_rounded,
      ),
    );
  }
}
