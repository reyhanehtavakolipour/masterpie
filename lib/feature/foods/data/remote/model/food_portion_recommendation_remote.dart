

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
    return TopRecommendation(
      accuracy: json['accuracy'],
      portion: List<double>.from(json['portion']),
      macro: List<double>.from(json['macro']),
    );
  }
}
