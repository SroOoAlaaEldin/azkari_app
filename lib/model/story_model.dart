class StoryModel {
  final String title;
  final String desp;
  final String pdf;

  const StoryModel({
    required this.title,
    required this.pdf,
    required this.desp,
  });
  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(
      title: json['title'],

      desp: json['desp'],
      pdf: json['pdf'],
    );
  }
}
