import 'package:movie_app_practice/data/models/ui_movie_model.dart';
import 'package:movie_app_practice/widgets/person_widget.dart';
import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  final UiMovieModel movie;

  const DescriptionWidget({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  movie.posterPath,
                ),
                radius: 40,
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: const TextStyle(
                          color: Colors.amber,
                          fontSize: 26,
                        ),
                      ),
                      Text(
                        movie.releaseDate,
                        style: TextStyle(
                          color: Colors.brown.shade200,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              movie.backdropPath,
              width: MediaQuery.of(context).size.width,
              loadingBuilder: (context, child, progress) => progress == null
                  ? child
                  : const SizedBox(
                height: 150,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              const Text(
                'Overview',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 24,
                ),
              ),
              Expanded(
                child: Text(
                  '⭐ ${movie.voteAverage.toStringAsFixed(1)}',
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    color: Colors.amber,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              'votes: ${movie.voteCount.toString()}',
              style: TextStyle(
                color: Colors.brown.shade200,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            movie.overview,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Cast',
            style: TextStyle(
              color: Colors.amber,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 120,
            child: PersonWidget(),
          ),
        ],
      ),
    );
  }
}
