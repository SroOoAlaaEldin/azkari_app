class SwarModel {
  final String title;
  final List<String> swar;
  final String audio;

  const SwarModel({
    required this.title,
    required this.swar,
    required this.audio,
  });
  factory SwarModel.fromJson(Map<String, dynamic> json) {
    return SwarModel(
      title: json['title'],
      swar: List<String>.from(json['swar']),
      audio: json['audio'],
    );
  }
}
