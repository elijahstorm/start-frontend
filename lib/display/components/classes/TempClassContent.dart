class ClassContent {
  final String image;
  final String title;
  final String group;
  final List<String> tags;
  final int timeLength;
  final int likes;
  final int ranking;
  final bool locked;

  const ClassContent({
    required this.image,
    required this.title,
    required this.group,
    required this.tags,
    required this.timeLength,
    required this.likes,
    required this.ranking,
    this.locked = false,
  });
}
