import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/view/widget/loading_widget.dart';
import 'package:sample_app/viewmodel/user_viewmodel.dart';

import '../../model/response/post_response_model.dart';

class PostsScreen extends StatelessWidget {
  static const routeName = '/posts_screen';
  List<Post> posts = [];

  PostsScreen();

  Future<void> _fetchPosts(BuildContext context) async {
    final response = await context.read<UserViewModel>().getPosts();
    if (response.isNotEmpty) {
      posts = response;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetchPosts(context),
      builder: (context, snapshot) => Scaffold(
          appBar: AppBar(title: const Text('Posts')),
          body: snapshot.connectionState == ConnectionState.waiting
              ? LoadingWidget()
              : postListView(posts)),
    );
  }

  Widget postListView(List<Post> posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return postListItem(posts[index]);
      },
    );
  }

  Widget postListItem(Post post) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.post_add),
          title: Text(post.title),
        ),
        const Divider(color: Colors.black)
      ],
    );
  }
}
