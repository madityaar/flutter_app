import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/banner_stack.dart';
import 'package:flutter_app/components/bottom_navbar.dart';
import 'package:flutter_app/components/movie_row.dart';
import 'package:flutter_app/cubit/movie_cubit.dart';
import 'package:flutter_app/state/movie_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void initializeScreen() async {
    await context.read<MovieCubit>().getData();
  }

  int selected = 0;

  @override
  void initState() {
    // TODO: implement initState
    initializeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<MovieCubit, MovieCubitState>(
              builder: (context, state) {
            return Column(children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Cinephile',
                  style: GoogleFonts.montserrat(
                      fontSize: 24, fontWeight: FontWeight.w700),
                ),
              ),
              BannerStack(
                selected: selected,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: 24, right: 24, top: 21, bottom: 7),
                    child: Text(
                      'Genre',
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      margin: EdgeInsets.only(left: 11.5),
                      child: Row(
                        children: state.genres
                            .map((i) => Container(
                                  alignment: AlignmentDirectional.center,
                                  height: 23,
                                  margin: EdgeInsets.symmetric(horizontal: 5.5),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.0),
                                    child: Text(
                                      '${i.genreName}',
                                      style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
              MovieRow(
                listMovies: state.latestMovies,
                titleRow: 'New Release',
              ),
              MovieRow(
                listMovies: state.popularMovies,
                titleRow: 'Popular Movie',
              ),
            ]);
          }),
        ),
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}
