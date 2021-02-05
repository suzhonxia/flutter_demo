import 'package:flutter/material.dart';
import 'package:flutter_demo/r.dart';
import 'package:flutter_demo/tool/screenSize.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
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
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(R.assetsImgHomeBg),
          Column(
            children: [
              _createSearchBar(),
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _createBanner(),
                        Container(
                          width: ScreenSize.getScreenWidth(context),
                          height: 1300,
                          child: Center(
                            child: Text("滑动区域"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _createSearchBar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 15),
      width: ScreenSize.getScreenWidth(context),
      child: Row(
        children: [
          Image.asset(R.assetsImgIconHomeScan, width: 21, height: 21),
          Expanded(
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                color: Color(0xFFF1F1F1),
              ),
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 6),
                    child: Image.asset(R.assetsImgIconSearch, width: 14, height: 14),
                  ),
                  Text("搜索课程，作品，学员", style: TextStyle(color: Color(0xFFA1A1A1), fontSize: 14)),
                ],
              ),
            ),
          ),
          Image.asset(R.assetsImgIconHomeMessage, width: 21, height: 21),
        ],
      ),
    );
  }

  Widget _createBanner() {
    return Container(
      height: 200,
      color: Colors.red,
    );
  }
}
