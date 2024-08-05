import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:subspace_task/core/network/connection_checker.dart';
import 'package:subspace_task/features/blogs/data/blog_local_data/blog_local_data.dart';
import 'package:subspace_task/features/blogs/data/blog_remote_data/blog_remote_data.dart';
import 'package:subspace_task/features/blogs/data/repository/blog_repository_impl.dart';
import 'package:subspace_task/features/blogs/domain/repository/blog_repository.dart';
import 'package:subspace_task/features/blogs/domain/usecases/fetch_blogs_usecase.dart';
import 'package:subspace_task/features/blogs/presentation/bloc/blog_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();

  Hive.defaultDirectory = (await getApplicationDocumentsDirectory()).path;

  final httpClient = http.Client();
  sl.registerLazySingleton(() => Hive.box(name: 'blogs'));
  sl.registerLazySingleton(() => httpClient);
  sl.registerFactory(() => InternetConnection());
  sl.registerFactory<ConnectionChecker>(() => ConnectionCheckerImpl(sl()));
}

void _initAuth() {
  // Datasource
  sl
    ..registerFactory<BlogRemoteData>(() => BlogRemoteDataImps(sl()))
    ..registerFactory<BlogLocalDataSource>(() => BlogLocalDataSourceImpl(sl()))
    // Repository
    ..registerFactory<BlogRepository>(
        () => BlogRepositoryImpl(sl(), sl(), sl()))
    // Usecases
    ..registerFactory(() => FetchBlogsUsecase(sl()))
    // Bloc
    ..registerLazySingleton(() => BlogBloc(sl()));
}
