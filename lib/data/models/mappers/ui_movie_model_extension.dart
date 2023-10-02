import 'package:movie_app_practice/data/models/movie_model.dart';
import 'package:movie_app_practice/data/models/ui_movie_model.dart';

extension ToUi on MovieModel {
  UiMovieModel toUi() {
    return UiMovieModel(
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
