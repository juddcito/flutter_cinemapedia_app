import 'package:flutter_cinemapedia_app/infrastructure/datasources/moviedb_datasource.dart';
import 'package:flutter_cinemapedia_app/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// Este repositorio es inmutable
// Proporciona a los otros providers la info necesaria para que puedan consultar en el MovieRepositoryImpl
final movieRepositoryProvider = Provider((ref){
  return MovieRepositoryImpl( MovieDbDatasource() );
});