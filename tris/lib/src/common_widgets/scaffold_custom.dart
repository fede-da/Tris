import 'package:flutter/material.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold(
      {Key? key,
      required this.widget,
      required this.title,
      this.hasAppBar = true})
      : super(key: key);
  final Widget widget;
  final String title;
  final bool hasAppBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: hasAppBar
          ? AppBar(
              title: Text(title),
            )
          : null,
      backgroundColor: Theme.of(context).primaryColor,
      body: widget,
    );
  }
}
