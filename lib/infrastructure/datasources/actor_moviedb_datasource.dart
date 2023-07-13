import 'package:dio/dio.dart';
import 'package:flutter_cinemapedia_app/config/constants/environment.dart';
import 'package:flutter_cinemapedia_app/domain/datasources/actors_datasource.dart';
import 'package:flutter_cinemapedia_app/domain/entities/actor.dart';
import 'package:flutter_cinemapedia_app/infrastructure/mappers/actor_mapper.dart';
import 'package:flutter_cinemapedia_app/infrastructure/models/moviedb/credits_response.dart';

class ActorMovieDbDatasource extends ActorDatasource {

  final dio = Dio(BaseOptions(
      // Todas las peticiones tendrán esta baseUrl precargada
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX'
      }));

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {

    final response = await dio.get(
      '/movie/$movieId/credits'
    );

    final castResponse = CreditsResponse.fromJson(response.data);

    List<Actor> actors = castResponse.cast.map(
      (cast) => ActorMapper.castToEntity(cast)
    ).toList();

    return actors;
    
  }
}
