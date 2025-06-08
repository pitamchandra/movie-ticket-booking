class FacebookUser {
  final String name;
  final String email;
  final String id;
  final String profilePic;

  FacebookUser({
    required this.name,
    required this.email,
    required this.id,
    required this.profilePic,
  });

  factory FacebookUser.fromJson(Map<String, dynamic> json) {
    return FacebookUser(
      name: json['name'],
      email: json['email'],
      id: json['id'],
      profilePic: json['picture']['data']['url'],
    );
  }
}
