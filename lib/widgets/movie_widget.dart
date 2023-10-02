import 'package:flutter/material.dart';
import 'package:movie_app_practice/data/models/ui_movie_model.dart';

class MovieWidget extends StatelessWidget {
  final UiMovieModel movie;
  final void Function(UiMovieModel) onFavoriteClicked;
  final void Function(UiMovieModel) openDetails;

  const MovieWidget({
    super.key,
    required this.movie,
    required this.onFavoriteClicked,
    required this.openDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white12,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                movie.posterPath,
                width: 125,
                loadingBuilder: (context, child, progress) => progress == null
                    ? child
                    : const SizedBox(
                  width: 125,
                  height: 180,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: const TextStyle(
                        color: Colors.amber,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      movie.overview,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.amber,
                        fontSize: 11,
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.brown.shade500,
                        ),
                      ),
                      onPressed: () {
                        openDetails(movie);
                      },
                      child: const Text(
                        'See more...',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            onFavoriteClicked(movie);
                          },
                          icon: Icon(
                            movie.isFavorite ? Icons.delete : Icons.favorite,
                            color: Colors.red,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '⭐ ${movie.voteAverage.toStringAsFixed(1)}',
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                              color: Colors.amber,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
