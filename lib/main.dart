import 'package:appcent/view/splash/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'core/init/cache/locale_manager.dart';
import 'core/base/binding/base_bindings.dart';
import 'core/init/routes/app_pages.dart';
import 'core/init/theme/app_theme_light.dart';

void main() async {
  await _mainAsync();
  runApp(const MyApp());
}

Future<void> _mainAsync() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocaleManager.prefrencesInit();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: ((context, orientation, deviceType) {
      return GetMaterialApp(
          theme: AppThemeLight.instance.theme,
          getPages: AppPages.pages,
          initialBinding: BaseBinding(),
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.native,
          home: const SplashView());
    }));
  }
}
