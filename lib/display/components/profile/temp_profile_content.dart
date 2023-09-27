class ProfileContent {
  final String image;
  final String name;
  final String userHandle;
  final String email;
  final String location;
  final int posts;
  final int followers;
  final int following;
  final int messages;
  final bool private;
  final bool premium;

  const ProfileContent({
    required this.image,
    required this.name,
    required this.userHandle,
    required this.email,
    required this.location,
    required this.posts,
    required this.followers,
    required this.following,
    required this.messages,
    required this.private,
    required this.premium,
  });
}
