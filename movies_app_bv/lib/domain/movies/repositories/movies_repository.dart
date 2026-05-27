import '../entities/movie.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getPopularMovies({
    required int page,
  });

  Future<List<Movie>> searchMovies({
    required String query,
    required int page,
  });

  Future<Movie> getMovieDetails({
    required String movieId,
  });
}
