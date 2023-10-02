import 'package:movie_app_practice/data/my_constans/my_constans.dart';
import 'package:movie_app_practice/di/service_locator.dart';
import 'package:movie_app_practice/widgets/movie_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_practice/pages/movies_page/movie_cubit/movie_cubit.dart';
import 'package:movie_app_practice/pages/movies_page/movie_cubit/movie_state.dart';
import 'package:go_router/go_router.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  final movieCubit = getIt.get<MovieCubit>();

  @override
  void initState() {
    super.initState();
    movieCubit.fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(
            'Trending Movies'.toUpperCase(),
            style: const TextStyle(
              fontSize: 20,
              color: Colors.amberAccent,
            ),
          ),
        ),
        Expanded(
          child: BlocBuilder<MovieCubit, MovieState>(
            builder: (context, state) {
              if (state is MovieInitial) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ResponseMovieState) {
                final movies = state.movies;
                return ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    final movie = movies[index];
                    return MovieWidget(
                      movie: movie,
                      onFavoriteClicked: (movie) {
                        movieCubit.toggleFavorites(movie);
                        final snackBar = SnackBar(
                          duration: const Duration(seconds: 1),
                          content: Center(
                            child: movie.isFavorite
                                ? const Text('Removed from favorites')
                                : const Text('Added to favorites'),
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      openDetails: (movie) {
                        GoRouter.of(context).pushNamed(
                          MyConstans.descriptionRouteName,
                          pathParameters: {
                            MyConstans.id: movie.id.toString(),
                          },
                        ).then((_) => movieCubit.updateMovie(movie));
                      },
                    );
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
