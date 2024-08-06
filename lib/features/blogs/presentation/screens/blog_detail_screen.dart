import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:subspace_task/core/app/app_colors.dart';
import 'package:subspace_task/features/blogs/domain/entities/blog_entity.dart';

class BlogDetailScreen extends StatefulWidget {
  const BlogDetailScreen({super.key});

  @override
  State<BlogDetailScreen> createState() => _BlogDetailScreenState();
}

class _BlogDetailScreenState extends State<BlogDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final blog = ModalRoute.of(context)!.settings.arguments as BlogEntity;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.whiteColor,
            )),
        actions: [
          IconButton(
            icon: Icon(
              blog.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: blog.isFavorite ? Colors.red : Colors.white,
            ),
            onPressed: () {
              setState(() {
                blog.isFavorite = !blog.isFavorite;
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(5.w),
        child: Column(
          children: [
            Text(
              blog.title,
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.h),
            Container(
              height: 30.h,
              width: double.infinity,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(3.w)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(3.w),
                child: CachedNetworkImage(
                  imageUrl: blog.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
