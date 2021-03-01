import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_demo/r.dart';
import 'package:flutter_demo/tool/screenSize.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:date_format/date_format.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  EasyRefreshController _controller = EasyRefreshController();

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
                child: EasyRefresh(
                  controller: _controller,
                  header: MaterialHeader(),
                  onRefresh: () async {},
                  child: _createHomeBody(),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _createHomeBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _createBanner(),
          _createNotice(),
          _createCategory(),
          _createPoster(),
          _createPremium(),
          _createSystem(),
          _createPart(),
          _createEduc(),
          _createMatch(),
          _createNews(),
          _createEndTip(),
        ],
      ),
    );
  }

  Widget _createTitleBar(String title, String more, {Function moreClick}) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(title, style: TextStyle(fontSize: 18, color: Color(0xFF404040), fontWeight: FontWeight.bold)),
          ),
          Expanded(child: Container()),
          GestureDetector(
            onTap: moreClick,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: more.isNotEmpty
                  ? Text.rich(
                      TextSpan(children: [
                        TextSpan(text: more),
                        WidgetSpan(
                          child: Container(
                            margin: EdgeInsets.only(left: 4),
                            child: Image.asset(R.assetsImgIconHomeMore, width: 10),
                          ),
                        )
                      ]),
                      style: TextStyle(fontSize: 15, color: Color(0xFFFFC613)),
                    )
                  : Container(),
            ),
          ),
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

  Widget _createNotice() {
    return Container(
      margin: EdgeInsets.only(top: 6),
      padding: EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8),
      child: Row(
        children: [
          Image.asset(R.assetsImgIconHomeNotice, width: 20, height: 20),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 6),
              child: Text.rich(
                TextSpan(children: [
                  TextSpan(text: "公告:课程总数为"),
                  TextSpan(text: "217", style: TextStyle(color: Color(0xFFFC650D))),
                  TextSpan(text: "个，截止到${formatDate(DateTime.now(), [yyyy, '年', mm, '月', dd, '日'])}"),
                ]),
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14, color: Color(0xFF404040)),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _createCategory() {
    var item = (String src, String text) {
      return Expanded(
        child: Container(
          padding: EdgeInsets.only(top: 12, bottom: 10),
          child: Column(
            children: [
              Container(padding: EdgeInsets.all(6), child: Image.asset(src, width: 55)),
              Text(text, style: TextStyle(fontSize: 14, color: Color(0xFF666666)))
            ],
          ),
        ),
        flex: 1,
      );
    };

    return Row(
      children: [
        item(R.assetsImgIconCourse1, "磁力片"),
        item(R.assetsImgIconCourse2, "大颗粒"),
        item(R.assetsImgIconCourse3, "小颗粒"),
        item(R.assetsImgIconCourse4, "编程")
      ],
    );
  }

  Widget _createPoster() {
    return Container(
      margin: EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Image.asset(R.assetsImgImgPoster),
    );
  }

  Widget _createPremium() {
    return Column(
      children: [
        _createTitleBar("精品付费课", "查看全部"),
      ],
    );
  }

  Widget _createSystem() {
    return Column(
      children: [
        _createTitleBar("课程体系", ""),
      ],
    );
  }

  Widget _createPart() {
    return Column(
      children: [
        _createTitleBar("配件体系课", "查看全部"),
      ],
    );
  }

  Widget _createEduc() {
    return Column(
      children: [
        _createTitleBar("亲职教育", ""),
      ],
    );
  }

  Widget _createMatch() {
    return Column(
      children: [
        _createTitleBar("竞赛", "查看全部"),
      ],
    );
  }

  Widget _createNews() {
    var item = (String title, bool isTop, String date, String readNum) {
      return Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Text.rich(
                TextSpan(children: [
                  isTop
                      ? WidgetSpan(
                          child: Container(
                            margin: EdgeInsets.only(right: 4),
                            child: Image.asset(R.assetsImgIconNewsTop, width: 40),
                          ),
                          alignment: PlaceholderAlignment.middle,
                        )
                      : TextSpan(text: ""),
                  TextSpan(
                    text: title,
                    style: TextStyle(color: Color(0xFF404040), fontSize: 15),
                  )
                ]),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  Text.rich(
                    TextSpan(children: [
                      WidgetSpan(
                        child: Container(
                          margin: EdgeInsets.only(right: 2),
                          child: Image.asset(R.assetsImgIconCourseDate, width: 15),
                        ),
                      ),
                      TextSpan(text: date, style: TextStyle(color: Color(0xFF999999), fontSize: 14)),
                    ]),
                  ),
                  Spacer(),
                  Text.rich(
                    TextSpan(children: [
                      WidgetSpan(
                        child: Container(
                          margin: EdgeInsets.only(right: 2),
                          child: Image.asset(R.assetsImgIconRead, width: 15),
                        ),
                      ),
                      TextSpan(text: readNum, style: TextStyle(color: Color(0xFF999999), fontSize: 14)),
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    };

    return Column(
      children: [
        _createTitleBar("学院资讯", "更多"),
        Card(
          color: Colors.white,
          elevation: 2,
          margin: const EdgeInsets.all(15),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Column(
            children: [
              item("关于磁力片边缘飞边瑕疵的工艺说明疵的工艺说明疵的工艺说明", true, "2020-02-27", "11674"),
              item("App小程序正式启用通知", false, "2019-12-09", "3157"),
              item("App使用方法", false, "2019-11-05", "1374"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _createEndTip() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Expanded(child: Container(height: 1, color: Color(0xFFF1F1F1), margin: EdgeInsets.only(right: 8))),
          Text("您已经到了世界的边缘了哦!", style: TextStyle(fontSize: 14, color: Color(0xFFD1D1D1))),
          Expanded(child: Container(height: 1, color: Color(0xFFF1F1F1), margin: EdgeInsets.only(left: 8))),
        ],
      ),
    );
  }
}
