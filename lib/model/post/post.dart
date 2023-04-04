import 'package:flutter_http_riverpod_app/model/user/user.dart';

class Post{
  // 꼭 필요한 데이터 아니면 null 허용해서 선택해서 사용
  int? userId;
  int? id;
  String? title;
  String? body;
  User? user;

  Post({ this.userId,  this.id,  this.title,  this.body, this.user});

  //Json을 object로 바꾸어줌
  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      userId : json['userId'],
      id : json['id'],
      title : json['title'],
      body : json['body'],
      user : User.fromJson(json['user']),
    );
  }
  // toJson(); //object를 json으로 바꾸어줌
  Map<String,dynamic> toJson(){
    return {
      'userId' : userId,
      'id' : id,
      'title' : title,
      'body' : body,
      'user' : user?.toJson()
      // 변수?.메소드 - 변수가 null이면 호출 x, null이 아닐 때만 호출 o
    };
  }
}