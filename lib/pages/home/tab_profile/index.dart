import 'package:flutter/material.dart';
import 'package:EASY_HOUSE_FINDER/pages/home/tab_profile/function_button.dart';
import 'package:EASY_HOUSE_FINDER/pages/home/tab_profile/header.dart';

//user shows
class TabProfile extends StatelessWidget {
  const TabProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mine'),
        elevation: 0,
        actions: [
          //setting jump
          IconButton(
              onPressed: () => Navigator.pushNamed(context, 'setting'),
              icon: const Icon(Icons.settings))
        ],
      ),
      body: ListView(
        children: const [
          Header(),
          FunctionButton(),
        ],
      ),
    );
  }
}
