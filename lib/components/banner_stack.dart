import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/cubit/movie_cubit.dart';
import 'package:flutter_app/screens/movie_screen.dart';
import 'package:flutter_app/state/movie_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BannerStack extends StatefulWidget {
  int selected;
  BannerStack({@required this.selected});

  @override
  _BannerStackState createState() => _BannerStackState();
}

class _BannerStackState extends State<BannerStack> {
  @override
  Widget build(BuildContext context) {
    MovieCubitState state = context.read<MovieCubit>().state;

    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: false,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            onPageChanged: (index, reason) {
              setState(() {
                widget.selected = index;
              });
            },
          ),
          items: state.movies.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BlocProvider<MovieCubit>.value(
                          value: BlocProvider.of<MovieCubit>(context),
                          child: MovieScreen(movieid: i.id),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500${i.imgUrl}'))),
                  ),
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          bottom: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: state.movies.map((i) {
              int index = state.movies.indexOf(i);
              return Container(
                width: 8,
                height: 8,
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                    color: index == widget.selected
                        ? Color.fromRGBO(255, 255, 255, 0.9)
                        : Color.fromRGBO(255, 255, 255, 0.4),
                    shape: BoxShape.circle),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
