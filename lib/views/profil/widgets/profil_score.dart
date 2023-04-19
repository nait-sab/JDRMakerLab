import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';

class ProfilScore extends StatefulWidget {
  final String nom;
  final IconData icone;
  final Color iconeCouleur;
  final int total;

  ProfilScore({
    required this.nom,
    required this.icone,
    required this.iconeCouleur,
    required this.total,
  });

  @override
  State<ProfilScore> createState() => _ProfilScoreState();
}

class _ProfilScoreState extends State<ProfilScore> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: App.couleurs().fondSecondaire(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                    color: Colors.white,
                    fontSize: App.fontSize().titre(),
                  ),
                ),
                Icon(
                  widget.icone,
                  size: App.fontSize().titre(),
                  color: widget.iconeCouleur,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
