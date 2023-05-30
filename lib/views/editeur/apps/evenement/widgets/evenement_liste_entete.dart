import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/templates/boutons/bouton.dart';

class EvenementListeEntete extends StatefulWidget {
  final VoidCallback triAscNumero;
  final VoidCallback triAscNom;
  final VoidCallback triAscDate;
  final VoidCallback triDescNumero;
  final VoidCallback triDescNom;
  final VoidCallback triDescDate;

  final bool isTriAscNumero;
  final bool isTriAscNom;
  final bool isTriAscDate;
  final bool isTriDescNumero;
  final bool isTriDescNom;
  final bool isTriDescDate;

  EvenementListeEntete({
    required this.triAscNumero,
    required this.triAscNom,
    required this.triAscDate,
    required this.triDescNumero,
    required this.triDescNom,
    required this.triDescDate,
    required this.isTriAscNumero,
    required this.isTriAscNom,
    required this.isTriAscDate,
    required this.isTriDescNumero,
    required this.isTriDescNom,
    required this.isTriDescDate,
  });

  @override
  State<EvenementListeEntete> createState() => _EvenementListeEnteteState();
}

class _EvenementListeEnteteState extends State<EvenementListeEntete> {
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
                "N°",
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
                    widget.isTriDescNumero,
                    widget.triDescNumero,
                  ),
                  boutonTri(
                    Icons.expand_more_rounded,
                    widget.isTriAscNumero,
                    widget.triAscNumero,
                  ),
                ],
              ),
              SizedBox(width: 20),
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
