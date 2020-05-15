import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:path_provider/path_provider.dart';

Future<String> saveFile(String name, String content) async {
  final path = await getApplicationDocumentsDirectory();
  final file = File(path.path + '/' + name);
  await file.writeAsString(content);

  final filePath = await FlutterFileDialog.saveFile(
    params: SaveFileDialogParams(
      sourceFilePath: file.path,
    ),
  );

  return filePath;
}

Future<String> selectFile([List<String> acceptedFormats]) async {
  final filePath = await FlutterFileDialog.pickFile(
    params: OpenFileDialogParams(
      dialogType: OpenFileDialogType.document,
    ),
  );

  if (filePath == null) return null;

  if (acceptedFormats != null &&
      !acceptedFormats.contains(filePath?.split('.')?.last)) {
    throw UnsupportedError('This file type is not supported');
  }

  final file = File(filePath);
  return file.readAsString();
}

void copyToClipboard(String text) {
  Clipboard.setData(ClipboardData(text: text));
}
