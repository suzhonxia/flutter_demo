import 'package:flutter/material.dart';
import 'package:flutter_demo/tool/screenSize.dart';

class SBanner extends StatefulWidget {
  const SBanner({Key key, this.bannerList}) : super(key: key);

  final List<String> bannerList;

  @override
  _BannerState createState() => _BannerState();
}

class _BannerState extends State<SBanner> {
  List<String> _getBannerList() {
    var list = new List<String>();
    list.addAll(widget.bannerList);

    if (list.length > 1) {
      list.add(list[0]);
      list.insert(0, list[list.length - 2]);
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    var space = 16.0;
    var smart = false;
    var size = _getBannerList().length;
    var itemWidth = ScreenSize.getScreenWidth(context) - space * 2;
    var itemHeight = itemWidth * 456 / 1035;
    var distance = itemWidth + space / 2; // 单个item使用距离
    var item = (int index, String cover) {
      return Container(
        margin: EdgeInsets.only(
          left: index == 0 ? space : space / 2,
          right: index == size - 1 ? space : 0,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(cover, width: itemWidth, height: itemHeight, fit: BoxFit.fitWidth),
        ),
      );
    };

    var direction = 0; // > 0 从右往左, < 0 从左往右
    var lastScrolledX = 0;
    var _controller = new ScrollController(initialScrollOffset: size == 1 ? 0 : distance);
    _controller.addListener(() {
      var scrolledX = _controller.offset.round();

      if (scrolledX != lastScrolledX) {
        direction = scrolledX - lastScrolledX;
        lastScrolledX = scrolledX;
      }
    });

    var handleTouch = () {
      var scrolledX = _controller.offset.round();
      var index = scrolledX ~/ distance; // 屏幕中显示的最小的索引
      var offsetX = scrolledX % distance;

      if (direction > 0) {
        // 往下一个滑动，如果滑动距离超过item尺寸的4/1，则滑动到下一个
        if (offsetX > (distance / 4)) {
          _controller.animateTo((index + 1) * distance, duration: Duration(milliseconds: 300), curve: Curves.ease);
        } else {
          _controller.animateTo(index * distance, duration: Duration(milliseconds: 300), curve: Curves.ease);
        }
      } else if (direction < 0) {
        if (offsetX > (distance / 4 * 3)) {
          _controller.animateTo((index + 1) * distance, duration: Duration(milliseconds: 300), curve: Curves.ease);
        } else {
          _controller.animateTo(index * distance, duration: Duration(milliseconds: 300), curve: Curves.ease);
        }
      }
    };

    return NotificationListener(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollStartNotification) {
          smart = true;
        }
        if (notification is ScrollEndNotification) {
          if (_controller.position.extentBefore == 0) {
            if (smart) {
              smart = false;
              _controller.jumpTo(distance * (size - 2));
            }
          }
          if (_controller.position.extentAfter == 0) {
            if (smart) {
              smart = false;
              _controller.jumpTo(distance);
            }
          }
        }
        return false;
      },
      child: Listener(
        onPointerUp: (PointerUpEvent event) => handleTouch(),
        onPointerCancel: (PointerCancelEvent event) => handleTouch(),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: SingleChildScrollView(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            child: Row(
              children:
              _getBannerList().asMap().map((index, element) => MapEntry(index, item(index, element))).values.toList(),
            ),
          ),
        ),
      ),
    );
  }
}
