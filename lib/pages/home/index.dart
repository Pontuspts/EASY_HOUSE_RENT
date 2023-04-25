import 'package:flutter/material.dart';
import 'package:EASY_HOUSE_FINDER/pages/home/tab_index/index.dart';
import 'package:EASY_HOUSE_FINDER/pages/home/tab_info/index.dart';
import 'package:EASY_HOUSE_FINDER/pages/home/tab_profile/index.dart';
import 'package:EASY_HOUSE_FINDER/pages/home/tab_search/index.dart';
import 'package:EASY_HOUSE_FINDER/tools/AppUtil.dart';
import 'package:EASY_HOUSE_FINDER/tools/storage.dart';

//whole homepage tab views

List tabViewList = [
  const TabIndex(),
  const TabSearch(),
  const TabInfo(),
  const TabProfile(),
];

List<BottomNavigationBarItem> barItemList = [
  const BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
  const BottomNavigationBarItem(label: 'Search', icon: Icon(Icons.search)),
  const BottomNavigationBarItem(label: 'News', icon: Icon(Icons.info)),
  const BottomNavigationBarItem(
      label: 'Mine', icon: Icon(Icons.account_circle)),
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  getUser() async {
    AppUtil.user = await StorageUtil.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabViewList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: barItemList,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}
