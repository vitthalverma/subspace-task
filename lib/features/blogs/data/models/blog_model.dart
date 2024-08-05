import 'package:subspace_task/features/blogs/domain/entities/blog_entity.dart';

class BlogModel extends BlogEntity {
  BlogModel({required super.id, required super.imageUrl, required super.title});

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      id: json['id'] ?? '',
      imageUrl: json['image_url'] ?? '',
      title: json['title'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'image_url': imageUrl,
    };
  }
}
