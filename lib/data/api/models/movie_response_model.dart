class MovieResponseModel {

  final String title;
  final String posterPath;
  final String overview;
  final double voteAverage;
  final String backdropPath;
  final String releaseDate;
  final int voteCount;
  final int id;

  MovieResponseModel({

    required this.title,
    required this.posterPath,
    required this.overview,
    required this.voteAverage,
    required this.backdropPath,
    required this.releaseDate,
    required this.voteCount,
    required this.id,
  });

  factory MovieResponseModel.fromJson(Map json) {
    return MovieResponseModel(
      title: json['title'],
      posterPath: 'https://image.tmdb.org/t/p/original${json['poster_path']}',
      overview: json['overview'],
      voteAverage: json['vote_average'],
      backdropPath: 'https://image.tmdb.org/t/p/original${json['backdrop_path']}',
      releaseDate: 'Release date: ${json['release_date']}',
      voteCount: json['vote_count'],
      id:  json['id'],
    );
  }
}