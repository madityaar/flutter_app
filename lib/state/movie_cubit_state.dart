import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/detail.dart';
import 'package:flutter_app/model/genre.dart';
import 'package:flutter_app/model/movie.dart';

@immutable
abstract class MovieCubitState extends Equatable {
  final List<Movie> movies;
  final List<Genre> genres;
  final List<Movie> latestMovies;
  final List<Movie> popularMovies;
  final Detail detail;

  const MovieCubitState(
      {this.movies,
      this.genres,
      this.latestMovies,
      this.popularMovies,
      this.detail});

  @override
  // TODO: implement props
  List<Object> get props =>
      [movies, genres, latestMovies, popularMovies, detail];
}
