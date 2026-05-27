import '../entities/movie.dart';

abstract class MoviesRemoteDataSource {
  Future<List<Movie>> getPopularMovies({
    required int page,
  });

  Future<List<Movie>> getSearchMovies({
    required String query,
    required int page,
  });

  Future<Movie> getMovieDetails({
    required String movieId,
  });
}
