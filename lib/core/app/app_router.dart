import 'package:flutter/material.dart';
import 'package:subspace_task/features/blogs/presentation/screens/blog_detail_screen.dart';
import 'package:subspace_task/features/blogs/presentation/screens/blog_screen.dart';

const homeRoute = '/';
const blogDetailRoute = '/blogDetail';

class AppRouter {
  static Route<dynamic> generateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            return const BlogScreen();
          },
        );

      case blogDetailRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            return const BlogDetailScreen();
          },
        );

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            return const Center(child: Icon(Icons.error));
          },
        );
    }
  }
}
