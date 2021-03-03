import 'package:flutter/material.dart';

class EmptyPage extends StatefulWidget {
  final String title;

  const EmptyPage({Key key, this.title}) : super(key: key);

  @override
  _EmptyPageState createState() => _EmptyPageState();
}

class _EmptyPageState extends State<EmptyPage> {

  @override
  Widget build(BuildContext context) {
    print("EmptyPage build = ${widget.title}");
    return Center(child: Text(widget.title));
  }
}
