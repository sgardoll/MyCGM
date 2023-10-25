// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:image_editor_plus/image_editor_plus.dart';

Future<FFUploadedFile?> cropImage(
  BuildContext context,
  FFUploadedFile img,
) async {
  final Uint8List imageData = img.bytes!;

  var editedImage = await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ImageCropper(
        image: imageData,
      ),
    ),
  );

  if (editedImage != null) {
    // Create a new FFUploadedFile with the edited image data
    final editedFFUploadedFile = FFUploadedFile(
      name: img.name,
      bytes: editedImage,
      height: img.height,
      width: img.width,
      blurHash: img.blurHash,
    );

    // Return the edited image as FFUploadedFile
    return editedFFUploadedFile;
  }

  return null; // Return null if the image was not edited or saved
}

// DO NOT REMOVE OR MODIFY THE CODE BELOW!
