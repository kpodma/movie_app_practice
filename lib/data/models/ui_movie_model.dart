import 'package:equatable/equatable.dart';

class UiMovieModel extends Equatable {
  final String title;
  final String posterPath;
  final String overview;
  final double voteAverage;
  final String backdropPath;
  final String releaseDate;
  final int voteCount;
  final int id;
  final bool isFavorite;

  const UiMovieModel({
    required this.title,
    required this.posterPath,
    required this.overview,
    required this.voteAverage,
    required this.backdropPath,
    required this.releaseDate,
    required this.voteCount,
    required this.id,
    required this.isFavorite,
  });

  UiMovieModel copyWith({bool? isFavorite}) {
    return UiMovieModel(
      title: title,
      posterPath: posterPath,
      overview: overview,
      voteAverage: voteAverage,
      backdropPath: backdropPath,
      releaseDate: releaseDate,
      voteCount: voteCount,
      id: id,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object?> get props => [
    id,
  ];
}
