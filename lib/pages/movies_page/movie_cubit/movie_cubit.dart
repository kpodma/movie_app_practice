import 'dart:async';
import 'package:movie_app_practice/data/models/mappers/movie_model_extension.dart';
import 'package:movie_app_practice/data/models/mappers/ui_movie_model_extension.dart';
import 'package:movie_app_practice/data/models/ui_movie_model.dart';
import 'package:movie_app_practice/pages/favorites_page/usecase/is_added_favorites_usecase.dart';
import 'package:movie_app_practice/pages/favorites_page/usecase/toggle_favorite_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_practice/pages/movies_page/usecase/fetch_movies_usecase.dart';
import 'package:movie_app_practice/pages/movies_page/movie_cubit/movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit(
      this._fetchMoviesUseCase,
      this._toggleFavoriteUseCase,
      this._isAddedFavoritesUseCase,
      ) : super(MovieInitial());

  final FetchMoviesUseCase _fetchMoviesUseCase;
  final ToggleFavoriteUseCase _toggleFavoriteUseCase;
  final IsAddedFavoritesUseCase _isAddedFavoritesUseCase;

  Future<void> fetchMovies() async {
    final response = await _fetchMoviesUseCase.execute();
    emit(ResponseMovieState(response));
  }

  void toggleFavorites(UiMovieModel movie) {
    final updatedMovie = _toggleFavoriteUseCase.execute(movie.toData());
    final state = this.state;
    if (state is ResponseMovieState) {
      final movies = state.movies;
      final indexOfMovie = movies.indexOf(movie);
      movies[indexOfMovie] = updatedMovie.toUi();
      emit(ResponseMovieState(movies));
    }
  }
  void updateMovie(UiMovieModel movie) {
    final isFavorite = _isAddedFavoritesUseCase.execute(movie.id);
    final state = this.state;
    if (state is ResponseMovieState && movie.isFavorite != isFavorite) {
      final movies = state.movies;
      final indexOfMovie = movies.indexOf(movie);
      movies[indexOfMovie] = movie.copyWith(isFavorite: isFavorite);
      emit(ResponseMovieState(movies));
    }
  }
}
