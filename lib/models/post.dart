class Post {
  final int userId;
  final int Id;
  final String title;
  final String body;

  Post({
    required this.userId,
    required this.Id,
    required this.title,
    required this.body,
  });

  factory Post.fromMap(Map<String, dynamic> Data) {
    return Post(
      userId: Data["userId"],
      Id: Data["Id"],
      title: Data["title"],
      body: Data["body"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "userId": userId,
      // "Id": Id,
      "title": title,
      "body": body,
    };
  }
}
