import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/templates/boutons/bouton.dart';

class JouerSalle extends StatefulWidget {
  final String nom;
  final String createur;
  final int total;

  JouerSalle({
    required this.nom,
    required this.createur,
    required this.total,
  });

  @override
  State<JouerSalle> createState() => _JouerSalleState();
}

class _JouerSalleState extends State<JouerSalle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: App.couleurs().fondSecondaire(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: Bouton(
          onTap: () {},
          couleurHover: App.couleurs().important().withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.nom,
                  style: TextStyle(
                    color: App.couleurs().important(),
                    fontSize: App.fontSize().sousTitre(),
                  ),
                ),
                Text(
                  widget.nom,
                  style: TextStyle(
                    color: App.couleurs().texte(),
                    fontSize: App.fontSize().normal(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.total.toString(),
                      style: TextStyle(
                        color: App.couleurs().important(),
                        fontSize: App.fontSize().titre(),
                      ),
                    ),
                    Icon(
                      Icons.group_rounded,
                      size: App.fontSize().titre(),
                      color: App.couleurs().important(),
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
