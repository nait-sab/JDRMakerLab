import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/templates/banniere_info.dart';

class EditeurInfo extends StatefulWidget {
  @override
  State<EditeurInfo> createState() => _EditeurInfoState();
}

class _EditeurInfoState extends State<EditeurInfo> {
  @override
  Widget build(BuildContext context) {
    return BanniereInfo(
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
