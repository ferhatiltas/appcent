import 'package:appcent/core/base/view/base_view.dart';
import 'package:appcent/view/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constants/assets/animation_constants.dart';

class SplashView extends BaseView<SplashController> {
  const SplashView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=> controller.isAnimationLoading  ? Center(child: Lottie.asset(AnimationConstants.instance.splashAnimation)) : Container()),
    );
  }
}