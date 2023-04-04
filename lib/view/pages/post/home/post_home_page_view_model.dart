import 'package:flutter_http_riverpod_app/model/post/post.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// provider - 직접적으로 외부접근이 가능한
final postHomePageProvider = StateNotifierProvider<PostHomePageViewModel,PostHomePageModel?>((ref) {
  return PostHomePageViewModel(null);
},);


// 실질적으로 사용할 데이터 - 화면에 구현할 = dto
class PostHomePageModel {
  List<Post> posts;
  PostHomePageModel({required this.posts});
}


// store
class PostHomePageViewModel extends StateNotifier<PostHomePageModel?>{
  PostHomePageViewModel(super.state);

  //초기화 위한
  void init(List<Post> postDtoList) {
    state = PostHomePageModel(posts :postDtoList);
  }

  void add(Post post) {
    List<Post> posts = state!.posts;
    List<Post> newPosts = [...posts, post];
    state = PostHomePageModel(posts: newPosts);
    // state는 새로운 객체가 들어가야 함 - 새로 new 해주어야 함 - 기존 값에 추가해도 인식되지 않음
  }

  void remove(int id) {
    List<Post> posts = state!.posts;
    //where은 검색/삭제에 사용
    List<Post> newPosts = posts.where((e) => e.id != id).toList();
    state = PostHomePageModel(posts: newPosts);
  }

  void update(Post post) {
    List<Post> posts = state!.posts;
    List<Post> newPosts = posts.map((e) => e.id == post.id ? post : e).toList();
    state = PostHomePageModel(posts: newPosts);
  }


}