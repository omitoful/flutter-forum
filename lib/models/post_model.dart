class PostModel {
  final int id;
  final int userId;
  final String content;
  final String createdAt;
  final String updatedAt;
  final bool liked;
  final User? user;

  PostModel({
    required this.id,
    required this.userId,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.liked,
    this.user,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      userId: json['user_id'],
      content: json['content'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      liked: json['liked'] ?? false,
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'content': content,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'liked': liked,
      'user': user?.toJson(),
    };
  }
}

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final String? emailVerifiedAt;
  final String createdAt;
  final String updatedAt;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'email_verified_at': emailVerifiedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
