import 'package:flutter/material.dart';
import 'package:jdr_maker/controllers/projet_controller.dart';
import 'package:jdr_maker/interface/app_interface.dart';
import 'package:jdr_maker/views/explorer/widgets/explorer_info.dart';
import 'package:provider/provider.dart';

class ExplorerView extends StatefulWidget {
  @override
  State<ExplorerView> createState() => _ExplorerViewState();
}

class _ExplorerViewState extends State<ExplorerView> {
  late ProjetController projetController;

  @override
  Widget build(BuildContext context) {
    projetController = Provider.of<ProjetController>(context);

    return AppInterface(
      child: Container(
        height: double.infinity,
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ExplorerInfo(
                projets: projetController.projets,
                projetActuel: projetController.projet,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
