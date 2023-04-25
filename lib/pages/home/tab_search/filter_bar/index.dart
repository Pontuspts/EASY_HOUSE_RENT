import 'dart:async';

import 'package:flutter/material.dart';
import 'package:EASY_HOUSE_FINDER/pages/home/tab_search/filter_bar/data.dart';
import 'package:EASY_HOUSE_FINDER/pages/home/tab_search/filter_bar/item.dart';
import 'package:EASY_HOUSE_FINDER/pages/utils/common_picker/index.dart';
import 'package:EASY_HOUSE_FINDER/pages/utils/scoped_model_helper.dart';
import 'package:EASY_HOUSE_FINDER/scoped_model/room_filter.dart';

//fliter methods not achived
class FilterBar extends StatefulWidget {
  final ValueChanged<FilterBarResult>? onChange;

  const FilterBar({Key? key, this.onChange}) : super(key: key);

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  bool isAreaActive = false;
  bool isRentTypeActive = false;
  bool isPriceActive = false;
  bool isFilterActive = false;

  String areaId = '';
  String rentTypeId = '';
  String priceId = '';
  List<String> moreIds = [];

  _onAreaChange(context) {
    setState(() {
      isAreaActive = true;
    });

    var result = CommonPicker.showPicker(
      value: 0,
      context: context,
      options: areaList.map((item) => item.name).toList(),
    );

    if (result == null) return;

    result.then((index) {
      if (index == null) return;
      setState(() {
        areaId = areaList[index].id;
      });
    }).whenComplete(() {
      setState(() {
        isAreaActive = false;
      });
    });
    _onChange();
  }

  _onRentTypeChange(context) {
    setState(() {
      isRentTypeActive = true;
    });

    var result = CommonPicker.showPicker(
      value: 0,
      context: context,
      options: rentTypeList.map((item) => item.name).toList(),
    );

    if (result == null) return;

    result.then((index) {
      if (index == null) return;
      setState(() {
        rentTypeId = rentTypeList[index].id;
      });
    }).whenComplete(() {
      setState(() {
        isRentTypeActive = false;
      });
    });
    _onChange();
  }

  _onPriceChange(context) {
    setState(() {
      isPriceActive = !isPriceActive;
    });
    var result = CommonPicker.showPicker(
        value: 0,
        context: context,
        options: priceList.map((item) => item.name).toList());

    if (result == null) return;

    result.then((index) {
      if (index == null) return;
      setState(() {
        areaId = priceList[index].id;
      });
    });
    result.whenComplete(() {
      setState(() {
        isPriceActive = false;
      });
    });
    _onChange();
  }

  // _onFilterChange(context) {
  //   Scaffold.of(context).openEndDrawer();
  // }

  _onChange() {
    var selectedList =
        //It encapsulates the state of the FilterBar component and some methods to handle state changes.
        ScopedModelHelper.getModel<FilterBarModel>(context).selectedList;
    if (widget.onChange != null) {
      widget.onChange!(
        FilterBarResult(
          areaId: areaId,
          rentTypeId: rentTypeId,
          priceId: priceId,
          moreId: moreIds,
          moreIds: selectedList.toList(),
        ),
      );
    }
  }

  _getData() {
    Map<String, List<GeneralType>> dataList = <String, List<GeneralType>>{};
    dataList['roomTypeList'] = roomTypeList;
    dataList['orientedList'] = orientedList;
    dataList['floorList'] = floorList;

    ScopedModelHelper.getModel<FilterBarModel>(context).dataList = dataList;
  }

  @override
  void initState() {
    Timer.run(_getData);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _onChange();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 51,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // three tab
          Item(
            title: 'Area',
            isActive: isAreaActive,
            onTap: _onAreaChange,
          ),
          Item(
            title: 'Method',
            isActive: isRentTypeActive,
            onTap: _onRentTypeChange,
          ),
          Item(
            title: 'Rent',
            isActive: isPriceActive,
            onTap: _onPriceChange,
          ),
          // Item(
          //   title: 'Filter',
          //   isActive: isFilterActive,
          //   onTap: _onFilterChange,
          // ),
        ],
      ),
    );
  }
}
