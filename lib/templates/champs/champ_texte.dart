import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:jdr_maker/config/app.dart';

class ChampTexte extends StatefulWidget {
  final QuillController controller;
  final bool modifiable;

  ChampTexte({
    required this.controller,
    required this.modifiable,
  });

  @override
  State<ChampTexte> createState() => _ChampTexteState();
}

class _ChampTexteState extends State<ChampTexte> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: App.couleurs().fondPrincipale(),
        border: Border.all(color: App.couleurs().texte(), width: 3),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          entete(),
          separateur(),
          QuillEditor(
            controller: widget.controller,
            readOnly: !widget.modifiable,
            focusNode: FocusNode(canRequestFocus: widget.modifiable),
            scrollController: ScrollController(),
            scrollable: true,
            expands: false,
            padding: EdgeInsets.all(10),
            autoFocus: false,
            customStyles: DefaultStyles(
              sizeSmall: TextStyle(
                color: App.couleurs().texte(),
                fontSize: App.fontSize().normal(),
              ),
              sizeLarge: TextStyle(
                color: App.couleurs().texte(),
                fontSize: App.fontSize().sousTitre(),
              ),
              sizeHuge: TextStyle(
                color: App.couleurs().texte(),
                fontSize: App.fontSize().titre(),
              ),
              paragraph: DefaultListBlockStyle(
                TextStyle(
                  color: App.couleurs().texte(),
                  fontSize: App.fontSize().normal(),
                ),
                VerticalSpacing(2, 0),
                VerticalSpacing(0, 0),
                null,
                null,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget separateur() {
    if (!widget.modifiable) {
      return Container();
    }

    return Container(
      width: double.infinity,
      height: 3,
      color: App.couleurs().texte(),
    );
  }

  Widget entete() {
    if (!widget.modifiable) {
      return Container();
    }

    return Container(
      padding: EdgeInsets.all(5),
      width: double.infinity,
      child: QuillToolbar.basic(
        controller: widget.controller,
        showInlineCode: false,
        showSearchButton: false,
        showLink: false,
        showCodeBlock: false,
        showFontFamily: false,
        showSuperscript: false,
        showSubscript: false,
        showBackgroundColorButton: false,
        showHeaderStyle: false,
        showQuote: false,
        locale: Locale('fr'),
        toolbarIconSize: App.fontSize().normal(),
        iconTheme: QuillIconTheme(
          borderRadius: 10,
          iconSelectedFillColor: App.couleurs().violet(),
          iconSelectedColor: Colors.white,
        ),
      ),
    );
  }
}
