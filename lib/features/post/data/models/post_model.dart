import 'package:clean_art_project/features/post/domain/entities/post.dart';

class PostModel extends Post {
  PostModel({required super.id, required super.title, required super.body});
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
