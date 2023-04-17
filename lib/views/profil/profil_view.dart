import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/interface/app_interface.dart';

class ProfilView extends StatefulWidget {
  @override
  State<ProfilView> createState() => _ProfilViewState();
}

class _ProfilViewState extends State<ProfilView> {
  @override
  Widget build(BuildContext context) {
    return AppInterface(
      child: Container(
        margin: EdgeInsets.all(20),
        color: Colors.amber,
        child: Center(
          child: Text(
            "Profil",
            style: TextStyle(
              color: Colors.white,
              fontSize: App.fontSize().titre(),
            ),
          ),
        ),
      ),
    );
  }
}
