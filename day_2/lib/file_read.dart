import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:path/path.dart' as path;

Future<List<String>> readFile() async {
  var allLines = <String>[];
  const relativeFile = '../raw_data/inputs.txt';

  var context = path.Context(style: path.Style.platform);
  var baseDir = path.dirname(Platform.script.path);
  var filePath = context.join(baseDir, relativeFile);
  filePath = context.fromUri(context.normalize(filePath));

  await File(filePath)
    .openRead()
    .transform(utf8.decoder)
    .transform(LineSplitter())
    .forEach((line) { allLines.add(line); });
  return allLines;
}
