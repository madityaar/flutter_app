import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.white,
      unselectedItemColor: Colors.white,
      iconSize: 20.0,
      selectedLabelStyle:
          GoogleFonts.poppins(fontSize: 8, fontWeight: FontWeight.w400),
      unselectedLabelStyle:
          GoogleFonts.poppins(fontSize: 8, fontWeight: FontWeight.w400),
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.movie),
          label: 'Coming Soon',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.download_sharp),
          label: 'Download',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
