import 'package:flutter/material.dart';
import 'package:flutter_app/cubit/movie_cubit.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieCubit>(
      create: (context) => MovieCubit(),
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
          bottomNavigationBarTheme:
              BottomNavigationBarThemeData(backgroundColor: Colors.black),
        ),
        title: 'Cinephile',
        home: HomeScreen(),
      ),
    );
  }
}
