import 'package:flutter_app/api/api_helper.dart';
import 'package:flutter_app/events/movie_cubit_event.dart';
import 'package:flutter_app/model/detail.dart';
import 'package:flutter_app/state/movie_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieCubit extends Cubit<MovieCubitState> {
  MovieCubit()
      : super(MovieCubitInit(
            movies: [],
            genres: [],
            latestMovies: [],
            popularMovies: [],
            detail: Detail(
              imgUrl: '',
              synopsys: '',
              title: '',
              info: '',
            ),));

  void getData() async => emit(MovieCubitGetData(
      movies: await ApiHelper().getMovieBanner(),
      genres: await ApiHelper().getGenre(),
      latestMovies: await ApiHelper().getLatestMovie(),
      popularMovies: await ApiHelper().getPopularMovie()));

  void getMovieDetail(id) async =>
      emit(MovieCubitGetDetail(detail: await ApiHelper().getDetail(id)));
}
