import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subspace_task/core/usecase/core_usecase.dart';
import 'package:subspace_task/features/blogs/domain/entities/blog_entity.dart';
import 'package:subspace_task/features/blogs/domain/usecases/fetch_blogs_usecase.dart';
part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final FetchBlogsUsecase fetchBlogsUsecase;
  BlogBloc(this.fetchBlogsUsecase) : super(BlogInitial()) {
    on<FetchBlogEvent>((event, emit) async {
      emit(BlogLoading());
      final result = await fetchBlogsUsecase(NoParams());
      result.fold(
        (error) => emit(BlogError(error.message)),
        (blogs) => emit(BlogLoaded(blogs)),
      );
    });
  }
}
