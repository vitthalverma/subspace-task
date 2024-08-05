import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:subspace_task/core/app/app_colors.dart';
import 'package:subspace_task/features/blogs/domain/entities/blog_entity.dart';

class BlogCard extends StatelessWidget {
  const BlogCard(
      {super.key,
      required this.blog,
      required this.color,
      required this.onTap});
  final BlogEntity blog;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 17.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(3.w),
        ),
        margin: EdgeInsets.all(1.5.h),
        padding: EdgeInsets.all(
          3.h,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    blog.title,
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
