import 'package:flutter_cinemapedia_app/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/movie.dart';

final movieInfoProvider = StateNotifierProvider<MovieMapNotifier,Map<String,Movie>>((ref) {

  final movieRepository = ref.watch(movieRepositoryProvider);

  return MovieMapNotifier(getMovie: movieRepository.getMovieById);

});

/*
{
  '50542': Movie(),
  '50542': Movie(),
  '50542': Movie(),
}

*/

typedef GetMovieCallback = Future<Movie>Function(String movieId);


class MovieMapNotifier extends StateNotifier<Map<String,Movie>> {
  
  final GetMovieCallback getMovie;

  MovieMapNotifier({
    required this.getMovie
  }): super({});


  Future<void> loadMovier( String movieId ) async { 
    if ( state[movieId] != null ) return;

    final movie = await getMovie( movieId );

    state = { ...state, movieId: movie };

  }


}

