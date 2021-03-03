import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_demo/r.dart';
import 'package:flutter_demo/tool/screenSize.dart';
import 'package:flutter_demo/widget/banner.dart';
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
                  ? Text.rich(TextSpan(
                      style: TextStyle(fontSize: 15, color: Color(0xFFFFC613)),
                      children: [
                        TextSpan(text: more),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Container(
                            margin: EdgeInsets.only(left: 6),
                            child: Image.asset(R.assetsImgIconHomeMore, width: 10),
                          ),
                        )
                      ],
                    ))
                  : Container(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createBottomMore(String more, {Function moreClick}) {
    return GestureDetector(
      onTap: moreClick,
      child: Container(
        width: 150,
        height: 35,
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(18), color: Color(0xFFFFF3D0)),
        child: Text.rich(TextSpan(
          style: TextStyle(color: Color(0xFFFFC613), fontSize: 15),
          children: [
            TextSpan(text: more),
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child:
                  Container(margin: EdgeInsets.only(left: 6), child: Image.asset(R.assetsImgIconHomeMore, width: 10)),
            ),
          ],
        )),
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
    return SBanner(bannerList: [
      R.assetsImgImgBanner1,
      // R.assetsImgImgBanner2,
      // R.assetsImgImgBanner3,
      // R.assetsImgImgBanner4,
      // R.assetsImgImgBanner5,
    ]);
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
    var item = (int index, String title, String label, String cover, String salePrice, String originalPrice) {
      return Container(
        margin: EdgeInsets.only(top: index == 0 ? 0 : 15, left: 15, right: 15),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(6)),
                child: Image.asset(cover, width: double.infinity),
              ),
            ),
            Container(
              height: 18,
              margin: const EdgeInsets.only(left: 15),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Color(0xFFED4F3E),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Text(label, style: TextStyle(fontSize: 12, color: Colors.white)),
            ),
            Card(
              elevation: 2,
              color: Colors.white,
              margin: EdgeInsets.only(top: (ScreenSize.getScreenWidth(context) - 60) * 0.45),
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Container(
                width: double.infinity,
                alignment: Alignment.topLeft,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 15, color: Color(0xFF404040), fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 6),
                      child: Text.rich(TextSpan(
                        children: [
                          TextSpan(
                              text: salePrice,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              )),
                          WidgetSpan(child: Container(width: 10)),
                          TextSpan(
                              text: originalPrice,
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF999999),
                                decoration: TextDecoration.lineThrough,
                              )),
                        ],
                      )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    };

    return Column(
      children: [
        _createTitleBar("精品付费课", "查看全部"),
        item(0, "磁力星球 早教课", "早教益智", R.assetsImgImgHomePremium1, "¥199", "¥298"),
        item(1, "大颗粒创意机械课 探索机械结构原理", "创意机械", R.assetsImgImgHomePremium2, "¥297", "¥699"),
      ],
    );
  }

  Widget _createSystem() {
    var item = (int index, String title, String cover, List<String> tagList) {
      return Card(
        elevation: 2,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        margin: EdgeInsets.only(top: index == 0 ? 0 : 15, left: 15, right: 15),
        child: Container(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(cover, width: 115, height: 64),
              ),
              Container(
                height: 64,
                margin: EdgeInsets.only(left: 15),
                child: Column(
                  children: [
                    Container(
                      width: 170,
                      child: Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          height: 1.2,
                          fontSize: 15,
                          color: Color(0xFF404040),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: 170,
                      height: 20,
                      margin: EdgeInsets.only(top: 8),
                      child: Wrap(
                        spacing: 6.0,
                        children: tagList.map((e) => _createCourseTag(e)).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    };

    return Column(
      children: [
        _createTitleBar("课程体系", ""),
        item(0, "融合积木 手工 亲子游戏的趣味立体式阅读课", R.assetsImgImgHomeSeries1, ["亲子阅读", "益智建构", "绘本"]),
        item(1, "科学探索全能专家课 实现静态到电动全覆盖", R.assetsImgImgHomeSeries2, ["科学启蒙", "适用314件"]),
        item(2, "大颗粒编程启蒙学习课程 开发思维潜能", R.assetsImgImgHomeSeries3, ["153件", "实物编程"]),
        _createBottomMore("查看全部"),
      ],
    );
  }

  Widget _createPart() {
    var item = (String title, String cover, List<String> tagList) {
      return Card(
        elevation: 2,
        color: Colors.white,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              ClipRRect(child: Image.asset(cover), borderRadius: BorderRadius.circular(5)),
              Container(
                margin: EdgeInsets.only(top: 12),
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15, color: Color(0xFF404040), fontWeight: FontWeight.bold, height: 1.2),
                ),
              ),
              Container(
                width: double.infinity,
                height: 20,
                margin: EdgeInsets.only(top: 8),
                child: Wrap(
                  spacing: 6.0,
                  children: tagList.map((e) => _createCourseTag(e)).toList(),
                ),
              ),
            ],
          ),
        ),
      );
    };

    return Column(
      children: [
        _createTitleBar("配件体系课", "查看全部"),
        GridView.builder(
          itemCount: 2,
          padding: EdgeInsets.only(top: 0, left: 15, right: 15),
          // 内容适配，不加则高度无限
          shrinkWrap: true,
          // 屏蔽GridView 内部滑动
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.8675,
          ),
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return item("酷卡侠 电动编程主机 学习编程", R.assetsImgImgHomePart1, ["实物编程", "逻辑思维", "计算机思维"]);
            } else {
              return item("酷卡侠电机家族学习课程", R.assetsImgImgHomePart2, ["动力机械", "电动工程"]);
            }
          },
        ),
      ],
    );
  }

  Widget _createEduc() {
    var item = (int index, String title, String readNum, String cover) {
      return Card(
        elevation: 2,
        color: Colors.white,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
        margin: EdgeInsets.only(
          top: 4,
          left: index == 0 ? 15 : 0,
          right: 15,
          bottom: 4,
        ),
        child: Container(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Container(
                // 屏幕宽度 * 0.6 - 封面宽度 - 间距
                width: ScreenSize.getScreenWidth(context) * 0.6 - 68 - 45,
                height: 68,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 15, color: Color(0xFF404040), fontWeight: FontWeight.bold),
                      ),
                    ),
                    Spacer(),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        readNum,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 13, color: Color(0xFF999999)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: ClipRRect(child: Image.asset(cover, width: 68), borderRadius: BorderRadius.circular(5)),
              ),
            ],
          ),
        ),
      );
    };

    return Column(
      children: [
        _createTitleBar("亲职教育", ""),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              item(0, "【2-3岁】磁力片亲职教育课程", "3.6万人学习过", R.assetsImgImgHomeEduc1),
              item(1, "【3-4岁】磁力片亲职教育课程", "1.9万人学习过", R.assetsImgImgHomeEduc2),
              item(2, "【4-6岁】磁力片亲职教育课程", "1.4万人学习过", R.assetsImgImgHomeEduc3),
            ],
          ),
        ),
      ],
    );
  }

  Widget _createMatch() {
    var item = (String cover, String title, String status) {
      return Container(
        margin: EdgeInsets.only(top: 15),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(6)),
                    child: Image.asset(cover, width: double.infinity),
                  ),
                ),
                Container(
                  height: 18,
                  margin: const EdgeInsets.only(left: 30),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Color(0xFFE5E5E5),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(6),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Text(status, style: TextStyle(fontSize: 12, color: Color(0xFF404040))),
                )
              ],
            ),
            Card(
              color: Colors.white,
              elevation: 2,
              margin: EdgeInsets.only(left: 15, right: 15),
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(15),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 16, color: Color(0xFF404040), fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      );
    };

    return Column(
      children: [
        _createTitleBar("竞赛", "查看全部"),
        item(R.assetsImgImgHomeContest, "创意造型PK", "海选已结束"),
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
          margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
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

  Widget _createCourseTag(String tag) {
    return Container(
      height: 20,
      width: (tag.length * 10 + 16.0),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        color: Color(0xFFFFF4D0),
      ),
      child: Text(tag, style: TextStyle(fontSize: 10, color: Color(0xFFFFA200))),
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
