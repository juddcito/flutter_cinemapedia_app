import 'package:flutter_cinemapedia_app/domain/entities/movie.dart';

abstract class MovieDatasource {

   Future<List<Movie>> getNowPlaying({ int page = 1 });

}
