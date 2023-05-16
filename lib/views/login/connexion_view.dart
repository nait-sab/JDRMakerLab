import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/interface/app_interface.dart';
import 'package:jdr_maker/views/login/widgets/connexion_formulaire.dart';

/// Classe Connexion
///
/// Type : View
///
/// Page de connexion de l'application
class ConnexionView extends StatefulWidget {
  @override
  State<ConnexionView> createState() => _ConnexionViewState();
}

class _ConnexionViewState extends State<ConnexionView> {
  @override
  Widget build(BuildContext context) {
    return AppInterface(
      child: renduDesktop(),
    );
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
              child: ConnexionFormulaire(),
            ),
          ),
        ),
      ],
    );
  }
}
