import 'package:movie_app_practice/data/models/person_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_app_practice/data/models/ui_movie_model.dart';

@immutable
abstract class DescriptionState {}

class DescriptionInitial extends DescriptionState {}

class ModelDescriptionState extends DescriptionState {
  final UiMovieModel movie;
  final List<PersonModel> persons;

  ModelDescriptionState(this.movie, this.persons);
}
