import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/templates/boutons/bouton.dart';

class EditeurApplication extends StatefulWidget {
  final String nom;
  final String route;
  final IconData icone;
  final Color iconeCouleur;
  final int total;

  EditeurApplication({
    required this.nom,
    required this.route,
    required this.icone,
    required this.iconeCouleur,
    required this.total,
  });

  @override
  State<EditeurApplication> createState() => _EditeurApplicationState();
}

class _EditeurApplicationState extends State<EditeurApplication> {
  void changerRoute(String route) => NavigationController.changerView(context, route);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: App.couleurs().fondSecondaire(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: Bouton(
          onTap: () => changerRoute(widget.route),
          couleurHover: App.couleurs().important().withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.nom,
                  style: TextStyle(
                    color: App.couleurs().texte(),
                    fontSize: App.fontSize().normal(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.total.toString(),
                      style: TextStyle(
                        color: App.couleurs().important(),
                        fontSize: App.fontSize().titre(),
                      ),
                    ),
                    Icon(
                      widget.icone,
                      size: App.fontSize().titre(),
                      color: widget.iconeCouleur,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
