import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/templates/boutons/bouton.dart';

class ProfilParametreBouton extends StatefulWidget {
  final String nom;
  final VoidCallback action;

  ProfilParametreBouton({
    required this.nom,
    required this.action,
  });

  @override
  State<ProfilParametreBouton> createState() => _ProfilParametreBoutonState();
}

class _ProfilParametreBoutonState extends State<ProfilParametreBouton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: App.couleurs().fondSecondaire(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: Bouton(
          onTap: widget.action,
          couleurHover: App.couleurs().important().withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              children: [
                Text(
                  widget.nom,
                  style: TextStyle(
                    color: App.couleurs().important(),
                    fontSize: App.fontSize().normal(),
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.navigate_next_rounded,
                  color: App.couleurs().important(),
                  size: App.fontSize().icone(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
