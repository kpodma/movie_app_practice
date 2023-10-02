import 'package:movie_app_practice/pages/description_page/description_cubit/description_cubit.dart';
import 'package:movie_app_practice/pages/description_page/description_cubit/description_state.dart';
import 'package:movie_app_practice/widgets/description_widget.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_practice/di/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({
    super.key,
    required this.movieId,
  });

  final int movieId;

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  final descriptionCubit = getIt.get<DescriptionCubit>();

  @override
  void initState() {
    super.initState();
    descriptionCubit.getMovie(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt.get<DescriptionCubit>(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: [
            BlocBuilder<DescriptionCubit, DescriptionState>(
              builder: (context, state) {
                if (state is ModelDescriptionState) {
                  final movie = state.movie;
                  return IconButton(
                    icon: Icon(
                      movie.isFavorite ? Icons.delete : Icons.favorite,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      descriptionCubit.toggleFavorites(movie);

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
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
          title: const Text('Movie description'),
        ),
        body: BlocBuilder<DescriptionCubit, DescriptionState>(
          builder: (context, state) {
            if (state is ModelDescriptionState) {
              return DescriptionWidget(
                movie: state.movie,
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
