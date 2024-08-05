import 'package:fpdart/fpdart.dart';
import 'package:subspace_task/core/usecase/core_usecase.dart';
import 'package:subspace_task/core/utils/failure.dart';
import 'package:subspace_task/features/blogs/domain/entities/blog_entity.dart';
import 'package:subspace_task/features/blogs/domain/repository/blog_repository.dart';

class FetchBlogsUsecase implements CoreUsecase<List<BlogEntity>, NoParams> {
  final BlogRepository blogRepository;

  FetchBlogsUsecase(this.blogRepository);
  @override
  Future<Either<Failure, List<BlogEntity>>> call(NoParams params) async {
    return await blogRepository.fetchBlogs();
  }
}
