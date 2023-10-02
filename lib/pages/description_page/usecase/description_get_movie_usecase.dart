import 'package:movie_app_practice/data/models/movie_model.dart';
import 'package:movie_app_practice/data/repositories/favorites_repository.dart';
import 'package:movie_app_practice/data/repositories/movies_repository.dart';

abstract class DescriptionGetMovieUseCase {
  MovieModel execute(int id);
}

class DescriptionGetMovieUseCaseImpl extends DescriptionGetMovieUseCase {
  DescriptionGetMovieUseCaseImpl(
      this._moviesRepository,
      this._favoritesRepository,
      );

  final MoviesRepository _moviesRepository;
  final FavoritesRepository _favoritesRepository;

  @override
  MovieModel execute(int id) {
    final movieResult = _moviesRepository.getMovie(id);
    final isFavorite = _favoritesRepository.isAddedToFavList(id);
    movieResult.isFavorite = isFavorite;
    return movieResult;
  }
}
