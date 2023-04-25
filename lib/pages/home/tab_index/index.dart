import 'package:flutter/material.dart';
import 'package:EASY_HOUSE_FINDER/pages/home/info/index.dart';
import 'package:EASY_HOUSE_FINDER/pages/home/tab_index/index_navigator.dart';
import 'package:EASY_HOUSE_FINDER/widgets/common_swiper.dart';
import 'package:EASY_HOUSE_FINDER/widgets/search_bar/index.dart';

class TabIndex extends StatelessWidget {
  const TabIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SearchBar(
          showLocation: true,
          showMap: true,
          inputValue: '',
          onSearch: () {
            Navigator.of(context).pushNamed('search');
          },
        ),
      ),
      body: ListView(
        children: const [
          CommonSwiper(),
          IndexNavigator(),

          // Show Info News
          Info(showTitle: true),
        ],
      ),
    );
  }
}
