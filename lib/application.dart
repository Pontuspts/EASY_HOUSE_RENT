// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:EASY_HOUSE_FINDER/routes/app_pages.dart';
import 'package:EASY_HOUSE_FINDER/scoped_model/room_filter.dart';
import 'package:scoped_model/scoped_model.dart';

//Manage state and pass data for fliter bar, not achieved
class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //It encapsulates the state of the FilterBar component and some methods to handle state changes.
    return ScopedModel(
      model: FilterBarModel(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        enableLog: true,
        theme: ThemeData(primarySwatch: Colors.green),
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routePages,
      ),
    );
  }
}
