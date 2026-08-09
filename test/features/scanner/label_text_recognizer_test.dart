import 'package:carecache/features/scanner/label_text_recognizer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('turns synthetic OCR text into reviewable label suggestions', () {
    final label = parseRecognizedLabel('''
DreamAir Filter
Northstar Health
MODEL: NF-200
LOT: SAMPLE-42
EXP: 08/31/2028
''');

    expect(label.suggestedName, 'DreamAir Filter');
    expect(label.suggestedBrand, 'Northstar Health');
    expect(label.suggestedModel, 'NF-200');
    expect(label.suggestedLot, 'SAMPLE-42');
    expect(label.suggestedExpiration, DateTime(2028, 8, 31));
  });
}
