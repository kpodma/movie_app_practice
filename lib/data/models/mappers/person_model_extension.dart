import 'package:movie_app_practice/data/api/models/person_response_model.dart';
import 'package:movie_app_practice/data/models/person_model.dart';

extension ToEntity on PersonResponseModel {
  PersonModel toEntity() {
    return PersonModel(
      name: name,
      profilePath: profilePath,
    );
  }
}
