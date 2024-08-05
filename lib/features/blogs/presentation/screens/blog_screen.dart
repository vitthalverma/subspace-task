import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subspace_task/core/app/app_colors.dart';
import 'package:subspace_task/core/app/app_router.dart';
import 'package:subspace_task/core/utils/app_snackbar.dart';
import 'package:subspace_task/features/blogs/presentation/bloc/blog_bloc.dart';
import 'package:subspace_task/features/blogs/presentation/widgets/blog_card.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  @override
  void initState() {
    super.initState();
    context.read<BlogBloc>().add(FetchBlogEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text(
          'Blogs',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.whiteColor,
          ),
        ),
      ),
      body: BlocConsumer<BlogBloc, BlogState>(
        listener: (context, state) {
          if (state is BlogError) {
            return AppSnack.info(context, state.errorMessage);
          }
          if (state is BlogLoaded) {
            return AppSnack.success(context, 'Blogs loaded successfully');
          }
        },
        builder: (context, state) {
          if (state is BlogLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(
                  backgroundColor: AppColors.whiteColor),
            );
          } else if (state is BlogLoaded) {
            return ListView.builder(
              itemCount: state.blogs.length,
              itemBuilder: (context, index) {
                final blog = state.blogs[index];
                return BlogCard(
                  onTap: () {
                    Navigator.pushNamed(context, blogDetailRoute,
                        arguments: blog);
                  },
                  blog: blog,
                  color: index % 3 == 0
                      ? AppColors.gradient1
                      : index % 3 == 1
                          ? AppColors.gradient2
                          : AppColors.gradient3,
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
