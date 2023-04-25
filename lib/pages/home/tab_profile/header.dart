import 'package:flutter/material.dart';
import 'package:EASY_HOUSE_FINDER/tools/AppUtil.dart';
//login desgin

var loginRegisterStyle = const TextStyle(fontSize: 20, color: Colors.white);

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isLogin = false;
    return isLogin ? _loginBuilder(context) : _notLoginBuilder(context);
  }

  Container _notLoginBuilder(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
      height: 95,
      decoration: const BoxDecoration(color: Colors.green),
      child: Row(
        children: [
          Container(
            height: 65,
            width: 65,
            margin: const EdgeInsets.only(right: 15),
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://tva1.sinaimg.cn/large/006y8mN6ly1g6tbgbqv2nj30i20i2wen.jpg'),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              AppUtil.user == null
                  ? Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(context, 'login'),
                          child: Text('Login', style: loginRegisterStyle),
                        ),
                        Text(' / ', style: loginRegisterStyle),
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(context, 'register'),
                          child: Text('Register', style: loginRegisterStyle),
                        ),
                      ],
                    )
                  : Text(AppUtil.user!.username!, style: loginRegisterStyle),
              AppUtil.user == null
                  ? const Text(
                      'Sign in to experience more',
                      style: TextStyle(color: Colors.white),
                    )
                  : const Text(
                      'Im ICT student',
                      style: TextStyle(color: Colors.white),
                    ),
            ],
          )
        ],
      ),
    );
  }

  Container _loginBuilder(BuildContext context) {
    String userName = 'Logged in user name';
    String userImage =
        'https://tva1.sinaimg.cn/large/006y8mN6ly1g6tbnovh8jj30hr0hrq3l.jpg';

    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
      height: 95,
      decoration: const BoxDecoration(color: Colors.green),
      child: Row(
        children: [
          Container(
              height: 65,
              width: 65,
              margin: const EdgeInsets.only(right: 15),
              child: CircleAvatar(backgroundImage: NetworkImage(userImage))),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Text(
                userName,
                style: loginRegisterStyle,
              ),
              const Text(
                'View editorial profile',
                style: TextStyle(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
