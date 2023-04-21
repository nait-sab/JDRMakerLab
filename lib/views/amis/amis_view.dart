import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/interface/app_interface.dart';
import 'package:jdr_maker/templates/boutons/bouton.dart';

class AmisView extends StatefulWidget {
  @override
  State<AmisView> createState() => _AmisViewState();
}

class _AmisViewState extends State<AmisView> {
  late int ongletIndex;

  @override
  void initState() {
    super.initState();
    ongletIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return AppInterface(
      child: Container(
        height: double.infinity,
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                _ongletTitre("Tous", 0),
                _ongletTitre("En attente", 1),
                _ongletTitre("Ajouter", 2),
              ],
            ),
            SizedBox(height: 5),
            Container(
              height: 5,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: App.couleurs().texte(),
              ),
            ),
            SizedBox(height: 5),
            _onglet(),
          ],
        ),
      ),
    );
  }

  Widget _ongletTitre(String nom, int index) {
    bool actif = ongletIndex == index;

    return Bouton(
      onTap: () => setState(() => ongletIndex = index),
      borderRadius: BorderRadius.circular(100),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Text(
          nom,
          style: TextStyle(
            color: actif ? App.couleurs().important() : App.couleurs().texte(),
            fontWeight: actif ? FontWeight.bold : FontWeight.normal,
            fontSize: App.fontSize().normal(),
          ),
        ),
      ),
    );
  }

  Widget _onglet() {
    List<Widget> utilisateurs = [];

    if (ongletIndex == 0) {
      utilisateurs.add(_utilisateur());
      utilisateurs.add(_utilisateur());
      utilisateurs.add(_utilisateur());
    } else if (ongletIndex == 1) {
      utilisateurs.add(_utilisateur());
    }

    return Column(
      children: utilisateurs,
    );
  }

  Widget _utilisateur() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Material(
        color: Colors.transparent,
        child: Bouton(
          onTap: () {},
          couleurHover: App.couleurs().important().withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
          child: Ink(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: App.couleurs().fondSecondaire(),
            ),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "Ricard",
                  style: TextStyle(
                    color: App.couleurs().important(),
                    fontSize: App.fontSize().normal(),
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.settings_rounded,
                  color: App.couleurs().important(),
                  size: App.fontSize().titre(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
