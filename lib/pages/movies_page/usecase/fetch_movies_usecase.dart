import 'dart:async';
import 'package:movie_app_practice/data/repositories/favorites_repository.dart';
import 'package:movie_app_practice/data/repositories/movies_repository.dart';
import 'package:movie_app_practice/data/models/ui_movie_model.dart';
import 'package:movie_app_practice/data/models/mappers/ui_movie_model_extension.dart';

abstract class FetchMoviesUseCase {
  Future<List<UiMovieModel>> execute();
}

class FetchMoviesUseCaseImpl extends FetchMoviesUseCase {
  FetchMoviesUseCaseImpl(this._moviesRepository, this._favoritesRepository);

  final MoviesRepository _moviesRepository;
  final FavoritesRepository _favoritesRepository;

  @override
  Future<List<UiMovieModel>> execute() async {
    final moviesResult = await _moviesRepository.moviesInitialFetch();

    return moviesResult
        .map((e) => e..isFavorite = _favoritesRepository.isAddedToFavList(e.id))
        .map((model) => model.toUi()).toList();
  }
}
