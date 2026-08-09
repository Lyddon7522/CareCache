import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import 'extracted_label.dart';

final class LabelTextRecognizer {
  LabelTextRecognizer({ImagePicker? imagePicker}) : _imagePicker = imagePicker ?? ImagePicker();

  static const _channel = MethodChannel('com.vector42.carecache/label_text');
  static const _modelAsset = 'assets/tessdata/eng.traineddata';
  static const _modelDigest = '7d4322bd2a7749724879683fc3912cb542f19906c83bcc1a52132556427170b2';

  final ImagePicker _imagePicker;

  Future<ExtractedLabel?> capture() async {
    final image = await _imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 90,
      maxWidth: 2400,
    );
    if (image == null) {
      return null;
    }
    final tessDataPath = Platform.isAndroid ? await _ensureAndroidModel() : '';
    final text = await _channel.invokeMethod<String>('recognizeText', <String, String>{
      'imagePath': image.path,
      'tessDataPath': tessDataPath,
    });
    if (text == null || text.trim().isEmpty) {
      throw StateError('No label text was recognized.');
    }
    return parseRecognizedLabel(text);
  }

  Future<String> _ensureAndroidModel() async {
    final support = await getApplicationSupportDirectory();
    final root = Directory(path.join(support.path, 'ocr'));
    final tessData = Directory(path.join(root.path, 'tessdata'));
    await tessData.create(recursive: true);

    final model = File(path.join(tessData.path, 'eng.traineddata'));
    final hasCurrentModel = model.existsSync() && await _digest(model) == _modelDigest;
    if (!hasCurrentModel) {
      final bytes = await rootBundle.load(_modelAsset);
      final pending = File('${model.path}.pending');
      await pending.writeAsBytes(
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes),
        flush: true,
      );
      if (model.existsSync()) {
        await model.delete();
      }
      await pending.rename(model.path);
    }
    return root.path;
  }
}

Future<String> _digest(File file) async => (await sha256.bind(file.openRead()).first).toString();

ExtractedLabel parseRecognizedLabel(String text) {
  final lines = text
      .split(RegExp(r'[\r\n]+'))
      .map((line) => line.trim())
      .where((line) => line.isNotEmpty)
      .toList(growable: false);
  return ExtractedLabel(
    fullText: text.trim(),
    lines: lines,
    suggestedName: _suggestName(lines),
    suggestedBrand: lines.length > 1 ? lines[1] : null,
    suggestedModel: _matchValue(
      lines,
      RegExp(r'^(?:MODEL|REF|ITEM)\s*[:#-]?\s*(.+)$', caseSensitive: false),
    ),
    suggestedLot: _matchValue(lines, RegExp(r'^LOT\s*[:#-]?\s*(.+)$', caseSensitive: false)),
    suggestedExpiration: _suggestExpiration(lines),
  );
}

String? _suggestName(List<String> lines) {
  for (final line in lines) {
    if (line.length >= 3 && !RegExp(r'^\d{8,}$').hasMatch(line.replaceAll(' ', ''))) {
      return line;
    }
  }
  return null;
}

String? _matchValue(List<String> lines, RegExp pattern) {
  for (final line in lines) {
    final match = pattern.firstMatch(line);
    if (match != null) {
      return match.group(1)?.trim();
    }
  }
  return null;
}

DateTime? _suggestExpiration(List<String> lines) {
  final pattern = RegExp(
    r'(?:EXP|EXPIRES|EXPIRATION)\D*(\d{1,2})[/-](\d{1,2})(?:[/-](\d{2,4}))?',
    caseSensitive: false,
  );
  for (final line in lines) {
    final match = pattern.firstMatch(line);
    if (match == null) {
      continue;
    }
    final first = int.tryParse(match.group(1)!);
    final second = int.tryParse(match.group(2)!);
    final rawYear = int.tryParse(match.group(3) ?? '');
    if (first == null || second == null) {
      continue;
    }
    final year = rawYear == null
        ? DateTime.now().year
        : rawYear < 100
        ? 2000 + rawYear
        : rawYear;
    final month = first <= 12 ? first : second;
    final day = first <= 12 ? second : first;
    final result = DateTime(year, month, day);
    if (result.year == year && result.month == month && result.day == day) {
      return result;
    }
  }
  return null;
}
