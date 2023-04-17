import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/interface/app_interface.dart';

class JouerView extends StatefulWidget {
  @override
  State<JouerView> createState() => _JouerViewState();
}

class _JouerViewState extends State<JouerView> {
  @override
  Widget build(BuildContext context) {
    return AppInterface(
      child: Container(
        margin: EdgeInsets.all(20),
        color: Colors.amber,
        child: Center(
          child: Text(
            "Jouer",
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
