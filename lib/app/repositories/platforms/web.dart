import 'dart:convert';
import 'dart:html' as html;

Future<String> saveFile(String name, String content) async {
  final bytes = utf8.encode(content);
  final blob = html.Blob([bytes]);
  final url = html.Url.createObjectUrlFromBlob(blob);
  final anchor = html.document.createElement('a') as html.AnchorElement
    ..href = url
    ..style.display = 'none'
    ..download = name;
  html.document.body.children.add(anchor);

// download
  anchor.click();

// cleanup
  html.document.body.children.remove(anchor);
  html.Url.revokeObjectUrl(url);

  return name;
}

Future<String> selectFile([List<String> acceptedFormats]) async {
  final html.FileUploadInputElement input = html.FileUploadInputElement();
  input.click();
  await input.onChange.first;
  if (input.files.isEmpty) return null;
  if (acceptedFormats != null &&
      !acceptedFormats.contains(input.files.first.name.split('.').last)) {
    throw UnsupportedError('This file type is not supported');
  }
  final reader = html.FileReader();
  reader.readAsText(input.files[0]);
  await reader.onLoad.first;
  return reader.result;
}

void copyToClipboard(String text) {
  html.window.navigator.clipboard.writeText(text);
}
