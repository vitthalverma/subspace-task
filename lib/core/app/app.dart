import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:subspace_task/core/app/app_router.dart';
import 'package:subspace_task/features/blogs/presentation/bloc/blog_bloc.dart';
import 'package:subspace_task/injection_container.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<BlogBloc>()),
      ],
      child: ResponsiveSizer(
        builder: (p0, p1, p2) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.dark,
            onGenerateRoute: AppRouter.generateRoute,
          );
        },
      ),
    );
  }
}
