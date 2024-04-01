

class FoodsPortionRemoteResult {
  final List<TopRecommendation> topRecommendations;

  FoodsPortionRemoteResult({required this.topRecommendations});

  factory FoodsPortionRemoteResult.fromJson(Map<String, dynamic> json) {
    return FoodsPortionRemoteResult(
      topRecommendations: (json['body'] as List<dynamic>)
          .map((recommendation) => TopRecommendation.fromJson(recommendation))
          .toList(),
    );
  }
}

class TopRecommendation {
  final double accuracy;
  final List<double> portion;
  final List<double> macro;

  TopRecommendation({required this.accuracy, required this.portion, required this.macro});

  factory TopRecommendation.fromJson(Map<String, dynamic> json) {
    List<dynamic> macroList = json['portion'];
    List<double> convertedPortion = macroList.map((item) {
      if (item is int) {
        return item.toDouble();
      } else if (item is double) {
        return item;
      } else {
        throw const FormatException('Invalid type in portion list');
      }
    }).toList();


    return TopRecommendation(
      accuracy: json['accuracy'],
      portion: convertedPortion,
      macro: List<double>.from(json['macro']),
    );
  }
}
