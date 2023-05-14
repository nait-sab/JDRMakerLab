import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/models/utilisateur_model.dart';
import 'package:jdr_maker/templates/boutons/bouton_icone.dart';
import 'package:jdr_maker/templates/champs/champ_mail.dart';
import 'package:jdr_maker/templates/champs/champ_passe.dart';
import 'package:jdr_maker/templates/champs/champ_saisie.dart';

class ProfilModifierFormulaire extends StatefulWidget {
  final Function modifier;
  final UtilisateurModel utilisateur;

  ProfilModifierFormulaire({
    required this.modifier,
    required this.utilisateur,
  });

  @override
  State<ProfilModifierFormulaire> createState() => _ProfilModifierFormulaireState();
}

class _ProfilModifierFormulaireState extends State<ProfilModifierFormulaire> {
  late TextEditingController pseudo;
  late TextEditingController mail;
  late TextEditingController passe;

  @override
  void initState() {
    super.initState();
    pseudo = TextEditingController(text: widget.utilisateur.pseudo);
    mail = TextEditingController(text: widget.utilisateur.mail);
    passe = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Text(
              "Modifier mon profil",
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
                    "Pseudo",
                    style: TextStyle(
                      color: App.couleurs().important(),
                      fontSize: App.fontSize().sousTitre(),
                    ),
                  ),
                  SizedBox(height: 5),
                  ChampSaisie(
                    iconeGauche: Icon(
                      Icons.person_rounded,
                      color: App.couleurs().texte(),
                      size: App.fontSize().icone(),
                    ),
                    controller: pseudo,
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
                    "Mail",
                    style: TextStyle(
                      color: App.couleurs().important(),
                      fontSize: App.fontSize().sousTitre(),
                    ),
                  ),
                  SizedBox(height: 5),
                  ChampMail(
                    iconeGauche: Icon(
                      Icons.mail_rounded,
                      color: App.couleurs().texte(),
                      size: App.fontSize().icone(),
                    ),
                    controller: mail,
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
                    "Mot de passe",
                    style: TextStyle(
                      color: App.couleurs().important(),
                      fontSize: App.fontSize().sousTitre(),
                    ),
                  ),
                  SizedBox(height: 5),
                  ChampPasse(
                    iconeGauche: Icon(
                      Icons.lock_rounded,
                      color: App.couleurs().texte(),
                      size: App.fontSize().icone(),
                    ),
                    controller: passe,
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
          ],
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: BoutonIcone(
            action: () => widget.modifier(pseudo.text, mail.text, passe.text),
            icone: Icons.done_rounded,
          ),
        )
      ],
    );
  }
}
