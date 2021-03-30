import 'package:flutter/material.dart';
import 'package:flutter_app/cubit/movie_cubit.dart';
import 'package:flutter_app/model/movie.dart';
import 'package:flutter_app/screens/movie_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieRow extends StatelessWidget {
  List<Movie> listMovies;
  String titleRow = '';

  MovieRow({@required this.listMovies, this.titleRow});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: titleRow != '',
          child: Container(
            margin: EdgeInsets.only(left: 17, right: 24, top: 21, bottom: 7),
            child: Text(
              '$titleRow',
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            margin: EdgeInsets.only(
              left: 12.0,
            ),
            child: Row(
              children: listMovies
                  .map(
                    (movie) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                BlocProvider<MovieCubit>.value(
                              value: BlocProvider.of<MovieCubit>(context),
                              child: MovieScreen(movieid: movie.id),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 110,
                        width: 73,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500${movie.imgUrl}'),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
