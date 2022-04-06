class User {
  // so far only user attributes in the first section
  final String name;
  final String username;
  final String id;
  final String email;
  final int followers;
  final int following;
  final String password_hash;
  final String confirmation_sent_at;
  final String confirmed_at;
  final String confirmation_token;
  final String reset_password_token;
  final String reset_password_sent_at;
  final String avatar;
  final String role;
  final String bio;
  final bool darkMode;

  User({
    required this.username,
    required this.id,
    required this.name,
    required this.email,
    required this.followers,
    required this.following,
    required this.password_hash,
    required this.confirmation_sent_at,
    required this.confirmed_at,
    required this.confirmation_token,
    required this.reset_password_token,
    required this.reset_password_sent_at,
    required this.avatar,
    required this.role,
    required this.bio,
    required this.darkMode,
  });
}
