import 'package:flutter/material.dart';

class FunctionButtonItem {
  final String imageUrl;
  final String title;
  final Function? onTapHandle;
  FunctionButtonItem(this.imageUrl, this.title, this.onTapHandle);
}

final List<FunctionButtonItem> list = [
  FunctionButtonItem(
      'static/images/home_profile_record.png', "Viewing records", null),
  FunctionButtonItem('static/images/home_profile_order.png', 'My Orders', null),
  FunctionButtonItem(
      'static/images/home_profile_favor.png', 'My Collection', null),
  FunctionButtonItem(
      'static/images/home_profile_id.png', 'Identification', null),
  FunctionButtonItem(
      'static/images/home_profile_message.png', 'Contact us', null),
  FunctionButtonItem(
      'static/images/home_profile_contract.png', 'Electronic Contracts', null),
  FunctionButtonItem('static/images/home_profile_wallet.png', 'Wallets', null),
  FunctionButtonItem('static/images/home_profile_house.png', "Management",
      (context) {
    bool isLogin = true; // If not login
    if (isLogin) Navigator.of(context).pushNamed('room_manage');
  })
];
