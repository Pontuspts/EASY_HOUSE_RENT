import 'package:flutter/material.dart';
import 'package:EASY_HOUSE_FINDER/pages/home/info/index.dart';
import 'package:EASY_HOUSE_FINDER/widgets/search_bar/index.dart';

//homepage News Created a scrollable page with list view
class TabInfo extends StatefulWidget {
  const TabInfo({Key? key}) : super(key: key);

  @override
  State<TabInfo> createState() => _TabInfoState();
}

class _TabInfoState extends State<TabInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SearchBar(
          inputValue: '',
          onSearch: () {
            Navigator.of(context).pushNamed('search');
          },
        ),
      ),
      body: ListView(children: const [
        SizedBox(height: 15),
        Info(),
        Info(),
        Info(),
        Info(),
      ]),
    );
  }
}
