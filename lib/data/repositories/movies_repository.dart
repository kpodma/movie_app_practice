import 'package:movie_app_practice/data/models/movie_model.dart';
import 'package:movie_app_practice/data/models/person_model.dart';
import 'package:movie_app_practice/data/models/mappers/person_model_extension.dart';
import 'package:movie_app_practice/data/api/api.dart';
import 'package:movie_app_practice/data/models/mappers/movie_model_extension.dart';

abstract class MoviesRepository {

  Future<List<MovieModel>> moviesInitialFetch();

  MovieModel getMovie(int id);

  Future<List<PersonModel>> personInitialFetch(int id);

}


class MoviesRepositoryImpl implements MoviesRepository {
  MoviesRepositoryImpl(this._api);

  final Api _api;
  List<MovieModel> _movies = [];

  @override
  Future<List<MovieModel>> moviesInitialFetch() async{
    final result = await _api.loadMoviesData();
    _movies = result.map((model) => model.toData()).toList();
    return _movies;
  }

  @override
  MovieModel getMovie(int id) {
    return _movies.firstWhere((element) => element.id == id);
  }

  @override
  Future<List<PersonModel>> personInitialFetch(int id) async{
    final result = await _api.loadPersonData(id);
    return result.map((model) => model.toEntity()).toList();
  }
}

