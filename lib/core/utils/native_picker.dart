// The Flutter equivalent of <input type="file">
import 'dart:io';

import 'package:file_picker/file_picker.dart';

final List<String> _imageExt = ["jpg", "jpeg", "png", "heif", 'avif'];

Future<File?> imagePicker() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: _imageExt,
  );

  if (result != null) {
    return File(result.files.single.path!);
  } else {
    // User canceled the picker
    return null;
  }
}

void mediaPicker() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.media,
  );

  if (result != null) {
    File file = File(result.files.single.path!);
    print("Selected file: ${file.path}");
  } else {
    // User canceled the picker
  }
}
