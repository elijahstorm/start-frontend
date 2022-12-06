class DancePlayContent {
  final List<String> images;
  final String title;
  final List<String> tags;
  final int songAmount;
  final int likes;
  final bool locked;

  const DancePlayContent({
    required this.images,
    required this.title,
    required this.tags,
    required this.songAmount,
    required this.likes,
    this.locked = false,
  }) : assert(images.length >= 4);
}
