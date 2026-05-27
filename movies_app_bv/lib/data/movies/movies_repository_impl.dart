import 'package:movies_app_bv/domain/movies/datasources/movies_remote_data_source.dart';
import 'package:movies_app_bv/domain/movies/entities/movie.dart';
import 'package:movies_app_bv/domain/movies/repositories/movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  MoviesRepositoryImpl({required this.remoteDataSource});

  final MoviesRemoteDataSource remoteDataSource;

  @override
  Future<List<Movie>> getPopularMovies({required int page}) {
    return remoteDataSource.getPopularMovies(page: page);
  }

  @override
  Future<Movie> getMovieDetails({required String movieId}) {
    return remoteDataSource.getMovieDetails(movieId: movieId);
  }

  @override
  Future<List<Movie>> searchMovies({required String query, required int page}) {
    return remoteDataSource.getSearchMovies(query: query, page: page);
  }
}
