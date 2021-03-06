import 'package:flutter/material.dart';
import 'Place/ui/screens/home_trips.dart';
import 'User/ui/screens/profile_trips.dart';
import 'Search/ui/screens/search_trips.dart';

class PlatziTrips extends StatefulWidget {
  @override
  _PlatziTripsState createState() => _PlatziTripsState();
}

class _PlatziTripsState extends State<PlatziTrips> {
  int indexTap = 0;
  final List<Widget> widgetsChildren = [
    HomeTrips(),
    ProfileTrips(),
    SearchTrips()
  ];
  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetsChildren[indexTap],
      bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(canvasColor: Colors.white, primaryColor: Colors.blue),
          child: BottomNavigationBar(
              onTap: onTapTapped,
              currentIndex: indexTap,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle_rounded), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.search), label: '')
              ])),
    );
  }
}
