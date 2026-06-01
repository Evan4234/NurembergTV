import 'package:movies_app_bv/domain/datasources/auth_remote_data_source.dart';
import 'package:movies_app_bv/domain/entities/auth_response.dart';
import 'package:movies_app_bv/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required this.remoteDataSource});

  final AuthRemoteDataSource remoteDataSource;

  @override
  Future<AuthResponse> login({required String email, required String password}) {
    return remoteDataSource.login(email: email, password: password);
  }

  @override
  Future<AuthResponse> register({required String name, required String email, required String password}) {
    return remoteDataSource.register(name: name, email: email, password: password);
  }
}
