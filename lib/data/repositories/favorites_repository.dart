import 'package:movie_app_practice/data/models/movie_model.dart';


abstract class FavoritesRepository {
  MovieModel toggleFavorite(MovieModel favorite);

  List<MovieModel> fetchFavorites();

  bool isAddedToFavList(int id);
}

class FavoritesRepositoryImpl implements FavoritesRepository {
  final List<MovieModel> _favorites = [];

  @override
  MovieModel toggleFavorite(MovieModel favorite) {

    final isFavorite = isAddedToFavList(favorite.id);

    if (isFavorite) {
      _favorites.remove(favorite);
    } else {
      _favorites.add(favorite);
    }
    return favorite..isFavorite = !isFavorite;
  }

  @override
  List<MovieModel> fetchFavorites() {
    return _favorites;
  }

  @override
  bool isAddedToFavList(int id) {
    return _favorites.any((element) => element.id == id);
  }
}

