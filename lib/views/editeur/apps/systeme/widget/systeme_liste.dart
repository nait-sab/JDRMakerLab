import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/controllers/systeme_controller.dart';
import 'package:jdr_maker/models/systeme_model.dart';
import 'package:jdr_maker/templates/boutons/bouton.dart';

class SystemeListe extends StatefulWidget {
  final List<SystemeModel> systemes;

  SystemeListe({
    required this.systemes,
  });

  @override
  State<SystemeListe> createState() => _SystemeListeState();
}

class _SystemeListeState extends State<SystemeListe> {
  Future modifier(SystemeModel systeme) async {
    SystemeController.changerSysteme(context, systeme);
    NavigationController.changerView(context, "/editeur/systeme/vue");
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(widget.systemes.length, (index) {
            return Column(
              children: [
                SizedBox(height: 10),
                afficherSysteme(widget.systemes[index]),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget afficherSysteme(SystemeModel systeme) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: App.couleurs().fondPrincipale(),
      ),
      child: Material(
        color: Colors.transparent,
        child: Bouton(
          onTap: () => modifier(systeme),
          borderRadius: BorderRadius.circular(10),
          couleurHover: Colors.white.withOpacity(0.2),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  systeme.nom,
                  style: TextStyle(
                    color: App.couleurs().important(),
                    fontSize: App.fontSize().normal(),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      systeme.dateModification,
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
