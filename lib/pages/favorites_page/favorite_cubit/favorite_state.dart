import 'package:movie_app_practice/data/models/ui_movie_model.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class ResponseFavoritesState extends FavoriteState {
  final List<UiMovieModel> favorites;
  ResponseFavoritesState(this.favorites);
}
