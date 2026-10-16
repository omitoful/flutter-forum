import 'package:flutter/material.dart';
import 'package:forumapp/models/post_model.dart';
import 'package:forumapp/views/post_details.dart';
import 'package:get/get.dart';

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
          Text(post.user?.username ?? "user"),
          Text(post.user?.email ?? "user@gmail.com"),
          SizedBox(height: 10),
          Text(post.content),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.thumb_up)),
              IconButton(
                onPressed: () {
                  Get.to(() => PostDetails(post: post));
                },
                icon: Icon(Icons.message),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
