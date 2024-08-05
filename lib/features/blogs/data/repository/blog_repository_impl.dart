import 'package:fpdart/fpdart.dart';
import 'package:subspace_task/core/network/connection_checker.dart';
import 'package:subspace_task/core/network/exceptions.dart';
import 'package:subspace_task/core/utils/failure.dart';
import 'package:subspace_task/features/blogs/data/blog_local_data/blog_local_data.dart';
import 'package:subspace_task/features/blogs/data/blog_remote_data/blog_remote_data.dart';
import 'package:subspace_task/features/blogs/domain/entities/blog_entity.dart';
import 'package:subspace_task/features/blogs/domain/repository/blog_repository.dart';

class BlogRepositoryImpl implements BlogRepository {
  final BlogRemoteData blogRemoteData;
  final BlogLocalDataSource blogLocalDataSource;
  final ConnectionChecker connectionChecker;

  BlogRepositoryImpl(
    this.blogRemoteData,
    this.blogLocalDataSource,
    this.connectionChecker,
  );
  @override
  Future<Either<Failure, List<BlogEntity>>> fetchBlogs() async {
    try {
      if (!await (connectionChecker.isConnected)) {
        final blogs = blogLocalDataSource.getAllBlogs();
        return right(blogs);
      }
      final blogs = await blogRemoteData.fetchBlogs();
      blogLocalDataSource.uploadBlogs(blogs: blogs);
      return right(blogs);
    } on NtwkException catch (e) {
      return left(Failure(e.message));
    }
  }
}
