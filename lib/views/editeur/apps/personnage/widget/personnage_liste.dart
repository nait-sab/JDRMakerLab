import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/controllers/personnage_controller.dart';
import 'package:jdr_maker/models/personnage_model.dart';
import 'package:jdr_maker/templates/boutons/bouton.dart';

class PersonnageListe extends StatefulWidget {
  final List<PersonnageModel> personnages;

  PersonnageListe({
    required this.personnages,
  });

  @override
  State<PersonnageListe> createState() => _PersonnageListeState();
}

class _PersonnageListeState extends State<PersonnageListe> {
  Future modifier(PersonnageModel personnage) async {
    PersonnageController.changerPersonnage(context, personnage);
    NavigationController.changerView(context, "/editeur/personnage/vue");
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(widget.personnages.length, (index) {
            return Column(
              children: [
                SizedBox(height: 10),
                afficherPersonnage(widget.personnages[index]),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget afficherPersonnage(PersonnageModel personnage) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: App.couleurs().fondPrincipale(),
      ),
      child: Material(
        color: Colors.transparent,
        child: Bouton(
          onTap: () => modifier(personnage),
          borderRadius: BorderRadius.circular(10),
          couleurHover: Colors.white.withOpacity(0.2),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  personnage.nom,
                  style: TextStyle(
                    color: App.couleurs().important(),
                    fontSize: App.fontSize().normal(),
                  ),
                ),
                Text(
                  personnage.occupation,
                  style: TextStyle(
                    color: App.couleurs().important(),
                    fontSize: App.fontSize().normal(),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      personnage.dateModification,
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
