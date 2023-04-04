
import 'package:flutter_http_riverpod_app/dto/post/post_response_dto.dart';
import 'package:flutter_http_riverpod_app/model/post/post.dart';
import 'package:flutter_http_riverpod_app/model/post/post_repository.dart';
import 'package:flutter_http_riverpod_app/view/pages/post/home/post_home_page_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ref 넘기기 위해 - store 값 변경하려고
// provider = spring의 어노테이션이라고 생각하기
final postController = Provider<PostController>((ref) => PostController(ref));

class PostController {

  Ref ref;
  PostController(this.ref);

  Future<void> findPosts() async {
    List<Post> postDtoList = await PostRepository().findAll();
    // return 하지 않고 store에 넣기 - notifier 자체가 provider 변경한다는 키워드
    ref.read(postHomePageProvider.notifier).init(postDtoList);
  }

  Future<void> addPost(String title) async{
  Post post = await PostRepository().save("제목");
  ref.read(postHomePageProvider.notifier).add(post);
  }

  Future<void> removePost(int id) async {
    await PostRepository().deleteById(id);
    ref.read(postHomePageProvider.notifier).remove(id);
  }

  Future<void> updatePost(Post post) async {
    Post postPS = await PostRepository().update(post);
    ref.read(postHomePageProvider.notifier).update(post);
  }


}