import 'dart:convert';
import 'package:movie_app_practice/data/api/models/movie_response_model.dart';
import 'package:movie_app_practice/data/api/models/person_response_model.dart';
import 'package:http/http.dart' as http;

class Api {

  final String apiKey = '6c425611aac1e459084221a373780510';

  Future<List<MovieResponseModel>> loadMoviesData() async {
    final uri = 'https://api.themoviedb.org/3/trending/movie/week?api_key=$apiKey';
    final response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      final Iterable l = jsonDecode(response.body)['results'];
      final List<MovieResponseModel> movies = List<MovieResponseModel>.from(l.map((model) => MovieResponseModel.fromJson(model)));
      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<Iterable<PersonResponseModel>> loadPersonData(int id) async {
    final uri = 'http://api.themoviedb.org/3/movie/$id/casts?api_key=$apiKey';
    final response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      final Iterable l = jsonDecode(response.body)['cast'];
      final List<PersonResponseModel> persons = List<PersonResponseModel>.from(l.map((model) => PersonResponseModel.fromJson(model)));
      return persons.take(15);
    } else {
      throw Exception('Failed to load persons');
    }
  }
}