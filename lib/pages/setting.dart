import 'package:flutter/material.dart';
import 'package:EASY_HOUSE_FINDER/pages/utils/common_toast.dart';
import 'package:EASY_HOUSE_FINDER/tools/storage.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Setting')),
      body: ListView(
        children: [
          //like iconbutton
          ElevatedButton(
            // style: ElevatedButton.styleFrom(primary: Colors.red),
            onPressed: () async {
              await StorageUtil.clear();
              Navigator.pushReplacementNamed(context, '/home');

              CommonToast.showToast('Already logged out.');
            },
            child: const Text('Log out'),
          )
        ],
      ),
    );
  }
}
