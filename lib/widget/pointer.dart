import 'package:flutter/material.dart';

class SPointer extends StatefulWidget {
  const SPointer(this.size, this.selectIndex, {Key key}) : super(key: key);

  final int size;
  final int selectIndex;

  @override
  _SPointerState createState() => _SPointerState();
}

class _SPointerState extends State<SPointer> {
  @override
  Widget build(BuildContext context) {
    var item = (int index) {
      return Container(
        width: widget.selectIndex == index ? 12 : 4,
        height: 4,
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: widget.selectIndex == index ? Color(0xFFFFCC00) : Colors.white,
        ),
      );
    };

    return Positioned(
      right: 23,
      bottom: 18,
      child: Container(
        child: Row(
          children: List<Widget>.generate(widget.size, (index) => item(index)),
        ),
      ),
    );
  }
}
