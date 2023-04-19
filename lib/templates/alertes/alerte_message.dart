import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/templates/boutons/bouton.dart';

class AlerteMessage extends StatelessWidget {
  final String titre;
  final String texte;

  AlerteMessage({
    required this.titre,
    required this.texte,
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
          borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titre,
                style: TextStyle(
                  fontSize: App.fontSize().normal() + 2,
                  fontWeight: FontWeight.bold,
                  color: App.couleurs().important(),
                ),
              ),
              SizedBox(height: 10),
              Text(
                texte,
                style: TextStyle(
                  fontSize: App.fontSize().normal(),
                  color: App.couleurs().texte(),
                ),
              ),
              SizedBox(height: 20),
              Bouton(
                onTap: () => Navigator.of(context, rootNavigator: true).pop(),
                child: Center(
                  child: Text(
                    "Fermer",
                    style: TextStyle(
                      fontSize: App.fontSize().normal(),
                      fontWeight: FontWeight.bold,
                      color: App.couleurs().violet(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
