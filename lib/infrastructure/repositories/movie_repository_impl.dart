

import 'package:flutter_cinemapedia_app/domain/datasources/movies_datasource.dart';
import 'package:flutter_cinemapedia_app/domain/entities/movie.dart';
import 'package:flutter_cinemapedia_app/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {

  // Mandar a llamar el datasource para que ejecute getNowPlaying
  final MoviesDatasource datasource;

  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return this.datasource.getNowPlaying(page: page);
  }

}