

import 'package:dio/dio.dart';
import 'package:flutter_cinemapedia_app/config/constants/environment.dart';
import 'package:flutter_cinemapedia_app/domain/datasources/movies_datasource.dart';
import 'package:flutter_cinemapedia_app/domain/entities/movie.dart';
import 'package:flutter_cinemapedia_app/infrastructure/mappers/movie_mapper.dart';
import 'package:flutter_cinemapedia_app/infrastructure/models/moviedb/moviedb_response.dart';

class MovieDbDatasource extends MoviesDatasource{

  final dio = Dio(BaseOptions(
    // Todas las peticiones tendrán esta baseUrl precargada
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.theMovieDbKey,
      'language': 'es-MX'
    }
  ));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {

    final response = await dio.get('/movie/now_playing');
    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDBResponse.results
    .where((moviedb) => moviedb.posterPath != 'no-poster')
    .map(
      (moviedb) => MovieMapper.movieDBToEntitiy(moviedb)
      ).toList();

    return movies;
  }

}