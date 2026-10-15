import 'package:flutter/material.dart';
import 'package:forumapp/models/post_model.dart';

class PostData extends StatelessWidget {
  const PostData({super.key, required this.post});
  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(post.user.username),
          Text(post.user.email),
          SizedBox(height: 10),
          Text(post.content),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.thumb_up)),
              IconButton(onPressed: () {}, icon: Icon(Icons.message)),
            ],
          ),
        ],
      ),
    );
  }
}
