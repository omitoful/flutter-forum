import 'package:forumapp/models/post_model.dart';

class CommentModel {
  final int id;
  final int userId;
  final int feedId;
  final String body;
  final String createdAt;
  final String updatedAt;
  final PostModel feed;
  final User user;

  CommentModel({
    required this.id,
    required this.userId,
    required this.feedId,
    required this.body,
    required this.createdAt,
    required this.updatedAt,
    required this.feed,
    required this.user,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      userId: json['user_id'],
      feedId: json['feed_id'],
      body: json['body'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      feed: PostModel.fromJson(json['feed']),
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'feed_id': feedId,
      'body': body,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'feed': feed.toJson(),
      'user': user.toJson(),
    };
  }
}
