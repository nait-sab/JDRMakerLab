import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/templates/boutons/bouton_icone.dart';
import 'package:jdr_maker/templates/boutons/bouton_switch.dart';
import 'package:jdr_maker/templates/champs/champ_saisie.dart';

class ProjetCreateFormulaire extends StatefulWidget {
  final Function creer;

  ProjetCreateFormulaire({
    required this.creer,
  });

  @override
  State<ProjetCreateFormulaire> createState() => _ProjetCreateFormulaireState();
}

class _ProjetCreateFormulaireState extends State<ProjetCreateFormulaire> {
  late TextEditingController nom;
  late bool projetPublic;

  @override
  void initState() {
    super.initState();
    nom = TextEditingController();
    projetPublic = false;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Text(
              "Créer un nouveau projet",
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
                      BoutonSwitch(actif: projetPublic, action: () {}),
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
            action: () => widget.creer(nom.text, projetPublic),
            icone: Icons.done_rounded,
          ),
        )
      ],
    );
  }
}
