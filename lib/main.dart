import 'package:movie_app_practice/pages/movies_page/movie_cubit/movie_cubit.dart';
import 'package:movie_app_practice/routes/app_route_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_practice/di/service_locator.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<MovieCubit>(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark),
        routerConfig: MyAppRouter().router,
      ),
    );
  }
}
