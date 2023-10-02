import 'package:flutter/cupertino.dart';
import 'package:movie_app_practice/data/models/ui_movie_model.dart';


@immutable
abstract class MovieState {}

class MovieInitial extends MovieState {}

class ResponseMovieState extends MovieState {
  final List<UiMovieModel> movies;
  ResponseMovieState(this.movies);
}