import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/templates/boutons/bouton.dart';

class PersonnageListeEntete extends StatefulWidget {
  final VoidCallback triAscNom;
  final VoidCallback triAscOccupation;
  final VoidCallback triAscDate;
  final VoidCallback triDescNom;
  final VoidCallback triDescOccupation;
  final VoidCallback triDescDate;

  final bool isTriAscNom;
  final bool isTriAscOccupation;
  final bool isTriAscDate;
  final bool isTriDescNom;
  final bool isTriDescOccupation;
  final bool isTriDescDate;

  PersonnageListeEntete({
    required this.triAscNom,
    required this.triAscOccupation,
    required this.triAscDate,
    required this.triDescNom,
    required this.triDescOccupation,
    required this.triDescDate,
    required this.isTriAscNom,
    required this.isTriAscOccupation,
    required this.isTriAscDate,
    required this.isTriDescNom,
    required this.isTriDescOccupation,
    required this.isTriDescDate,
  });

  @override
  State<PersonnageListeEntete> createState() => _PersonnageListeEnteteState();
}

class _PersonnageListeEnteteState extends State<PersonnageListeEntete> {
  @override
  void initState() {
    super.initState();
  }

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
                    widget.isTriDescNom,
                    widget.triDescNom,
                  ),
                  boutonTri(
                    Icons.expand_more_rounded,
                    widget.isTriAscNom,
                    widget.triAscNom,
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Occupation",
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
                    widget.isTriDescOccupation,
                    widget.triDescOccupation,
                  ),
                  boutonTri(
                    Icons.expand_more_rounded,
                    widget.isTriAscOccupation,
                    widget.triAscOccupation,
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
                    widget.isTriDescDate,
                    widget.triDescDate,
                  ),
                  boutonTri(
                    Icons.expand_more_rounded,
                    widget.isTriAscDate,
                    widget.triAscDate,
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
