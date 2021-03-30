import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/api/api_helper.dart';
import 'package:flutter_app/components/bottom_navbar.dart';
import 'package:flutter_app/components/movie_row.dart';
import 'package:flutter_app/cubit/movie_cubit.dart';
import 'package:flutter_app/model/detail.dart';
import 'package:flutter_app/state/movie_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

const String imgUrl =
    'https://images.indianexpress.com/2020/07/tenet-release-759.jpg';

String synopsys =
    'Armed with only one word, Tenet, and fighting for the survival of the entire world, a Protagonist journeys through a twilight world of international espionage on a mission that will unfold in something beyond real time.';
String title = 'TENET';
String info = '2020 - Action/Sci-Fi - 2h 30m';

class MovieScreen extends StatefulWidget {
  final int movieid;

  MovieScreen({Key key, @required this.movieid}) : super(key: key);

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  Detail detail;

  void initializeScreen() async {
    var detail_wait = await ApiHelper().getDetail(widget.movieid);
    setState(() {
      detail = detail_wait;
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    initializeScreen();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(23, 20, 20, 1),
        body: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            SliverAppBar(
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    decoration: BoxDecoration(
                        image: detail != null
                            ? DecorationImage(
                                image: NetworkImage(
                                    "https://image.tmdb.org/t/p/w500${detail.imgUrl}"),
                                fit: BoxFit.cover)
                            : null),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.play_arrow_rounded,
                          size: 68,
                        )
                      ],
                    ),
                  )),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    margin:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                    padding:
                        EdgeInsets.symmetric(horizontal: 19, vertical: 9.0),
                    child: Text(
                      'Download',
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 55.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 11.0),
                          child: Column(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.favorite_border,
                                  size: 24.0,
                                ),
                                onPressed: () {},
                              ),
                              Text(
                                'Favorite',
                                style: GoogleFonts.poppins(
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 11.0),
                          child: Column(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.ios_share,
                                  size: 24.0,
                                ),
                                onPressed: () {},
                              ),
                              Text(
                                'Share',
                                style: GoogleFonts.poppins(
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        '${detail != null ? detail.title : ""}',
                        style: GoogleFonts.montserrat(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 2.0),
                    ),
                    Container(
                      child: Text(
                        '${detail != null ? detail.info : ""}',
                        style: GoogleFonts.poppins(
                            fontSize: 10, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        '${detail != null ? detail.synopsys : ""}',
                        style: GoogleFonts.poppins(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,
                            height: 2),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(
                  'You Might Like This',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                  ),
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 15,
              ),
              BlocBuilder<MovieCubit, MovieCubitState>(
                  builder: (context, state) {
                return Column(
                  children: [
                    MovieRow(
                      listMovies: state.latestMovies,
                      titleRow: '',
                    ),
                  ],
                );
              })
            ]))
          ],
        ),
        bottomNavigationBar: BottomNavbar(),
      ),
    );
  }
}

// Container(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Container(
// height: 30,
// child: Text(
// 'Cast',
// style: GoogleFonts.poppins(
// fontSize: 20, fontWeight: FontWeight.w400),
// ),
// ),
// SizedBox(
// height: 7,
// ),
// Row(
// children: [
// Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// CircleAvatar(
// maxRadius: 22,
// backgroundImage: NetworkImage(
// 'https://m.media-amazon.com/images/M/MV5BOTY4NDcyNDM5OF5BMl5BanBnXkFtZTgwMjk4Mzk0NTM@._V1_.jpg'),
// ),
// SizedBox(
// height: 7,
// ),
// Container(
// width: 67.0,
// child: Text(
// 'John David Washington',
// textAlign: TextAlign.center,
// style: GoogleFonts.poppins(
// fontSize: 10,
// ),
// ),
// ),
// ],
// ),
// ],
// ),
// ],
// ),
// ),
