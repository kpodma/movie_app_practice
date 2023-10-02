import 'package:movie_app_practice/data/my_constans/my_constans.dart';
import 'package:movie_app_practice/pages/favorites_page/favorite_cubit/favorite_cubit.dart';
import 'package:movie_app_practice/pages/favorites_page/favorite_cubit/favorite_state.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_practice/widgets/movie_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_practice/di/service_locator.dart';
import 'package:go_router/go_router.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final favoriteCubit = getIt.get<FavoriteCubit>();

  @override
  void initState() {
    super.initState();
    favoriteCubit.fetchFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt.get<FavoriteCubit>(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
              'Favorites'.toUpperCase(),
              style: const TextStyle(
                fontSize: 20,
                color: Colors.amberAccent,
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<FavoriteCubit, FavoriteState>(
              builder: (context, state) {
                if (state is FavoriteInitial) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ResponseFavoritesState) {
                  final favorites = state.favorites;
                  return Visibility(
                    visible: favorites.isNotEmpty,
                    replacement: const Center(
                      child: Text('You have no favorites'),
                    ),
                    child: ListView.builder(
                      itemCount: favorites.length,
                      itemBuilder: (context, index) {
                        final favorite = favorites[index];
                        return MovieWidget(
                          movie: favorite,
                          onFavoriteClicked: (movie) {
                            favoriteCubit.toggleFavorites(movie);
                            final snackBar = SnackBar(
                              duration: const Duration(seconds: 1),
                              content: Center(
                                child: movie.isFavorite
                                    ? const Text('Removed from favorites')
                                    : const Text('Added to favorites'),
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                          openDetails: (movie) {
                            GoRouter.of(context).pushNamed(
                              MyConstans.descriptionRouteName,
                              pathParameters: {
                                MyConstans.id: movie.id.toString(),
                              },
                            ).then((_) => favoriteCubit.fetchFavorites());
                          },
                        );
                      },
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
