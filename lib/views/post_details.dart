import 'package:flutter/material.dart';
import 'package:forumapp/controllers/post_controller.dart';
import 'package:forumapp/models/post_model.dart';
import 'package:forumapp/views/widgets/input_widget.dart';
import 'package:forumapp/views/widgets/post_data.dart';
import 'package:get/get.dart';

class PostDetails extends StatefulWidget {
  const PostDetails({super.key, required this.post});
  final PostModel post;

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  final TextEditingController _commentController = TextEditingController();
  final PostController _postController = Get.put(PostController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _postController.getComments(widget.post.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post.user?.username ?? 'username'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              PostData(post: widget.post),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                child: Obx(() {
                  return _postController.isLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: _postController.comments.value.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                _postController.comments.value[index].user.name,
                              ),
                              subtitle: Text(_postController.comments.value[index].body),
                            );
                          },
                        );
                }),
              ),
              InputWidget(
                hintText: 'Write a comment...',
                controller: _commentController,
                obscured: false,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () async {},
                child: Obx(() {
                  return _postController.isLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : Text('Comment');
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
