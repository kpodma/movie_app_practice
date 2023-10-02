import 'package:movie_app_practice/data/repositories/favorites_repository.dart';

abstract class IsAddedFavoritesUseCase {
  bool execute(int id);
}

class IsAddedFavoritesUseCaseImpl extends IsAddedFavoritesUseCase {
  IsAddedFavoritesUseCaseImpl(this._favoritesRepository);

  final FavoritesRepository _favoritesRepository;

  @override
  bool execute(int id) {
    return _favoritesRepository.isAddedToFavList(id);
  }
}