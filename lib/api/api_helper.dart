import 'dart:convert';

import 'package:flutter_app/model/detail.dart';
import 'package:flutter_app/model/genre.dart';
import 'package:flutter_app/model/movie.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class ApiHelper {
  final String url = 'https://api.themoviedb.org/3';
  final String apiKey = '72d336f5341037d93d0316042364dc39';

  Future<List<Movie>> getMovieBanner() async {
    List<Movie> movies = [];
    String urlExt = '/movie/now_playing?api_key=$apiKey&language=en-US&page=1';
    dynamic response = await http.get('$url$urlExt');
    dynamic resultsDecoded = await jsonDecode(response.body.toString());
    for (dynamic index in await resultsDecoded['results']) {
      if (resultsDecoded['results'].indexOf(index) > 4) {
        break;
      }
      movies.add(Movie(
          id: index['id'],
          title: index['title'],
          imgUrl: index['backdrop_path']));
    }

    return movies;
  }

  Future<List<Movie>> getLatestMovie() async {
    List<Movie> latestMovies = [];
    String urlExt = '/movie/now_playing?api_key=$apiKey&language=en-US&page=1';
    dynamic response = await http.get('$url$urlExt');
    dynamic resultsDecoded = await jsonDecode(response.body.toString());
    for (dynamic index in await resultsDecoded['results']) {
      latestMovies.add(Movie(
          id: index['id'],
          title: index['title'],
          imgUrl: index['poster_path']));
    }

    return latestMovies;
  }

  Future<List<Movie>> getPopularMovie() async {
    List<Movie> popularMovies = [];
    String urlExt = '/movie/popular?api_key=$apiKey&language=en-US&page=1';
    dynamic response = await http.get('$url$urlExt');
    dynamic resultsDecoded = await jsonDecode(response.body.toString());
    for (dynamic index in await resultsDecoded['results']) {
      popularMovies.add(Movie(
          id: index['id'],
          title: index['title'],
          imgUrl: index['poster_path']));
    }

    return popularMovies;
  }

  Future<List<Genre>> getGenre() async {
    List<Genre> genres = [];
    String urlExt = '/genre/movie/list?api_key=$apiKey&language=en-US';
    dynamic response = await http.get('$url$urlExt');
    dynamic resultsDecoded = await jsonDecode(response.body.toString());
    for (dynamic index in await resultsDecoded['genres']) {
      genres.add(Genre(id: index['id'].toString(), genreName: index['name']));
    }
    return genres;
  }

  Future<Detail> getDetail(int id) async {
    Detail detail = Detail(
      imgUrl: '',
      synopsys: '',
      title: '',
      info: '',
    );
    String genre_combined = '';
    String info = '';
    String runtime = '';

    dynamic response =
        await http.get('$url/movie/$id?api_key=$apiKey&language=en-US');
    dynamic resultsDecoded = await jsonDecode(response.body.toString());
    for (dynamic genre in resultsDecoded['genres']) {
      genre_combined = join(genre_combined, genre['name']);
    }

    runtime =
        '${(resultsDecoded["runtime"] / 60).floor()} h ${resultsDecoded["runtime"] % 60} m';
    info =
        '${resultsDecoded["release_date"].substring(0, 4)} - $genre_combined - $runtime';
    detail = Detail(
        imgUrl: resultsDecoded["backdrop_path"],
        title: resultsDecoded["original_title"],
        synopsys: resultsDecoded["overview"],
        info: info);
    return detail;
  }
}
