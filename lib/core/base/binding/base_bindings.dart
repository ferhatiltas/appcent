
import 'package:appcent/view/home/controller/home_controller.dart';
import 'package:appcent/view/navBar/controller/nav_bar_controller.dart';
import 'package:appcent/view/splash/controller/splash_controller.dart';
import 'package:get/get.dart';


class BaseBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<SplashController>(() => SplashController(), fenix: true);
    Get.lazyPut<NavBarController>(() => NavBarController(), fenix: true);
  }
}
