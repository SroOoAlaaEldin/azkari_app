class AzkarModel {
  final String title;
  final List<String> texts;
  final String image;

  AzkarModel({required this.title, required this.texts, required this.image});

  factory AzkarModel.fromJson(Map<String, dynamic> json) {
    return AzkarModel(
      title: json['title'],
      texts: List<String>.from(json['texts']),
      image: json['image'],
    );
  }
}
