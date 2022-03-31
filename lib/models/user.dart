class User {
  final String firstName;
  final String lastName;
  final String username;
  final String role;
  final String profileImageUrl;
  final int points;
  final String bio;
  final bool darkMode;

  User({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.role,
    required this.profileImageUrl,
    required this.points,
    required this.bio,
    required this.darkMode,
  });
}