import 'package:flutter_app/model/detail.dart';
import 'package:flutter_app/model/genre.dart';
import 'package:flutter_app/model/movie.dart';
import 'package:flutter_app/state/movie_cubit_state.dart';

class MovieCubitInit extends MovieCubitState {
  const MovieCubitInit(
      {List<Movie> movies,
      List<Genre> genres,
      List<Movie> latestMovies,
      List<Movie> popularMovies,
      Detail detail})
      : super(
            movies: movies,
            genres: genres,
            latestMovies: latestMovies,
            popularMovies: popularMovies,
            detail: detail);
}

class MovieCubitGetData extends MovieCubitState {
  const MovieCubitGetData(
      {List<Movie> movies,
      List<Genre> genres,
      List<Movie> latestMovies,
      List<Movie> popularMovies})
      : super(
            movies: movies,
            genres: genres,
            latestMovies: latestMovies,
            popularMovies: popularMovies);
}

class MovieCubitGetDetail extends MovieCubitState {
  const MovieCubitGetDetail({Detail detail}) : super(detail: detail);
}
