import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo/tool/screenSize.dart';
import 'package:flutter_demo/widget/pointer.dart';

class SBanner extends StatefulWidget {
  const SBanner({Key key, this.bannerList}) : super(key: key);

  final List<String> bannerList;

  @override
  _BannerState createState() => _BannerState();
}

class _BannerState extends State<SBanner> {
  Timer _timer;
  int _currentIndex;

  double _distance;
  ScrollController _controller;

  StateSetter _pointerState;

  @override
  void initState() {
    super.initState();
    _currentIndex = _getBannerList().length == 1 ? 0 : 1;
    _initTimer();
  }

  @override
  Widget build(BuildContext context) {
    var space = 16.0;
    var smart = false;
    var size = _getBannerList().length;
    var itemWidth = ScreenSize.getScreenWidth(context) - space * 2;
    var itemHeight = itemWidth * 456 / 1035;
    _distance = itemWidth + space / 2; // 单个item使用距离
    var item = (int index, String cover) {
      return Container(
        margin: EdgeInsets.only(
          left: index == 0 ? space : space / 2,
          right: index == size - 1 ? space : 0,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(cover, width: itemWidth, height: itemHeight, fit: BoxFit.cover),
        ),
      );
    };

    var direction = 0; // > 0 从右往左, < 0 从左往右
    var lastScrolledX = 0;
    _controller = new ScrollController(initialScrollOffset: _distance * _currentIndex);
    _controller.addListener(() {
      var scrolledX = _controller.offset.round();

      if (scrolledX != lastScrolledX) {
        direction = scrolledX - lastScrolledX;
        lastScrolledX = scrolledX;
      }
    });

    var handleTouch = () {
      var scrolledX = _controller.offset.round();
      var index = scrolledX ~/ _distance; // 屏幕中显示的最小的索引
      var offsetX = scrolledX % _distance;

      if (direction > 0) {
        // 往下一个滑动，如果滑动距离超过item尺寸的4/1，则滑动到下一个
        if (offsetX > (_distance / 4)) {
          _controller.animateTo((index + 1) * _distance, duration: Duration(milliseconds: 300), curve: Curves.ease);
        } else {
          _controller.animateTo(index * _distance, duration: Duration(milliseconds: 300), curve: Curves.ease);
        }
      } else if (direction < 0) {
        if (offsetX > (_distance / 4 * 3)) {
          _controller.animateTo((index + 1) * _distance, duration: Duration(milliseconds: 300), curve: Curves.ease);
        } else {
          _controller.animateTo(index * _distance, duration: Duration(milliseconds: 300), curve: Curves.ease);
        }
      }
    };

    return NotificationListener(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollStartNotification) {
          smart = true;
        }
        if (notification is ScrollEndNotification) {
          _currentIndex = _controller.offset.round() ~/ _distance;
          if (_controller.position.extentBefore == 0) {
            if (smart) {
              smart = false;
              _currentIndex = size - 2;
              _controller.jumpTo(_distance * (size - 2));
            }
          }
          if (_controller.position.extentAfter == 0) {
            if (smart) {
              smart = false;
              _currentIndex = 1;
              _controller.jumpTo(_distance);
            }
          }
          _initTimer();
          _pointerState(() {});
        }
        return false;
      },
      child: Listener(
        onPointerDown: (PointerDownEvent event) => _cancelTimer(),
        onPointerUp: (PointerUpEvent event) => handleTouch(),
        onPointerCancel: (PointerCancelEvent event) => handleTouch(),
        child: GestureDetector(
          onTap: () {
            _initTimer();
          },
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: SingleChildScrollView(
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _getBannerList()
                        .asMap()
                        .map((index, element) => MapEntry(index, item(index, element)))
                        .values
                        .toList(),
                  ),
                ),
              ),
              StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
                _pointerState = setState;
                return SPointer(_getRealSize(), _getRealIndex());
              }),
            ],
          ),
        ),
      ),
    );
  }

  int _getRealSize() {
    return widget.bannerList.length;
  }

  int _getRealIndex() {
    var realSize = widget.bannerList.length;
    if (realSize <= 1) {
      return 0;
    } else {
      if (_currentIndex == 0) {
        return realSize - 1;
      } else if (_currentIndex == realSize + 1) {
        return 0;
      } else {
        return _currentIndex - 1;
      }
    }
  }

  List<String> _getBannerList() {
    var list = new List<String>();
    list.addAll(widget.bannerList);

    if (list.length > 1) {
      list.add(list[0]);
      list.insert(0, list[list.length - 2]);
    }
    return list;
  }

  // 滚动到指定索引
  _goToIndex() {
    _controller.animateTo(_currentIndex * _distance, duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  // 设置轮播定时器
  _initTimer() {
    if (_timer == null) {
      _timer = Timer.periodic(
        Duration(seconds: 3),
        (t) {
          var length = _getBannerList().length;
          if (_currentIndex % length == length - 1) {
            return _timer = null;
          }
          _currentIndex = (_currentIndex + 1) % length;
          _goToIndex();
        },
      );
    }
  }

  // 手动滑动的时候取消定时器
  _cancelTimer() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
  }
}