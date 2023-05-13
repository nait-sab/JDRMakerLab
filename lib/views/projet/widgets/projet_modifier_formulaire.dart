import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/models/projet_model.dart';
import 'package:jdr_maker/templates/boutons/bouton_icone.dart';
import 'package:jdr_maker/templates/boutons/bouton_switch.dart';
import 'package:jdr_maker/templates/champs/champ_saisie.dart';

class ProjetModifierFormulaire extends StatefulWidget {
  final Function modifier;
  final ProjetModel projet;

  ProjetModifierFormulaire({
    required this.modifier,
    required this.projet,
  });

  @override
  State<ProjetModifierFormulaire> createState() => _ProjetModifierFormulaireState();
}

class _ProjetModifierFormulaireState extends State<ProjetModifierFormulaire> {
  late TextEditingController nom;
  late bool projetPublic;

  @override
  void initState() {
    super.initState();
    nom = TextEditingController(text: widget.projet.nom);
    projetPublic = widget.projet.isPublic;
  }

  void changerPublic() => projetPublic = !projetPublic;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Text(
              "Modifier le projet",
              style: TextStyle(
                color: App.couleurs().important(),
                fontSize: App.fontSize().sousTitre(),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nom",
                    style: TextStyle(
                      color: App.couleurs().important(),
                      fontSize: App.fontSize().sousTitre(),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Projet public :",
                        style: TextStyle(
                          color: App.couleurs().important(),
                          fontSize: App.fontSize().sousTitre(),
                        ),
                      ),
                      BoutonSwitch(actif: projetPublic, action: changerPublic),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: BoutonIcone(
            action: () => widget.modifier(nom.text, projetPublic),
            icone: Icons.done_rounded,
          ),
        )
      ],
    );
  }
}
