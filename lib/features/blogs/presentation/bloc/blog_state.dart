part of 'blog_bloc.dart';

@immutable
sealed class BlogState {}

final class BlogInitial extends BlogState {}

final class BlogLoading extends BlogState {}

final class BlogLoaded extends BlogState {
  final List<BlogEntity> blogs;

  BlogLoaded(this.blogs);
}

final class BlogError extends BlogState {
  final String errorMessage;

  BlogError(this.errorMessage);
}
