class comments {
  final int id;
  final String name;
  final String email;
  final String body;

  comments({
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory comments.fromMap(Map<String, dynamic> data) {
    return comments(
      id: data["id"],
      name: data["name"],
      email: data["email"],
      body: data["body"],
    );
  }
}
