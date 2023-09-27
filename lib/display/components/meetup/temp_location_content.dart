class LocationContent {
  final String image;
  final String title;
  final String location;
  final String date;
  final String time;
  final List<String> tags;
  final int likes;
  final bool liked;

  const LocationContent({
    required this.image,
    required this.title,
    required this.tags,
    required this.location,
    required this.date,
    required this.time,
    required this.likes,
    this.liked = false,
  });
}
