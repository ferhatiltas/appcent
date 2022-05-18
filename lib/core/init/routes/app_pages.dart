import 'package:appcent/view/home/view/home_view.dart';
import 'package:appcent/view/navBar/view/nav_bar_view.dart';
import 'package:get/get.dart';

import '../../constants/routes/routes_constants.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.HOME, page: () =>const HomeView()),
    GetPage(name: Routes.NAV_BAR, page: () =>const NavBarView()),
  ];
}
