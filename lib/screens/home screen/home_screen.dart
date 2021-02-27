import 'package:contractions_counter_flutter/constants.dart';
import 'package:contractions_counter_flutter/screens/home%20screen/counting_screen.dart';
import 'package:contractions_counter_flutter/screens/reports%20screen/reports_screen.dart';
import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [CountingScreen(), ReportsScreen()];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(_currentIndex);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Contraction Counter"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.comment),
              tooltip: 'Comment Icon',
              onPressed: () {},
            ), //IconButton
            IconButton(
              icon: Icon(Icons.settings),
              tooltip: 'Setting Icon',
              onPressed: () {},
            ), //IconButton
          ], //<Widget>[]
          backgroundColor: kPrimaryColor,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Menu Icon',
            onPressed: () {},
          ), //IconButton
          brightness: Brightness.dark,
        ),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: kActionPurpleColor,
        //   foregroundColor: Colors.white,
        //   child: Icon(
        //     Icons.add,
        //     size: 38.0,
        //   ),
        //   onPressed: () {},
        // ),
        body: _children[_currentIndex],

        // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BubbleBottomBar(
          // hasNotch: true,
          // fabLocation: BubbleBottomBarFabLocation.end,
          opacity: .1,
          backgroundColor: kSecondaryColor,
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          elevation: 8,
          items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(
                backgroundColor: Colors.white,
                icon: Icon(
                  Icons.dashboard,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.dashboard,
                  color: Colors.white,
                ),
                title: Text("Home")),
            BubbleBottomBarItem(
                backgroundColor: Colors.white,
                icon: Icon(
                  Icons.bookmark_border,
                  color: Colors.white,
                ),
                activeIcon: Icon(
                  Icons.bookmark_border_rounded,
                  color: Colors.white,
                ),
                title: Text("Reports")),
          ],
        ),
      ),
    );
  }
}
