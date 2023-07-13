

// Este repositorio es inmutable
// Proporciona a los otros providers la info necesaria para que puedan consultar en el MovieRepositoryImpl
import 'package:flutter_cinemapedia_app/infrastructure/datasources/actor_moviedb_datasource.dart';
import 'package:flutter_cinemapedia_app/infrastructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorRepositoryProvider = Provider((ref){
  return ActorRepositoryImpl( ActorMovieDbDatasource() );
});