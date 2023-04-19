import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';

class EditeurInfo extends StatefulWidget {
  @override
  State<EditeurInfo> createState() => _EditeurInfoState();
}

class _EditeurInfoState extends State<EditeurInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: App.couleurs().fondSecondaire(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          "Votre projet ne contient aucun élément, créer votre premier à l'aide des applications",
          style: TextStyle(
            color: App.couleurs().texte(),
            fontSize: App.fontSize().normal(),
          ),
        ),
      ),
    );
  }
}
