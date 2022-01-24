import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/src/core/constants/color_constants.dart';
import 'package:weather_app/src/ui/home/page/home_page.dart';
import 'package:weather_app/src/ui/search/page/search_page.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({Key? key}) : super(key: key);

  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  int _currentPage = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const SearchPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child:  _widgetOptions.elementAt(_currentPage),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentPage,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ColorConstants.dark,
          unselectedItemColor: Colors.grey,
          iconSize: 30.0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              backgroundColor: Colors.white,
              label: ""
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: ""
            ),
          ],
          onTap: (index){
            setState(() {
              _currentPage = index;
              print(_currentPage);
            });
          },
        ),
      ),
    );
  }
}