import 'package:flutter/material.dart';

class PageContent extends StatelessWidget {
  final String name;

  const PageContent({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('This is：$name page')),
      body: Center(
        child: Text('This is $name page, sorry u cant see'),
      ),
    );
  }
}
