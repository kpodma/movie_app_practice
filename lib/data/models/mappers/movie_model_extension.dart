import 'package:movie_app_practice/data/api/models/movie_response_model.dart';
import 'package:movie_app_practice/data/models/movie_model.dart';
import 'package:movie_app_practice/data/models/ui_movie_model.dart';

extension FromResponseToData on MovieResponseModel {
  MovieModel toData() {
    return MovieModel(
      title: title,
      posterPath: posterPath,
      overview: overview,
      voteAverage: voteAverage,
      backdropPath: backdropPath,
      releaseDate: releaseDate,
      voteCount: voteCount,
      id: id,
      isFavorite: false,
    );
  }
}

extension ToData on UiMovieModel {
  MovieModel toData() {
    return MovieModel(
      title: title,
      posterPath: posterPath,
      overview: overview,
      voteAverage: voteAverage,
      backdropPath: backdropPath,
      releaseDate: releaseDate,
      voteCount: voteCount,
      id: id,
      isFavorite: isFavorite,
    );
  }
}
