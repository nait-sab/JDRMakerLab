import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/interface/app_interface.dart';

class ExplorerView extends StatefulWidget {
  @override
  State<ExplorerView> createState() => _ExplorerViewState();
}

class _ExplorerViewState extends State<ExplorerView> {
  @override
  Widget build(BuildContext context) {
    return AppInterface(
      child: Container(
        margin: EdgeInsets.all(20),
        color: Colors.amber,
        child: Center(
          child: Text(
            "Explorer",
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
