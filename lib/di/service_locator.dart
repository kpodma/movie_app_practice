import 'package:movie_app_practice/data/api/api.dart';
import 'package:movie_app_practice/data/repositories/favorites_repository.dart';
import 'package:movie_app_practice/data/repositories/movies_repository.dart';
import 'package:movie_app_practice/pages/description_page/description_cubit/description_cubit.dart';
import 'package:movie_app_practice/pages/description_page/usecase/description_get_movie_usecase.dart';
import 'package:movie_app_practice/pages/favorites_page/usecase/is_added_favorites_usecase.dart';
import 'package:movie_app_practice/pages/favorites_page/usecase/toggle_favorite_usecase.dart';
import 'package:movie_app_practice/pages/movies_page/usecase/fetch_movies_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app_practice/pages/movies_page/movie_cubit/movie_cubit.dart';
import 'package:movie_app_practice/pages/description_page/usecase/description_fetch_person_usecase.dart';
import 'package:movie_app_practice/pages/favorites_page/favorite_cubit/favorite_cubit.dart';
import 'package:movie_app_practice/pages/favorites_page/usecase/fetch_favorites_usecase.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => MovieCubit(getIt(), getIt(), getIt()));
  getIt.registerLazySingleton(() => Api());
  getIt.registerLazySingleton<FetchMoviesUseCase>(() => FetchMoviesUseCaseImpl(getIt(),getIt()));
  getIt.registerLazySingleton<MoviesRepository>(() => MoviesRepositoryImpl(getIt()));
  getIt.registerLazySingleton<DescriptionFetchPersonUseCase>(() => FetchPersonUseCaseImpl(getIt()));
  getIt.registerLazySingleton(() => FavoriteCubit(getIt(), getIt()));
  getIt.registerLazySingleton(() => DescriptionCubit(getIt(),getIt(), getIt()));
  getIt.registerLazySingleton<ToggleFavoriteUseCase>(() => ToggleFavoriteUseCaseImpl(getIt()));
  getIt.registerLazySingleton<FetchFavoritesUseCase>(() => FetchFavoritesUseCaseImpl(getIt()));
  getIt.registerLazySingleton<FavoritesRepository>(() => FavoritesRepositoryImpl());
  getIt.registerLazySingleton<IsAddedFavoritesUseCase>(() => IsAddedFavoritesUseCaseImpl(getIt()));
  getIt.registerLazySingleton<DescriptionGetMovieUseCase>(() => DescriptionGetMovieUseCaseImpl(getIt(), getIt()));
}
