import 'package:movie_app_practice/data/models/mappers/movie_model_extension.dart';
import 'package:movie_app_practice/data/models/mappers/ui_movie_model_extension.dart';
import 'package:movie_app_practice/data/models/ui_movie_model.dart';
import 'package:movie_app_practice/pages/description_page/usecase/description_get_movie_usecase.dart';
import 'package:movie_app_practice/pages/description_page/usecase/description_fetch_person_usecase.dart';
import 'package:movie_app_practice/pages/favorites_page/usecase/toggle_favorite_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_practice/pages/description_page/description_cubit/description_state.dart';

class DescriptionCubit extends Cubit<DescriptionState> {
  DescriptionCubit(
      this._descriptionGetMovieUseCase,
      this._descriptionFetchPersonUseCase,
      this._toggleFavoriteUseCase,
      ) : super(DescriptionInitial());


  final DescriptionGetMovieUseCase _descriptionGetMovieUseCase;
  final DescriptionFetchPersonUseCase _descriptionFetchPersonUseCase;
  final ToggleFavoriteUseCase _toggleFavoriteUseCase;


  Future<void> getMovie(int id) async {
    final response = _descriptionGetMovieUseCase.execute(id);
    final responsePerson = await _descriptionFetchPersonUseCase.execute(id);
    emit(ModelDescriptionState(response.toUi(), responsePerson));
  }

  void toggleFavorites(UiMovieModel movie) {
    final updatedMovie = _toggleFavoriteUseCase.execute(movie.toData());
    final state = this.state;
    if(state is ModelDescriptionState) {
      emit(ModelDescriptionState(updatedMovie.toUi(), state.persons));
    }
  }


}
