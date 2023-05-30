import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/evenement_controller.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/models/evenement_model.dart';
import 'package:jdr_maker/templates/boutons/bouton.dart';

class EvenementListe extends StatefulWidget {
  final List<EvenementModel> evenements;

  EvenementListe({
    required this.evenements,
  });

  @override
  State<EvenementListe> createState() => _EvenementListeState();
}

class _EvenementListeState extends State<EvenementListe> {
  Future modifier(EvenementModel evenement) async {
    EvenementController.changerEvenement(context, evenement);
    NavigationController.changerView(context, "/editeur/evenement/vue");
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(widget.evenements.length, (index) {
            return Column(
              children: [
                SizedBox(height: 10),
                afficherEvenement(widget.evenements[index]),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget afficherEvenement(EvenementModel evenement) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: App.couleurs().fondPrincipale(),
      ),
      child: Material(
        color: Colors.transparent,
        child: Bouton(
          onTap: () => modifier(evenement),
          borderRadius: BorderRadius.circular(10),
          couleurHover: Colors.white.withOpacity(0.2),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      evenement.numero,
                      style: TextStyle(
                        color: App.couleurs().important(),
                        fontSize: App.fontSize().normal(),
                      ),
                    ),
                    SizedBox(width: 20),
                    Text(
                      evenement.nom,
                      style: TextStyle(
                        color: App.couleurs().important(),
                        fontSize: App.fontSize().normal(),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      evenement.dateModification,
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
