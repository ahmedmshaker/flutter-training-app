import 'package:flutter/material.dart';
import 'feed.dart';
import 'trends.dart';
import 'community.dart';
import 'DatePickerDialog.dart';


void main() {
  runApp(new LimeApp());
}

/// Returns the color scheme used by lime
MaterialColor limeColor() {
  return new MaterialColor(0xFF0498C1, {
    50: new Color(0xFFE1F3F8),
    100: new Color(0xFFB4E0EC),
    200: new Color(0xFF82CCE0),
    300: new Color(0xFF4FB7D4),
    400: new Color(0xFF2AA7CA),
    500: new Color(0xFF0498C1),
    600: new Color(0xFF0390BB),
    700: new Color(0xFF0385B3),
    800: new Color(0xFF027BAB),
    900: new Color(0xFF016A9E)
  });
}

class LimeApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Lime',
      theme: new ThemeData(
          primarySwatch: limeColor(),
          scaffoldBackgroundColor: Colors.white,
          primaryColor: limeColor(), backgroundColor: Colors.white),
      home: new MainPage(),
      showPerformanceOverlay: false,
    );
  }

  @override
  void selectedDate(String date) {

  }
}

class MainPage extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return new _MainPageState();
  }
}

class _MainPageState extends State<MainPage>
    implements FloatingButtonClick {


  PageController pageController;
  int page = 1;
  double mOpacity = 0.0;
  String count = "0";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        body: new PageView(
            children: [


              new Trends(key: new Key("TRENDS")),
              new Community(floatingButtonClick: this,),
              new Feed()
            ],
            controller: pageController,
            onPageChanged: onPageChanged
        ),
        bottomNavigationBar: new BottomNavigationBar(
          items: [
            new BottomNavigationBarItem(
              icon: new Stack(
                  children: <Widget>[
                    new Icon(Icons.home),
                    new Positioned( // draw a red marble
                      top: 0.0,
                      right: 0.0,
                      child: new Icon(Icons.brightness_1, size: 8.0,
                          color: Colors.redAccent),
                    )
                  ]
              ),
              title: new Text("trends"),
            ),
            new BottomNavigationBarItem(
                icon: new Stack(
                  children: <Widget>[
                    new Icon(Icons.notifications),
                    new Positioned(
                      top: -1.0,
                      right: -2.0,
                      child: new Opacity(opacity: mOpacity,
                        child: new Stack(
                          children: <Widget>[
                            new Icon(Icons.brightness_1,
                                size: 18.0, color: Colors.red[800]),
                            new Positioned(
                              top: 2.0,
                              left: 2.0,
                              child: new Center(

                                child: new Text(count,

                                    style: new TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0,

                                        fontWeight: FontWeight.w500)),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
                , title: new Text("feed")),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.people), title: new Text("community"))
          ],
          onTap: onTap,
          currentIndex: page,
          type: BottomNavigationBarType.fixed,
        )
    );
  }

  @override
  void initState() {
    super.initState();


    pageController = new PageController(initialPage: this.page);
  }


  void onTap(int index) {
    pageController.animateToPage(
        index, duration: const Duration(milliseconds: 300),
        curve: Curves.ease);
  }

  void onPageChanged(int page) {
    setState(() {
      this.page = page;
    });
  }

  @override
  void onFloatingClicked(int count) {
    setState(() {
      mOpacity = count > 0 ? 1.0 : 0.0;
      this.count = count.toString();
    });
  }




}
