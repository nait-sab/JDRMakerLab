import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/controllers/objet_controller.dart';
import 'package:jdr_maker/models/objet_model.dart';
import 'package:jdr_maker/templates/boutons/bouton.dart';

class ObjetListe extends StatefulWidget {
  final List<ObjetModel> objets;

  ObjetListe({
    required this.objets,
  });

  @override
  State<ObjetListe> createState() => _ObjetListeState();
}

class _ObjetListeState extends State<ObjetListe> {
  Future modifier(ObjetModel objet) async {
    ObjetController.changerObjet(context, objet);
    NavigationController.changerView(context, "/editeur/objet/vue");
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(widget.objets.length, (index) {
            return Column(
              children: [
                SizedBox(height: 10),
                afficherObjet(widget.objets[index]),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget afficherObjet(ObjetModel objet) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: App.couleurs().fondPrincipale(),
      ),
      child: Material(
        color: Colors.transparent,
        child: Bouton(
          onTap: () => modifier(objet),
          borderRadius: BorderRadius.circular(10),
          couleurHover: Colors.white.withOpacity(0.2),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  objet.nom,
                  style: TextStyle(
                    color: App.couleurs().important(),
                    fontSize: App.fontSize().normal(),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      objet.dateModification,
                      style: TextStyle(
                        color: App.couleurs().texte(),
                        fontSize: App.fontSize().normal(),
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: App.couleurs().important(),
                      size: App.fontSize().icone(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
