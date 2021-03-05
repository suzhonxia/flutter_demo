import 'package:flutter/material.dart';

class EmptyPage extends StatefulWidget {
  final String title;

  const EmptyPage(this.title, {Key key}) : super(key: key);

  @override
  _EmptyPageState createState() => _EmptyPageState();
}

class _EmptyPageState extends State<EmptyPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print("EmptyPage build = ${widget.title}");
    return Center(child: Text(widget.title));
  }
}
