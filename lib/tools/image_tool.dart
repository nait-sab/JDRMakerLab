import 'dart:io';

import 'package:file_picker/file_picker.dart';

/// Classe : Image
///
/// Type : Tool
///
/// Importer une image avec les réglages nécéssaire
class ImageTool {
  /// Importer une image avec les réglages nécéssaire
  static Future<File?> choisirImage() async {
    FilePickerResult? selection = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ["jpg", "png"],
    );

    return selection != null ? File(selection.files.single.path!) : null;
  }
}
