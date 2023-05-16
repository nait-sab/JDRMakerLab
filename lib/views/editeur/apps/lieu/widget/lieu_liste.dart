import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/lieu_controller.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/models/lieu_model.dart';
import 'package:jdr_maker/templates/boutons/bouton.dart';

class LieuListe extends StatefulWidget {
  final List<LieuModel> lieux;

  LieuListe({
    required this.lieux,
  });

  @override
  State<LieuListe> createState() => _LieuListeState();
}

class _LieuListeState extends State<LieuListe> {
  Future modifier(LieuModel lieu) async {
    LieuController.changerLieu(context, lieu);
    NavigationController.changerView(context, "/editeur/lieu/modifier");
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(widget.lieux.length, (index) {
            return Column(
              children: [
                SizedBox(height: 10),
                afficherLieu(widget.lieux[index]),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget afficherLieu(LieuModel lieu) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: App.couleurs().fondPrincipale(),
      ),
      child: Material(
        color: Colors.transparent,
        child: Bouton(
          onTap: () => modifier(lieu),
          borderRadius: BorderRadius.circular(10),
          couleurHover: Colors.white.withOpacity(0.2),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  lieu.nom,
                  style: TextStyle(
                    color: App.couleurs().important(),
                    fontSize: App.fontSize().normal(),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      lieu.dateModification,
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
