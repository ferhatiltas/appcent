import 'package:get/get.dart';

import '../../../../../core/base/controller/base_controller.dart';
import '../../../../../core/constants/routes/routes_constants.dart';

class SplashController extends BaseController {
  final _isAnimationLoading = false.obs;
  bool get isAnimationLoading => _isAnimationLoading.value;
  set isAnimationLoading(bool val) => _isAnimationLoading.value = val;

  @override
  void onInit() {
    startDuration();
    super.onInit();
  }

  Future<void> startDuration() async {
    isAnimationLoading = true;
    await Future.delayed(const Duration(milliseconds: 900));
    isAnimationLoading = false;
    Get.offAndToNamed(Routes.NAV_BAR);
  }
}
