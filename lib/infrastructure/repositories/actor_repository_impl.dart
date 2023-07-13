

import 'package:flutter_cinemapedia_app/domain/datasources/actors_datasource.dart';
import 'package:flutter_cinemapedia_app/domain/entities/actor.dart';
import 'package:flutter_cinemapedia_app/domain/repositories/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository {

  final ActorDatasource datasource;

  ActorRepositoryImpl(this.datasource);

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return datasource.getActorsByMovie(movieId);
  }


}