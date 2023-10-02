import 'package:equatable/equatable.dart';
//ignore: must_be_immutable
class MovieModel extends Equatable {
  final String title;
  final String posterPath;
  final String overview;
  final double voteAverage;
  final String backdropPath;
  final String releaseDate;
  final int voteCount;
  final int id;
  bool isFavorite;

  MovieModel({
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

  @override
  List<Object?> get props => [
    id,
  ];
}
