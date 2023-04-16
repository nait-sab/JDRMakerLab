import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jdr_maker/firebase/firebase_service_storage.dart';
import 'package:jdr_maker/interface/app_interface.dart';
import 'package:jdr_maker/templates/boutons/bouton.dart';
import 'package:jdr_maker/tools/image_tool.dart';

class ExplorerView extends StatefulWidget {
  @override
  State<ExplorerView> createState() => _ExplorerViewState();
}

class _ExplorerViewState extends State<ExplorerView> {
  Future import() async {
    File? image = await ImageTool.choisirImage();

    if (image != null) {
      await FirebaseServiceStorage.importer(image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppInterface(
      child: Container(
        margin: EdgeInsets.all(20),
        color: Colors.amber,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Bouton(
              onTap: import,
              child: Container(
                width: 300,
                color: Colors.red,
                child: Center(
                  child: Text("Importer"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
