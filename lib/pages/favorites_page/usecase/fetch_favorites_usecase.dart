import 'package:movie_app_practice/data/models/ui_movie_model.dart';
import 'package:movie_app_practice/data/repositories/favorites_repository.dart';
import 'package:movie_app_practice/data/models/mappers/ui_movie_model_extension.dart';

abstract class FetchFavoritesUseCase {
  List<UiMovieModel> execute();
}

class FetchFavoritesUseCaseImpl extends FetchFavoritesUseCase {
  FetchFavoritesUseCaseImpl(this._favoritesRepository);

  final FavoritesRepository _favoritesRepository;

  @override
  List<UiMovieModel> execute() {
    final result = _favoritesRepository.fetchFavorites();
    return result.map((model) => model.toUi()).toList();
  }
}