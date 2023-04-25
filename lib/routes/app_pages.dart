import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:EASY_HOUSE_FINDER/pages/home/index.dart';
import 'package:EASY_HOUSE_FINDER/pages/login.dart';
import 'package:EASY_HOUSE_FINDER/pages/register.dart';
import 'package:EASY_HOUSE_FINDER/pages/room_manage/index.dart';
import 'package:EASY_HOUSE_FINDER/pages/setting.dart';
import 'package:EASY_HOUSE_FINDER/widgets/page_content.dart';

part 'app_routes.dart';

// ignore_for_file: constant_identifier_names
class AppPages {
  static const INITIAL = Routes.HOME;
  static final routePages = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterPage(),
    ),
    GetPage(
      name: Routes.SETTING,
      page: () => const SettingPage(),
    ),
    GetPage(
      name: Routes.SEARCH,
      page: () => const PageContent(name: 'search'),
    ),
    GetPage(
      name: Routes.ROOM_MANAGE,
      page: () => const RoomManagePage(),
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        // GetPage(
        //   name: Routes.ROOM_DETAIL,
        //   page: () => const RoomDetailPage(),
        // ),
      ],
    ),
  ];
}
