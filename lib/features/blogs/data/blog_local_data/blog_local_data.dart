import 'package:hive/hive.dart';
import 'package:subspace_task/features/blogs/data/models/blog_model.dart';

abstract interface class BlogLocalDataSource {
  void uploadBlogs({required List<BlogModel> blogs});
  List<BlogModel> getAllBlogs();
}

class BlogLocalDataSourceImpl extends BlogLocalDataSource {
  final Box box;

  BlogLocalDataSourceImpl(this.box);

  @override
  List<BlogModel> getAllBlogs() {
    List<BlogModel> blogs = [];
    for (int i = 0; i < box.length; i++) {
      blogs.add(BlogModel.fromJson(box.get(i.toString())));
    }
    return blogs;
  }

  @override
  void uploadBlogs({required List<BlogModel> blogs}) {
    box.clear();
    box.write(() {
      for (int i = 0; i < blogs.length; i++) {
        box.put(i.toString(), blogs[i].toJson());
      }
    });
  }
}
