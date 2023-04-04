import 'package:flutter_http_riverpod_app/dto/post/post_response_dto.dart';
import 'package:flutter_http_riverpod_app/model/post/post.dart';

class PostRepository {
  static PostRepository _instance = PostRepository._single();

  PostRepository._single();

  factory PostRepository() {
    return _instance;
  }

  Future<List<Post>> findAll() {
    return Future.delayed( // future.delayed 왜 썼더라 - 통신 안 해서 하는 척하려고
      Duration(seconds: 1),
          () {
        return [
          Post(id: 1, title: "제목1"),
          Post(id: 2, title: "제목2"),
          Post(id: 3, title: "제목3"),
        ];
      },
    );
  }

  Future<Post> save(String title) {
    return Future.delayed( // save시 save한 데이터를 영속화해서 돌려주어야 함
      // delete를 제외한 모든 요청은 데이터를 돌려주어야 함
      Duration(seconds: 1),
          () {
        return
          Post(id: 4, title: "제목4");
      },
    );
  }

  Future<void> deleteById(int id) {
    return Future.delayed(
        Duration(seconds: 1));
}

Future<Post> update(Post post) {
  return Future.delayed( // save시 save한 데이터를 영속화해서 돌려주어야 함
    // delete를 제외한 모든 요청은 데이터를 돌려주어야 함
    Duration(seconds: 1),
        () {
      return
        post;
    },
  );
}}
