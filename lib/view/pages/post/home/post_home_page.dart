import 'package:flutter/material.dart';
import 'package:flutter_http_riverpod_app/controller/post_controller.dart';
import 'package:flutter_http_riverpod_app/model/post/post.dart';
import 'package:flutter_http_riverpod_app/view/pages/post/home/post_home_page_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostHomePage extends ConsumerWidget {
  //ref 받기 위해 consumerWidget 상속
  const PostHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    PostController pc = ref.read(postController);
    PostHomePageModel? pm = ref.watch(postHomePageProvider);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: pm != null ? buildListView(pm.posts) : buildListView([]),
          ),
          ElevatedButton(
            onPressed: () {
              pc.findPosts();
            },
            child: Text("페이지로드"),
          ),
          ElevatedButton(
            onPressed: () {
              pc.addPost("제목4");
            },
            child: Text("한건추가"),
          ),
          ElevatedButton(
            onPressed: () {
              pc.removePost(1);
            },
            child: Text("한건삭제"),
          ),
          ElevatedButton(
            onPressed: () {
              pc.updatePost(Post(id: 2, title: "수정한 제목"));
            },
            child: Text("한건수정"),
          ),
        ],
      ),
    );
  }

  Widget buildListView(List<Post> posts) {
    return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) => ListTile(
                leading: Text("${posts[index].id}"),
                title: Text("${posts[index].title}"),
              ),
            );
  }
}