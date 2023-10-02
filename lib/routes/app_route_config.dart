import 'package:movie_app_practice/pages/description_page/description_page.dart';
import 'package:movie_app_practice/pages/home.dart';
import 'package:movie_app_practice/data/my_constans/my_constans.dart';
import 'package:go_router/go_router.dart';

class MyAppRouter {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: MyConstans.homeRouteName,
        path: '/',
        builder: (context, state) => const Home(),
        routes: [
          GoRoute(
            name: MyConstans.descriptionRouteName,
            path:
            'description_page/:id',
            builder: (context, state) => DescriptionPage(
              movieId: int.parse(state.pathParameters[MyConstans.id]!),
            ),
          ),
        ],
      ),
    ],
  );
}
