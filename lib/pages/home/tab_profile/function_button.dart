import 'package:flutter/material.dart';
import 'package:EASY_HOUSE_FINDER/pages/home/tab_profile/function_button_data.dart';
import 'package:EASY_HOUSE_FINDER/pages/home/tab_profile/function_button_widget.dart';
//Created a Wrap Widget that can automatically wrap,
//which contains multiple custom FunctionButtonWidget sub-elements,
//which can be used to display multiple function buttons

class FunctionButton extends StatelessWidget {
  const FunctionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 1.0,
      runSpacing: 1.0,
      children: list.map((item) => FunctionButtonWidget(item)).toList(),
    );
  }
}
