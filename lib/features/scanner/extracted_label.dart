class ExtractedLabel {
  const ExtractedLabel({
    required this.fullText,
    required this.lines,
    this.suggestedName,
    this.suggestedBrand,
    this.suggestedModel,
    this.suggestedLot,
    this.suggestedExpiration,
  });

  final String fullText;
  final List<String> lines;
  final String? suggestedName;
  final String? suggestedBrand;
  final String? suggestedModel;
  final String? suggestedLot;
  final DateTime? suggestedExpiration;
}
