import 'package:movie_app_practice/data/models/mappers/movie_model_extension.dart';
import 'package:movie_app_practice/data/models/ui_movie_model.dart';
import 'package:movie_app_practice/pages/favorites_page/usecase/fetch_favorites_usecase.dart';
import 'package:movie_app_practice/pages/favorites_page/usecase/toggle_favorite_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_practice/pages/favorites_page/favorite_cubit/favorite_state.dart';


class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(
      this._toggleFavoriteUseCase,
      this._favoritesUseCase,
      ) : super(FavoriteInitial());

  final ToggleFavoriteUseCase _toggleFavoriteUseCase;
  final FetchFavoritesUseCase _favoritesUseCase;

  void toggleFavorites(UiMovieModel favorite) {
    _toggleFavoriteUseCase.execute(favorite.toData());
    final state = this.state;
    if (state is ResponseFavoritesState) {
      final movies = state.favorites;
      movies.remove(favorite);
      emit(ResponseFavoritesState(movies));
    }
  }

  Future<void> fetchFavorites() async {
    final response = _favoritesUseCase.execute();
    emit(ResponseFavoritesState(response));
  }
}
