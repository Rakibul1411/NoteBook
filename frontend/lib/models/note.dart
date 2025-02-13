class Note {
  final String id;
  final String userId;
  final String title;
  final String content;

  Note({
    required this.id,
    required this.userId,
    required this.title,
    required this.content,
  });

  // From JSON to Note model
  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      content: json['content'],
    );
  }

  // Convert Note model to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'content': content,
    };
  }
}