import 'package:movie_app_practice/data/models/person_model.dart';
import 'package:movie_app_practice/data/repositories/movies_repository.dart';

abstract class DescriptionFetchPersonUseCase {

  Future<List<PersonModel>> execute(id);
}

class FetchPersonUseCaseImpl extends DescriptionFetchPersonUseCase {
  FetchPersonUseCaseImpl(this._moviesRepository);

  final MoviesRepository _moviesRepository;

  @override
  Future<List<PersonModel>> execute(id) {
    return _moviesRepository.personInitialFetch(id);
  }
}