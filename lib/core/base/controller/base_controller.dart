import 'package:get/get.dart';

import '../../init/cache/locale_manager.dart';

abstract class BaseController extends GetxController {
  LocaleManager localeManager = LocaleManager.instance;
}
