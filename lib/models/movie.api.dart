import 'package:cineinsight/models/movie.dart';
import 'package:dio/dio.dart';


class MovieApi {
  static final Dio _dio = Dio();

  static Future<List<Movie>> getMovies() async {
    final response = await _dio.get(
      'https://imdb-top-100-movies.p.rapidapi.com/',
      options: Options(
        headers: {
          'X-RapidAPI-Key': 'dfc5d7498amsh7ede97992791989p1ec447jsn8bdb681153f5', // Replace with your API key
          'X-RapidAPI-Host': 'imdb-top-100-movies.p.rapidapi.com',
        },
      ),
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonData = response.data;

      List<Movie> movies = jsonData.map((movieJson) {
        return Movie.fromJson(movieJson);
      }).toList();

      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
