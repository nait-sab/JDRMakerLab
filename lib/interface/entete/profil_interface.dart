import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/templates/boutons/bouton.dart';

class ProfilInterface extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Bouton(
      onTap: () => NavigationController.changerView(context, "/profil"),
      borderRadius: BorderRadius.circular(50),
      child: Ink(
        width: 200,
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
            ),
            SizedBox(width: 10),
            Flexible(
              child: Text(
                "Albert",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: App.fontSize().normal(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
