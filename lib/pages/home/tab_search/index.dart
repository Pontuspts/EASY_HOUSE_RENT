import 'package:flutter/material.dart';
import 'package:EASY_HOUSE_FINDER/pages/home/tab_search/data_list.dart';
import 'package:EASY_HOUSE_FINDER/pages/home/tab_search/filter_bar/filter_drawer.dart';
import 'package:EASY_HOUSE_FINDER/pages/home/tab_search/filter_bar/index.dart';
import 'package:EASY_HOUSE_FINDER/widgets/root_list_item_widget.dart';
import 'package:EASY_HOUSE_FINDER/widgets/search_bar/index.dart';

class TabSearch extends StatefulWidget {
  const TabSearch({Key? key}) : super(key: key);

  @override
  State<TabSearch> createState() => _TabSearchState();
}

class _TabSearchState extends State<TabSearch> {
  @override
  //Tab color
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const FilterDrawer(),
      appBar: AppBar(
        // Remove the default button of endDrawer
        actions: [Container()],
        elevation: 0,
        // backgroundColor: Colors.white,
        title: SearchBar(
          showLocation: true,
          showMap: true,
          inputValue: '',
          onSearch: () {
            Navigator.of(context).pushNamed('search');
          },
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 41,
            child: FilterBar(),
          ),
          Expanded(
              child: ListView(
                  children: dataList
                      .map((item) => RoomListItemWidget(data: item))
                      .toList()))
        ],
      ),
    );
  }
}
