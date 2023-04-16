import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/templates/champs/champ_saisie.dart';

class RechercheInterface extends StatefulWidget {
  @override
  State<RechercheInterface> createState() => _RechercheInterfaceState();
}

class _RechercheInterfaceState extends State<RechercheInterface> {
  late TextEditingController rechercheController;

  @override
  void initState() {
    super.initState();
    rechercheController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 500,
      margin: EdgeInsets.only(left: 10),
      child: ChampSaisie(
        controller: rechercheController,
        placeholder: "Rechercher...",
        iconeDroite: Icon(
          Icons.search_rounded,
          color: App.couleurs().texte(),
          size: App.fontSize().icone(),
        ),
        couleurFond: App.couleurs().fondPrincipale(),
        couleurSaisie: App.couleurs().texte(),
        couleurPlaceholder: App.couleurs().texte(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: App.couleurs().texte()),
        ),
        focusBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: App.couleurs().texte()),
        ),
      ),
    );
  }
}
