import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/templates/boutons/bouton.dart';

class AlerteDemander extends StatelessWidget {
  final String titre;
  final String description;
  final VoidCallback action;

  AlerteDemander({
    required this.titre,
    required this.description,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: MediaQuery.of(context).size.width * (Platform.isAndroid ? double.infinity : 0.5),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: App.couleurs().fondSecondaire(),
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titre,
                style: TextStyle(
                  fontSize: App.fontSize().sousTitre(),
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                description,
                style: TextStyle(
                  fontSize: App.fontSize().normal(),
                  color: App.couleurs().texte(),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Bouton(
                    onTap: () => Navigator.of(context, rootNavigator: true).pop(),
                    child: Text(
                      "Annuler",
                      style: TextStyle(
                        fontSize: App.fontSize().normal(),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Spacer(),
                  Bouton(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).pop();
                      action();
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: App.couleurs().violet(),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "Confirmer",
                        style: TextStyle(
                          fontSize: App.fontSize().normal(),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
