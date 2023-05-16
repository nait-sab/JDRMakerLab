import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/templates/boutons/bouton.dart';

class LieuListeEntete extends StatefulWidget {
  @override
  State<LieuListeEntete> createState() => _LieuListeEnteteState();
}

class _LieuListeEnteteState extends State<LieuListeEntete> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: App.couleurs().fondPrincipale(),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                "Nom",
                style: TextStyle(
                  color: App.couleurs().texte(),
                  fontSize: App.fontSize().normal(),
                ),
              ),
              SizedBox(width: 10),
              Column(
                children: [
                  boutonTri(
                    Icons.expand_less_rounded,
                    false,
                    () {},
                  ),
                  boutonTri(
                    Icons.expand_more_rounded,
                    false,
                    () {},
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Dernière modification",
                style: TextStyle(
                  color: App.couleurs().texte(),
                  fontSize: App.fontSize().normal(),
                ),
              ),
              SizedBox(width: 10),
              Column(
                children: [
                  boutonTri(
                    Icons.expand_less_rounded,
                    false,
                    () {},
                  ),
                  boutonTri(
                    Icons.expand_more_rounded,
                    true,
                    () {},
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget boutonTri(IconData icone, bool actif, VoidCallback action) {
    return Material(
      color: Colors.transparent,
      child: Bouton(
        onTap: action,
        child: Icon(
          icone,
          color: actif ? App.couleurs().important() : App.couleurs().texte(),
          size: App.fontSize().icone(),
        ),
      ),
    );
  }
}
