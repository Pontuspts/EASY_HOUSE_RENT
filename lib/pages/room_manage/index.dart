import 'package:flutter/material.dart';
import 'package:EASY_HOUSE_FINDER/pages/home/tab_search/data_list.dart';
import 'package:EASY_HOUSE_FINDER/widgets/common_floating_button.dart';
import 'package:EASY_HOUSE_FINDER/widgets/root_list_item_widget.dart';

//Managementpage
class RoomManagePage extends StatelessWidget {
  const RoomManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CommonFloatingActionButton(
          'Post a property',
          () => Navigator.pushNamed(context, 'room_add'),
        ),
        appBar: AppBar(
          title: const Text('Management'),
          bottom: const TabBar(tabs: [
            Tab(text: 'Rented'),
            Tab(text: 'Vacant'),
          ]),
        ),
        body: TabBarView(children: [
          ListView(
            children:
                dataList.map((item) => RoomListItemWidget(data: item)).toList(),
          ),
          ListView(
            children:
                dataList.map((item) => RoomListItemWidget(data: item)).toList(),
          )
        ]),
      ),
    );
  }
}
