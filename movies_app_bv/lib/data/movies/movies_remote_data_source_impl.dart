import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app_bv/domain/movies/datasources/movies_remote_data_source.dart';
import 'package:movies_app_bv/domain/movies/entities/movie.dart';

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  MoviesRemoteDataSourceImpl({http.Client? client})
      : _client = client ?? http.Client();

  final http.Client _client;
  static const String _baseUrl = 'https://api.example.com/api';

  @override
  Future<List<Movie>> getPopularMovies({required int page}) async {
    final response = await _client.get(
      Uri.parse('$_baseUrl/movies/popular?page=$page'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final movies = (data['results'] as List?)
              ?.map((m) => Movie.fromJson(m as Map<String, dynamic>))
              .toList() ??
          [];
      return movies;
    }

    throw MoviesException._fromResponse(response);
  }

  @override
  Future<List<Movie>> getSearchMovies({
    required String query,
    required int page,
  }) async {
    final response = await _client.get(
      Uri.parse('$_baseUrl/movies/search?query=$query&page=$page'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final movies = (data['results'] as List?)
              ?.map((m) => Movie.fromJson(m as Map<String, dynamic>))
              .toList() ??
          [];
      return movies;
    }

    throw MoviesException._fromResponse(response);
  }

  @override
  Future<Movie> getMovieDetails({required String movieId}) async {
    final response = await _client.get(
      Uri.parse('$_baseUrl/movies/$movieId'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return Movie.fromJson(data);
    }

    throw MoviesException._fromResponse(response);
  }
}

class MoviesException implements Exception {
  final String message;

  MoviesException(this.message);

  factory MoviesException._fromResponse(http.Response response) {
    String message = 'Error de películas: ${response.statusCode}';
    try {
      final body = jsonDecode(response.body);
      if (body is Map<String, dynamic> && body['message'] != null) {
        message = body['message'] as String;
      }
    } catch (_) {
      // ignore
    }
    return MoviesException(message);
  }

  @override
  String toString() => message;
}
