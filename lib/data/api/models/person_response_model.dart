class PersonResponseModel {
  final String name;
  final String? profilePath;

  PersonResponseModel({
    required this.name,
    required this.profilePath,
  });

  factory PersonResponseModel.fromJson(Map json) {
    return PersonResponseModel(
      name: json['name'],
      profilePath: json['profile_path']==null?null:'https://image.tmdb.org/t/p/original${json['profile_path']}',
    );
  }
}
