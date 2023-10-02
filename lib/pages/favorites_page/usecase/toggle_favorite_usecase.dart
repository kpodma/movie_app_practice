import 'package:movie_app_practice/data/repositories/favorites_repository.dart';
import 'package:movie_app_practice/data/models/movie_model.dart';

abstract class ToggleFavoriteUseCase {

  MovieModel execute(MovieModel favorite);

}

class ToggleFavoriteUseCaseImpl extends ToggleFavoriteUseCase {
  ToggleFavoriteUseCaseImpl(this._favoritesRepository);

  final FavoritesRepository _favoritesRepository;

  @override
  MovieModel execute(MovieModel favorite) {
    return _favoritesRepository.toggleFavorite(favorite);
  }
}