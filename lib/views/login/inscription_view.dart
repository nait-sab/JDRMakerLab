import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/interface/app_interface.dart';
import 'package:jdr_maker/views/login/widgets/inscription_formulaire.dart';

/// Classe Inscription
///
/// Type : View
///
/// Page d'inscription de l'application
class InscriptionView extends StatefulWidget {
  @override
  State<InscriptionView> createState() => _InscriptionViewState();
}

class _InscriptionViewState extends State<InscriptionView> {
  void changerRoute(String route) => NavigationController.changerView(context, route);

  @override
  Widget build(BuildContext context) {
    return AppInterface(
      child: Platform.isAndroid ? renduAndroid() : renduDesktop(),
    );
  }

  Widget renduAndroid() {
    return Container();
  }

  Widget renduDesktop() {
    return Row(
      children: [
        Expanded(
          child: Stack(
            children: [
              SizedBox(
                height: double.infinity,
                child: Image.asset(
                  "assets/img/login.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Version ${dotenv.get("APP_VERSION")}",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: App.fontSize().chargement(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: SizedBox(
              height: double.infinity,
              child: InscriptionFormulaire(),
            ),
          ),
        ),
      ],
    );
  }
}
