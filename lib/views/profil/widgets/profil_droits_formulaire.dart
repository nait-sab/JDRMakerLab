import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/models/membre_model.dart';
import 'package:jdr_maker/models/utilisateur_model.dart';
import 'package:jdr_maker/templates/boutons/bouton_icone.dart';
import 'package:jdr_maker/templates/boutons/bouton_switch.dart';

class ProfilDroitsFormulaire extends StatefulWidget {
  final Function modifier;
  final MembreModel membreModel;
  final UtilisateurModel membre;

  ProfilDroitsFormulaire({
    required this.modifier,
    required this.membreModel,
    required this.membre,
  });

  @override
  State<ProfilDroitsFormulaire> createState() => _ProfilDroitsFormulaireState();
}

class _ProfilDroitsFormulaireState extends State<ProfilDroitsFormulaire> {
  late bool evenementCreation;
  late bool evenementEdition;
  late bool evenementSupprimer;

  @override
  void initState() {
    super.initState();
    evenementCreation = widget.membreModel.evenementCreation;
    evenementEdition = widget.membreModel.evenementEdition;
    evenementSupprimer = widget.membreModel.evenementSupprimer;
  }

  void changerEvenementCreation() => evenementCreation = !evenementCreation;
  void changerEvenementEdition() => evenementEdition = !evenementEdition;
  void changerEvenementSupprimer() => evenementSupprimer = !evenementSupprimer;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Text(
              "Droits du membre \"${widget.membre.pseudo}\"",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Créer un événement :",
                        style: TextStyle(
                          color: App.couleurs().important(),
                          fontSize: App.fontSize().sousTitre(),
                        ),
                      ),
                      BoutonSwitch(actif: evenementCreation, action: changerEvenementCreation),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Modifier un événement :",
                        style: TextStyle(
                          color: App.couleurs().important(),
                          fontSize: App.fontSize().sousTitre(),
                        ),
                      ),
                      BoutonSwitch(actif: evenementEdition, action: changerEvenementEdition),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Supprimer un événement :",
                        style: TextStyle(
                          color: App.couleurs().important(),
                          fontSize: App.fontSize().sousTitre(),
                        ),
                      ),
                      BoutonSwitch(actif: evenementSupprimer, action: changerEvenementSupprimer),
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
            action: () => widget.modifier(
              evenementCreation,
              evenementEdition,
              evenementSupprimer,
            ),
            icone: Icons.done_rounded,
          ),
        )
      ],
    );
  }
}
