import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  final String title;

  EmptyPage(this.title, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(title));
  }
}
