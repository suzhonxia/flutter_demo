import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/page/emptyPage.dart';
import 'package:flutter_demo/page/homePage.dart';
import 'package:flutter_demo/tool/statusBar.dart';

final titles = ["首页", "课程", "消息", "我的"];

void main() {
  runApp(MyApp());

  SystemChrome.setSystemUIOverlayStyle(StatusBar.dark);
}

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        accentColor: Color(0xFFFFC613),
        primaryColor: Colors.white,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  final pages = [HomePage(), EmptyPage(titles[1]), EmptyPage(titles[2]), EmptyPage(titles[3])];
  final bottomNavItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: titles[0]),
    BottomNavigationBarItem(icon: Icon(Icons.book), label: titles[1]),
    BottomNavigationBarItem(icon: Icon(Icons.message), label: titles[2]),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: titles[3]),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: createNavBar(),
      body: pages[currentIndex],
    );
  }

  BottomNavigationBar createNavBar() {
    return BottomNavigationBar(
      items: bottomNavItems,
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black,
      selectedIconTheme: IconThemeData(color: Colors.blue, size: 24),
      unselectedIconTheme: IconThemeData(color: Colors.black, size: 24),
      selectedLabelStyle: TextStyle(color: Colors.blue, fontSize: 12),
      unselectedLabelStyle: TextStyle(color: Colors.black, fontSize: 12),
      onTap: (index) {
        _changePage(index);
      },
    );
  }

  void _changePage(int index) {
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
    }
  }
}
