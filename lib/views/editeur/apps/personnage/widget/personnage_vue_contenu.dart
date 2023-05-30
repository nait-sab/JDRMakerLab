import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/models/personnage_model.dart';
import 'package:jdr_maker/views/editeur/apps/personnage/widget/personnage_image.dart';

class PersonnageVueContenu extends StatelessWidget {
  final PersonnageModel personnage;

  PersonnageVueContenu({
    required this.personnage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 150,
                  width: 180,
                  child: PersonnageImage(
                    modifiable: false,
                    isIcone: true,
                    urlIcone: personnage.urlIcone,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nom",
                        style: TextStyle(
                          color: App.couleurs().important(),
                          fontSize: App.fontSize().normal(),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        personnage.nom,
                        style: TextStyle(
                          color: App.couleurs().texte(),
                          fontSize: App.fontSize().normal(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 430,
                  width: 180,
                  child: PersonnageImage(
                    modifiable: false,
                    isIcone: false,
                    urlIcone: personnage.urlImage,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      blocOccupation(),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(child: blocAge()),
                          SizedBox(width: 20),
                          Expanded(child: blocTaille()),
                          SizedBox(width: 20),
                          Expanded(child: blocPoids()),
                        ],
                      ),
                      blocDescription(),
                      blocHistoire(),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget blocOccupation() {
    if (personnage.occupation.isEmpty) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Occupation",
          style: TextStyle(
            color: App.couleurs().important(),
            fontSize: App.fontSize().normal(),
          ),
        ),
        SizedBox(height: 5),
        Text(
          personnage.occupation,
          style: TextStyle(
            color: App.couleurs().texte(),
            fontSize: App.fontSize().normal(),
          ),
        ),
      ],
    );
  }

  Widget blocAge() {
    if (personnage.age.isEmpty) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Age",
          style: TextStyle(
            color: App.couleurs().important(),
            fontSize: App.fontSize().normal(),
          ),
        ),
        SizedBox(height: 5),
        Text(
          personnage.age,
          style: TextStyle(
            color: App.couleurs().texte(),
            fontSize: App.fontSize().normal(),
          ),
        ),
      ],
    );
  }

  Widget blocTaille() {
    if (personnage.taille.isEmpty) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Taille",
          style: TextStyle(
            color: App.couleurs().important(),
            fontSize: App.fontSize().normal(),
          ),
        ),
        SizedBox(height: 5),
        Text(
          personnage.taille,
          style: TextStyle(
            color: App.couleurs().texte(),
            fontSize: App.fontSize().normal(),
          ),
        ),
      ],
    );
  }

  Widget blocPoids() {
    if (personnage.poids.isEmpty) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Poids",
          style: TextStyle(
            color: App.couleurs().important(),
            fontSize: App.fontSize().normal(),
          ),
        ),
        SizedBox(height: 5),
        Text(
          personnage.poids,
          style: TextStyle(
            color: App.couleurs().texte(),
            fontSize: App.fontSize().normal(),
          ),
        ),
      ],
    );
  }

  Widget blocDescription() {
    if (personnage.description.isEmpty) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          "Description",
          style: TextStyle(
            color: App.couleurs().important(),
            fontSize: App.fontSize().normal(),
          ),
        ),
        SizedBox(height: 5),
        Text(
          personnage.description,
          style: TextStyle(
            color: App.couleurs().texte(),
            fontSize: App.fontSize().normal(),
          ),
        ),
      ],
    );
  }

  Widget blocHistoire() {
    if (personnage.histoire.isEmpty) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          "Histoire",
          style: TextStyle(
            color: App.couleurs().important(),
            fontSize: App.fontSize().normal(),
          ),
        ),
        SizedBox(height: 5),
        Text(
          personnage.histoire,
          style: TextStyle(
            color: App.couleurs().texte(),
            fontSize: App.fontSize().normal(),
          ),
        ),
      ],
    );
  }
}
