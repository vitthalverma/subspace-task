import 'package:fpdart/fpdart.dart';
import 'package:subspace_task/core/utils/failure.dart';
import 'package:subspace_task/features/blogs/domain/entities/blog_entity.dart';

abstract interface class BlogRepository {
  Future<Either<Failure, List<BlogEntity>>> fetchBlogs();
}
