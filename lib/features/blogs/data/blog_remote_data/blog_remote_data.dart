import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:subspace_task/core/app/app_creds.dart';
import 'package:subspace_task/core/network/exceptions.dart';
import 'package:subspace_task/features/blogs/data/models/blog_model.dart';

abstract interface class BlogRemoteData {
  Future<List<BlogModel>> fetchBlogs();
}

class BlogRemoteDataImps extends BlogRemoteData {
  final http.Client client;

  BlogRemoteDataImps(this.client);
  @override
  Future<List<BlogModel>> fetchBlogs() async {
    try {
      final response = await http.get(Uri.parse(AppCreds.apiUrl), headers: {
        'x-hasura-admin-secret': AppCreds.adminSecret,
      });
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        final List<dynamic> blogs = body['blogs'];
        return blogs.map((blog) => BlogModel.fromJson(blog)).toList();
      } else {
        throw NtwkException(
            'Failed to fetch blogs. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
      throw NtwkException(e.toString());
    }
  }
}
