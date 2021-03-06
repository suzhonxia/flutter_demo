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
  int _currentIndex = 0;
  PageController _pageController;
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
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _createNavBar(),
      body: _createPageBody(),
    );
  }

  BottomNavigationBar _createNavBar() {
    return BottomNavigationBar(
      items: bottomNavItems,
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black,
      selectedIconTheme: IconThemeData(color: Colors.blue, size: 24),
      unselectedIconTheme: IconThemeData(color: Colors.black, size: 24),
      selectedLabelStyle: TextStyle(color: Colors.blue, fontSize: 12),
      unselectedLabelStyle: TextStyle(color: Colors.black, fontSize: 12),
      onTap: _changePage,
    );
  }

  Widget _createPageBody() {
    return PageView(
      children: pages,
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
    );
  }

  void _changePage(int index) {
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
        _pageController.jumpToPage(_currentIndex);
      });
    }
  }
}
